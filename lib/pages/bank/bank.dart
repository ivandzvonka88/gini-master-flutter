//import 'dart:async';
//import 'package:flutter/material.dart';
//import 'package:flutter_stripe_payment/flutter_stripe_payment.dart';
//// import 'package:stripe_sdk/stripe_sdk.dart';
//// const publishableKey = "pk_test_JXXDFMnSRjRpwuWIsoONc90R00UkWYbHBO"; //#testkey
//// final formKey = GlobalKey<FormState>();
//// final stripe = Stripe(publishableKey);
//
//// appConfig.values.applePayMerchantId);
//
//class Bank extends StatelessWidget {
//// or, to manage your own instances
//  // final stripeApi = StripeApi("pk_test_JXXDFMnSRjRpwuWIsoONc90R00UkWYbHBO");
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Bank'),
//      ),
//      body: BankBody(),
//    );
//  }
//}
//
//class BankBody extends StatefulWidget {
//  BankBody({Key key}) : super(key: key);
//
//  @override
//  _BankBodyState createState() => _BankBodyState();
//}
//
//class _BankBodyState extends State<BankBody> {
//  void initState() async {
//    super.initState();
//    final _stripePayment = FlutterStripePayment();
//      _stripePayment.onCancel = (){
//        print("User Cancelled the Payment Method Form");
//      };
//    _stripePayment.setStripeSettings(
//        "pk_test_JXXDFMnSRjRpwuWIsoONc90R00UkWYbHBO");
//    var paymentResponse = await _stripePayment.addPaymentMethod();
//    if (paymentResponse.status == PaymentResponseStatus.succeeded) {
//      _stripePayment.setupPaymentIntent('sk_test_hwhGB37DEeCMOB6yZLC7kJR500WNxVuZbx', paymentResponse.paymentMethodId);
//      // var intent = PaymentIntent();
//      // // intent.amount = widget.order.cart.total;
//      // intent.isManual = true;
//      // intent.isConfirmed = false;
//      // intent.paymentMethodId = paymentResponse.paymentMethodId;
//      // intent.currency = "usd";
//      // intent.isOnSession = false;
//      // intent.isSuccessful = false;
//      // intent.statementDescriptor = "GINI Concierge";
//    }
//
//    // stripe.authenticatePayment(paymentIntentClientSecret)
//    // Stripe.init(publishableKey);
//    // stripe.handleSetupIntent(action)
//    // final clientSecret = await server.createPaymentIntent(Stripe.getReturnUrl());
//    // final paymentIntent = await Stripe.instance.confirmPayment(clientSecret, "pm_card_visa");
//    // stripe.confirmSetupIntentWithPaymentMethod(clientSecret, paymentMethod)
//    // CustomerSession.initCustomerSession(provider)
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child: Center(
//        child: GestureDetector(
//          child: Text(
//            "Add Payment Method",
//            style: Theme.of(context).primaryTextTheme.headline3,
//          ),
//          // onTap: () async {
//          //   if (formKey.currentState.validate()) {
//          //     formKey.currentState.save();
//          //   }
//        ),
//      ),
//    );
//  }
//}
