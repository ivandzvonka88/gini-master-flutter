/**
 * Copyright 2020 Google Inc. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
'use strict';

const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();
const { Logging } = require('@google-cloud/logging');
const logging = new Logging({
  projectId: process.env.GCLOUD_PROJECT,
});

const paypal = require('paypal-rest-sdk');
// Configure your environment
paypal.configure({
  mode: 'sandbox', // sandbox or live
  client_id: functions.config().paypal.client_id, // run: firebase functions:config:set paypal.client_id="yourPaypalClientID"
  client_secret: functions.config().paypal.client_secret // run: firebase functions:config:set paypal.client_secret="yourPaypalClientSecret"
});


const stripe = require('stripe')(functions.config().stripe.secret, {
  apiVersion: '2020-03-02',
});

/**
 * When a user is created, create a Stripe customer object for them.
 *
 * @see https://stripe.com/docs/payments/save-and-reuse#web-create-customer
 */
exports.createStripeCustomer = functions.auth.user().onCreate(async (user) => {
  const customer = await stripe.customers.create({ email: user.email });
  const intent = await stripe.setupIntents.create({
    customer: customer.id,
  });
  await admin.firestore().collection('usersData').doc(user.uid).set({
    customer_id: customer.id,
    setup_secret: intent.client_secret,
  });
  return;
});

/**
 * When adding the payment method ID on the client,
 * this function is triggered to retrieve the payment method details.
 */
exports.addPaymentMethodDetails = functions.firestore
  .document('/usersData/{userId}/paymentMethods/{pushId}')
  .onCreate(async (snap, context) => {
    try {
      const paymentMethodId = snap.data().id;
      const paymentMethod = await stripe.paymentMethods.retrieve(
        paymentMethodId
      );
      await snap.ref.set(paymentMethod);
      // Create a new SetupIntent so the customer can add a new method next time.
      const intent = await stripe.setupIntents.create({
        customer: paymentMethod.customer,
      });
      await snap.ref.parent.parent.set(
        {
          setup_secret: intent.client_secret,
        },
        { merge: true }
      );
      return;
    } catch (error) {
      await snap.ref.set({ error: userFacingMessage(error) }, { merge: true });
      await reportError(error, { user: context.params.userId });
    }
  });

/**
 * When a payment document is written on the client,
 * this function is triggered to create the payment in Stripe.
 *
 * @see https://stripe.com/docs/payments/save-and-reuse#web-create-payment-intent-off-session
 */

// [START chargecustomer]

exports.createStripePayment = functions.firestore
  .document('usersData/{userId}/payments/{pushId}')
  .onCreate(async (snap, context) => {
    const { amount, currency, payment_method } = snap.data();
    try {
      // Look up the Stripe customer id.
      const customer = (await snap.ref.parent.parent.get()).data().customer_id;
      // Create a charge using the pushId as the idempotency key
      // to protect against double charges.
      const idempotencyKey = context.params.pushId;
      const payment = await stripe.paymentIntents.create(
        {
          amount,
          currency,
          customer,
          payment_method,
          off_session: false,
          confirm: true,
          confirmation_method: 'manual',
        },
        { idempotencyKey }
      );
      // If the result is successful, write it back to the database.
      await snap.ref.set(payment);
    } catch (error) {
      // We want to capture errors and render them in a user-friendly way, while
      // still logging an exception with StackDriver
      console.log(error);
      await snap.ref.set({ error: userFacingMessage(error) }, { merge: true });
      await reportError(error, { user: context.params.userId });
    }
  });

// [END chargecustomer]

/**
 * When 3D Secure is performed, we need to reconfirm the payment
 * after authentication has been performed.
 *
 * @see https://stripe.com/docs/payments/accept-a-payment-synchronously#web-confirm-payment
 */
exports.confirmStripePayment = functions.firestore
  .document('usersData/{userId}/payments/{pushId}')
  .onUpdate(async (change, context) => {
    if (change.after.data().status === 'requires_confirmation') {
      const payment = await stripe.paymentIntents.confirm(
        change.after.data().id
      );
      change.after.ref.set(payment);
    }
  });

/**
 * When a user deletes their account, clean up after them
 */
exports.cleanupUser = functions.auth.user().onDelete(async (user) => {
  const dbRef = admin.firestore().collection('usersData');
  const customer = (await dbRef.doc(user.uid).get()).data();
  await stripe.customers.del(customer.customer_id);
  // Delete the customers payments & payment methods in firestore.
  const snapshot = await dbRef
    .doc(user.uid)
    .collection('paymentMethods')
    .get();
  snapshot.forEach((snap) => snap.ref.delete());
  await dbRef.doc(user.uid).delete();
  return;
});

/**
 * To keep on top of errors, we should raise a verbose error report with Stackdriver rather
 * than simply relying on console.error. This will calculate users affected + send you email
 * alerts, if you've opted into receiving them.
 */

// [START reporterror]

function reportError(err, context = {}) {
  // This is the name of the StackDriver log stream that will receive the log
  // entry. This name can be any valid log stream name, but must contain "err"
  // in order for the error to be picked up by StackDriver Error Reporting.
  const logName = 'errors';
  const log = logging.log(logName);

  // https://cloud.google.com/logging/docs/api/ref_v2beta1/rest/v2beta1/MonitoredResource
  const metadata = {
    resource: {
      type: 'cloud_function',
      labels: { function_name: process.env.FUNCTION_NAME },
    },
  };

  // https://cloud.google.com/error-reporting/reference/rest/v1beta1/ErrorEvent
  const errorEvent = {
    message: err.stack,
    serviceContext: {
      service: process.env.FUNCTION_NAME,
      resourceType: 'cloud_function',
    },
    context: context,
  };

  // Write the error log entry
  return new Promise((resolve, reject) => {
    log.write(log.entry(metadata, errorEvent), (error) => {
      if (error) {
        return reject(error);
      }
      return resolve();
    });
  });
}

// [END reporterror]

/**
 * Sanitize the error message for the user.
 */
function userFacingMessage(error) {
  return error.type
    ? error.message
    : 'An error occurred, developers have been alerted';
}

/**
 * Expected in the body the amount
 * Set up the payment information object
 * Initialize the payment and redirect the user to the PayPal payment page
 */
exports.pay = functions.https.onRequest((req, res) => {
  // 1.Set up a payment information object, Build PayPal payment request
  const payReq = JSON.stringify({
    intent: 'sale',
    payer: {
      payment_method: 'paypal'
    },
    redirect_urls: {
      return_url: `${req.protocol}://${req.get('host')}/process`,
      cancel_url: `${req.protocol}://${req.get('host')}/cancel`
    },
    transactions: [{
      amount: {
        total: req.body.price,
        currency: 'USD'
      },
      // This is the payment transaction description. Maximum length: 127
      description: req.body.uid, // req.body.id
      // reference_id string .Optional. The merchant-provided ID for the purchase unit. Maximum length: 256.
      // reference_id: req.body.uid,
      custom: req.body.uid,
      // soft_descriptor: req.body.uid
      // "invoice_number": req.body.uid,A
    }]
  });
  // 2.Initialize the payment and redirect the user.
  paypal.payment.create(payReq, (error, payment) => {
    const links = {};
    if (error) {
      console.error(error);
      res.status('500').end();
    } else {
      // Capture HATEOAS links
      payment.links.forEach((linkObj) => {
        links[linkObj.rel] = {
          href: linkObj.href,
          method: linkObj.method
        };
      });
      // If redirect url present, redirect user
      if ( Object.prototype.hasOwnProperty.call(links, 'approval_url')) {
        // REDIRECT USER TO links['approval_url'].href
        console.info(links.approval_url.href);
        // res.json({"approval_url":links.approval_url.href});
        res.redirect(302, links.approval_url.href);
      } else {
        console.error('no redirect URI present');
        res.status('500').end();
      }
    }
  });
});

// 3.Complete the payment. Use the payer and payment IDs provided in the query string following the redirect.
exports.process = functions.https.onRequest(async (req, res) => {
  const paymentId = req.query.paymentId;
  const payerId = {
    payer_id: req.query.PayerID
  };
  const r = await paypal.payment.execute(paymentId, payerId, async (error, payment) => {
    if (error) {
      console.error(error);
      res.redirect(`${req.protocol}://${req.get('host')}/error`); // replace with your url page error
    } else {
      if (payment.state === 'approved') {
        console.info('payment completed successfully, description: ', payment.transactions[0].description);
        // console.info('req.custom: : ', payment.transactions[0].custom);
        // set paid status to True in RealTime Database
        const date = Date.now();
        const uid = payment.transactions[0].description;
        const ref = admin.firestore();
        const writeResult = await ref.collection('usersData').doc(uid).collection('paypal')
        .add(payment.transactions[0]);
        const addMoney = await ref.collection('usersData').doc(uid).collection('wallet')
        .doc('wallet').set({'amount':admin.firestore.FieldValue.increment(Number(payment.transactions[0].amount.details.subtotal) * 100),
        "amountUpdate": date},{merge:true})
//        const ref = admin.database().ref('usersData/' + uid + '/');
//        ref.push(payment.transactions)
        res.redirect(`https://angelina-cnnahw.web.app/success.html`); // replace with your url, page success
      } else {
        console.warn('payment.state: not approved ?');
        // replace debug url
        res.redirect(`https://angelina-cnnahw.web.app/failed.html`);
      }
    }
  });
  console.info('promise: ', r);
});

// create twilio task on flex workspace

exports.createTwilioTask = functions.firestore
                             .document('/usersData/{userId}/support/{pushId}')
                             .onCreate(async (snap, context) => {
const accountSid = functions.config().twilio.account_sid;
const authToken = functions.config().twilio.auth_token;
const client = require('twilio')(accountSid, authToken);
console.log(snap.data());

                try {
                 const task = await client.taskrouter.workspaces('WSc35867420ae8b0d169459d9f7bc08a4a')
                                 .tasks
                                 .create({attributes: JSON.stringify({
                                                                         "type": "call",
                                                                         "contact": snap.data().phoneNumber,
                                                                         "customer-value": "gold",
                                                                         "task-reason": "support"
                                                                     }), workflowSid: 'WW5e8a9e7e58c103f3fb206eb9b83ccf3e'});

                                 console.log(task.sid);
                                 await snap.ref.set({"callSid":task.sid},{merge:true})
                }catch (error){
                console.log(error);
                }


});