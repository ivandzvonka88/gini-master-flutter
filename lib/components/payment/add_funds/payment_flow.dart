// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cloud_functions/cloud_functions.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:gini/components/payment/add_funds/payment_successful.dart';
// import 'package:gini/pages/payment/add_funds.dart';
// import 'package:stripe_payment/stripe_payment.dart';
//
// void _addPaymentToFirestore(
//     {@required double currentBalance,
//     @required double amount,
//     @required GlobalKey<ScaffoldState> scaffoldKey,
//     @required Function(bool isProcessing) changeState,
//     @required BuildContext context,
//     @required User user}) async {
//   try {
//     changeState(true);
//     await fireStoreInstance
//         .collection('users')
//         .doc(user.uid)
//         .collection("transactions")
//         .add({
//       'amount': amount,
//       "created": FieldValue.serverTimestamp(),
//     });
//     await fireStoreInstance
//         .collection('users')
//         .doc(user.uid)
//         .update({'balance': currentBalance + amount});
//     scaffoldKey.currentState.removeCurrentSnackBar();
//     scaffoldKey.currentState.showSnackBar(
//       SnackBar(
//         content: Text('$amount added to your app account'),
//       ),
//     );
//     changeState(false);
//
//     Future.delayed(Duration(seconds: 1));
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//           builder: (context) => PaymentSuccessfulPage(),
//           fullscreenDialog: true),
//     );
//   } catch (error) {
//     scaffoldKey.currentState.removeCurrentSnackBar();
//     scaffoldKey.currentState.showSnackBar(
//       SnackBar(
//         content: Text(error.code.toString()),
//       ),
//     );
//   }
// }
//
// final HttpsCallable INTENT =
//     CloudFunctions.instance.getHttpsCallable(functionName: 'payment');
//
// startPaymentProcess(
//     {@required double currentBalance,
//     @required double actualAmount,
//     @required PaymentMethod paymentMethod,
//     @required Function(bool isProcessing) changeState,
//     @required GlobalKey<ScaffoldState> scaffoldKey,
//     @required BuildContext context,
//     @required User user}) async {
//   changeState(true);
//   double amount =
//       actualAmount * 100.0; // multiplying with 100 to change $ to cents
//   await INTENT.call(
//       <String, dynamic>{'amount': amount, 'currency': 'usd'}).then((response) {
//     changeState(false);
//     confirmDialog(
//         clientSecret: response.data["client_secret"],
//         paymentMethod: paymentMethod,
//         currentBalance: currentBalance,
//         actualAmount: actualAmount,
//         context: context,
//         scaffoldKey: scaffoldKey,
//         changeState: changeState,
//         user: user); //function for confirmation for payment
//   }).catchError((error) {
//     changeState(false);
//     scaffoldKey.currentState.removeCurrentSnackBar();
//     scaffoldKey.currentState.showSnackBar(
//       SnackBar(
//         content: Text(error.code.toString()),
//       ),
//     );
//   });
// }
//
// confirmDialog(
//     {@required String clientSecret,
//     @required PaymentMethod paymentMethod,
//     @required double currentBalance,
//     @required double actualAmount,
//     @required BuildContext context,
//     @required GlobalKey<ScaffoldState> scaffoldKey,
//     @required Function(bool isProcessing) changeState,
//     @required User user}) {
//   var confirm = AlertDialog(
//     title: Text("Confirm Payment"),
//     content: Container(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           Text("Charge amount: \$${actualAmount.toStringAsFixed(2)}")
//         ],
//       ),
//     ),
//     actions: <Widget>[
//       RaisedButton(
//         child: new Text('CANCEL'),
//         onPressed: () {
//           Navigator.of(context).pop();
//           final snackBar = SnackBar(
//             content: Text('Payment Cancelled'),
//           );
//           scaffoldKey.currentState.removeCurrentSnackBar();
//           scaffoldKey.currentState.showSnackBar(snackBar);
//         },
//       ),
//       RaisedButton(
//         child: new Text('Confirm'),
//         onPressed: () {
//           Navigator.of(context).pop();
//           confirmPayment(
//               sec: clientSecret,
//               paymentMethod: paymentMethod,
//               currentBalance: currentBalance,
//               actualAmount: actualAmount,
//               scaffoldKey: scaffoldKey,
//               changeState: changeState,
//               context: context,
//               user: user); // function to confirm Payment
//         },
//       ),
//     ],
//   );
//   showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return confirm;
//       });
// }
//
// confirmPayment(
//     {@required String sec,
//     @required PaymentMethod paymentMethod,
//     @required double currentBalance,
//     @required double actualAmount,
//     @required GlobalKey<ScaffoldState> scaffoldKey,
//     @required Function(bool isProcessing) changeState,
//     @required BuildContext context,
//     @required User user}) async {
//   scaffoldKey.currentState.removeCurrentSnackBar();
//   scaffoldKey.currentState.showSnackBar(
//     SnackBar(
//       content: Text(
//         "Please wait for confirmation",
//       ),
//     ),
//   );
//
//   await StripePayment.confirmPaymentIntent(
//     PaymentIntent(clientSecret: sec, paymentMethodId: paymentMethod.id),
//   ).then((val) {
//     _addPaymentToFirestore(
//         currentBalance: currentBalance,
//         amount: actualAmount,
//         scaffoldKey: scaffoldKey,
//         changeState: changeState,
//         context: context,
//         user: user);
//   }).catchError((onError) {
//     scaffoldKey.currentState.removeCurrentSnackBar();
//     scaffoldKey.currentState.showSnackBar(
//       SnackBar(
//         content: Text(
//           onError.toString(),
//         ),
//       ),
//     );
//   });
// }
//
// //  Future<void> createNativePaymentMethod() async {
// //    StripePayment.setStripeAccount(null);
// //    List<ApplePayItem> items = [];
// //    items.add(ApplePayItem(
// //      label: 'Demo Order',
// //      amount: '10',
// //    ));
// //
// //    PaymentMethod paymentMethod = PaymentMethod();
// //    Token token = await StripePayment.paymentRequestWithNativePay(
// //      androidPayOptions: AndroidPayPaymentRequest(
// //        currencyCode: 'usd',
// //        totalPrice: '10',
// //      ),
// //      applePayOptions: ApplePayPaymentOptions(
// //        countryCode: 'us',
// //        currencyCode: 'usd',
// //        items: items,
// //      ),
// //    ).catchError((error) {
// //      _scaffoldKey.currentState.removeCurrentSnackBar();
// //      _scaffoldKey.currentState.showSnackBar(
// //        SnackBar(
// //          content: Text(
// //            error.toString(),
// //          ),
// //        ),
// //      );
// //    });
// //    paymentMethod = await StripePayment.createPaymentMethod(
// //      PaymentMethodRequest(
// //        card: CreditCard(
// //          token: token.tokenId,
// //        ),
// //      ),
// //    );
// //    paymentMethod != null
// //        ? showDialog(
// //            context: context,
// //            builder: (context) => AlertDialog(
// //              title: Text("Payment unavailable"),
// //              content: Text(
// //                  "$_platformName payment option is unavailable. Do you want to pay with your credit/debit card?"),
// //              actions: <Widget>[
// //                FlatButton(
// //                  onPressed: () {
// //                    Navigator.of(context).pop();
// //                    //  startPaymentProcess();
// //                  },
// //                  child: Text("Go"),
// //                ),
// //                FlatButton(
// //                  onPressed: () {
// //                    Navigator.of(context).pop();
// //                  },
// //                  child: Text("Cancel"),
// //                ),
// //              ],
// //            ),
// //          )
// //        : showDialog(
// //            context: context,
// //            builder: (context) => AlertDialog(
// //                  title: Text("Payment Unavailable"),
// //                  content: Text(
// //                      "It is not possible to pay with this card. Please try again with a different card."),
// //                  actions: <Widget>[
// //                    FlatButton(
// //                      onPressed: () {
// //                        Navigator.of(context).pop();
// //                      },
// //                      child: Text("Cancel"),
// //                    ),
// //                  ],
// //                ));
// //  }
// //
// //  void nativePay() async {
// //    bool deviceSupportNativePay = await StripePayment.deviceSupportsNativePay();
// //    bool isNativeReady = await StripePayment.canMakeNativePayPayments(
// //        ['american_express', 'visa', 'maestro', 'master_card']);
// //    if (deviceSupportNativePay && isNativeReady) {
// //      showDialog(
// //        context: context,
// //        builder: (context) => AlertDialog(
// //          title: Text("$_platformName pay available"),
// //          content: Text(
// //              "$_platformName payment option is available. Do you want to pay with your credit/debit card?"),
// //          actions: <Widget>[
// //            FlatButton(
// //              onPressed: () {
// //                Navigator.of(context).pop();
// //                createNativePaymentMethod();
// //              },
// //              child: Text("$_platformName Pay"),
// //            ),
// //            FlatButton(
// //              onPressed: () {
// //                Navigator.of(context).pop();
// //                //    startPaymentProcess();
// //              },
// //              child: Text("Credit/debit"),
// //            ),
// //            FlatButton(
// //              onPressed: () {
// //                Navigator.of(context).pop();
// //              },
// //              child: Text("Cancel"),
// //            ),
// //          ],
// //        ),
// //      );
// //    } else {
// //      //   startPaymentProcess();
// //    }
// //  }
