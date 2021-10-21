// See https://github.com/dialogflow/dialogflow-fulfillment-nodejs
// for Dialogflow fulfillment library docs, samples, and to report issues
'use strict';

var admin = require('firebase-admin');
const functions = require('firebase-functions');
const { WebhookClient } = require('dialogflow-fulfillment');
const { Card, Suggestion } = require('dialogflow-fulfillment');

process.env.DEBUG = 'dialogflow:debug'; // enables lib debugging statements
admin.initializeApp(functions.config().firebase);
const db = admin.firestore();

exports.dialogflowFirebaseFulfillment = functions.https.onRequest((request, response) => {
    const agent = new WebhookClient({ request, response });
    console.log('Dialogflow Request headers: ' + JSON.stringify(request.headers));
    console.log('Dialogflow Request body: ' + JSON.stringify(request.body));

    async function savePhoneNumber(agent) {
        const phoneNumber = request.body.queryResult.queryText;
        const user = request.body.originalDetectIntentRequest.payload.user;
        let docId;

        let userRef = await db
            .collection('users')
            .where('userId', '==', user)
            .get();

        userRef.docs.forEach(doc => {
            return (docId = doc.id);
        });

        let documentReference = db.collection('users').doc(docId);

        return db
            .runTransaction(t => {
                t.set(documentReference, { phoneNumber }, { merge: true });
                return Promise.resolve('Write complete');
            })
            .then(doc => {
                return agent.add(
                    `Thanks! Welcome to Gini : Beta v1, I'll save ${phoneNumber} in your file so that we can call you to verify. You can make requests by simply typing it. For example, "I want to go see Formula 1 racing in Monaco!`,
                );
            })
            .catch(err => {
                console.log(err);
                agent.add(
                    `Failed to save "${phoneNumber}"! Please try again, check internet connection.`,
                );
            });
    }

    async function miscellaneousHelp(agent) {
        // Need to check if user has phone number in database
        var user = request.body.originalDetectIntentRequest.payload.user;
        let docId;

        let userRef = await db
            .collection('users')
            .where('userId', '==', user)
            .get();

        userRef.docs.forEach(doc => {
            return (docId = doc.id);
        });

        // let userDoc = await db
        //     .collection('users')
        //     .doc(docId)
        //     .get();
        let phoneNumber = userDoc.data().phoneNumber;
        let name = encodeURIComponent(userDoc.data().name);
        let queryText = encodeURIComponent(request.body.queryResult.queryText);

        var options = {
            to: '+17734952387',
            from: '+13125844898',
            url: `https://handler.twilio.com/twiml/EH754d337dea888612678e438a1172cea4?Name=${name}&queryText=${queryText}&userPhone=${phoneNumber}`,
        };

        return client.calls
            .create(options)
            .then(call => {
                return agent.add(
                    'Thanks for your request through Gini. Our next available representative will call you in less than one minute to confirm your request.',
                );
            })

            .catch(error => {
                console.log(error);
                return agent.add(error);
            });
    }


    // // Uncomment and edit to make your own intent handler
    // // uncomment `intentMap.set('your intent name here', yourFunctionHandler);`
    // // below to get this function to be run when a Dialogflow intent is matched
    // function yourFunctionHandler(agent) {
    //   agent.add(`This message is from Dialogflow's Cloud Functions for Firebase editor!`);
    //   agent.add(new Card({
    //       title: `Title: this is a card title`,
    //       imageUrl: 'https://developers.google.com/actions/images/badges/XPM_BADGING_GoogleAssistant_VER.png',
    //       text: `This is the body text of a card.  You can even use line\n  breaks and emoji! 💁`,
    //       buttonText: 'This is a button',
    //       buttonUrl: 'https://assistant.google.com/'
    //     })
    //   );
    //   agent.add(new Suggestion(`Quick Reply`));
    //   agent.add(new Suggestion(`Suggestion`));
    //   agent.setContext({ name: 'weather', lifespan: 2, parameters: { city: 'Rome' }});
    // }

    // // Uncomment and edit to make your own Google Assistant intent handler
    // // uncomment `intentMap.set('your intent name here', googleAssistantHandler);`
    // // below to get this function to be run when a Dialogflow intent is matched
    // function googleAssistantHandler(agent) {
    //   let conv = agent.conv(); // Get Actions on Google library conv instance
    //   conv.ask('Hello from the Actions on Google client library!') // Use Actions on Google library
    //   agent.add(conv); // Add Actions on Google library responses to your agent's response
    // }
    // // See https://github.com/dialogflow/dialogflow-fulfillment-nodejs/tree/master/samples/actions-on-google
    // // for a complete Dialogflow fulfillment library Actions on Google client library v2 integration sample

    // Run the proper function handler based on the matched Dialogflow intent name
    let intentMap = new Map();
    intentMap.set('Miscellaneous Help - Initiate Call', miscellaneousHelp);
    intentMap.set('Save Phone Number', savePhoneNumber);
    // intentMap.set('your intent name here', yourFunctionHandler);
    // intentMap.set('your intent name here', googleAssistantHandler);
    agent.handleRequest(intentMap);

});
