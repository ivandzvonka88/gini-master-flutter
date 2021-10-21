// import 'package:flutter/material.dart';
// import 'package:gini/Models/checkout/checkout_form.dart';
// import 'package:gini/app/config/constants.dart';
// import 'package:stripe_payment/stripe_payment.dart';
//
// class PlaceOrderButton extends StatefulWidget {
//   PlaceOrderButton(
//       {@required this.model, @required this.form, @required this.scaffoldKey});
//   final CheckoutFormModel model;
//   final GlobalKey<FormState> form;
//   final GlobalKey<ScaffoldState> scaffoldKey;
//
//   @override
//   _PlaceOrderButtonState createState() => _PlaceOrderButtonState();
// }
//
// class _PlaceOrderButtonState extends State<PlaceOrderButton> {
//   var isProcessing = false;
//   @override
//   void initState() {
//     StripePayment.setOptions(
//       StripeOptions(
//           publishableKey: "pk_live_8A7oDgMLrqnrsoWmuyEyQ06c00PrLHWDHU",
//           merchantId: 'merchant.com.theginigroup.giniapp',
//           androidPayMode: 'test'),
//     );
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context);
//     return Column(
//       children: [
//         Container(
//           width: 245.0,
//           height: 64.0,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(50.0),
//             gradient: linearGradient,
//           ),
//           child: Material(
//             color: Colors.transparent,
//             child: InkWell(
//               borderRadius: BorderRadius.circular(50.0),
//               child: Center(
//                 child: Text(
//                   "Place Order",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18.0,
//                       fontWeight: FontWeight.bold,
//                       height: mediaQuery.textScaleFactor * 1.16),
//                 ),
//               ),
//               onTap: () async {
//                 if (widget.form.currentState.validate()) {
//                   setState(() {
//                     isProcessing = true;
//                   });
//                   widget.form.currentState.save();
//                   try {
//                     final creditCard = CreditCard(
//                       name: widget.model.nameOnCard,
//                       number: widget.model.cardNumber,
//                       expMonth: int.parse(widget.model.expiry.split("/").first),
//                       expYear: int.parse(widget.model.expiry.split("/").last),
//                       cvc: widget.model.cvv,
//                       addressLine1: widget.model.streetAddress,
//                       addressCity: widget.model.city,
//                       addressState: widget.model.state,
//                       addressZip: widget.model.zipCode,
//                     );
//
//                     final paymentMethod =
//                         await StripePayment.createPaymentMethod(
//                             PaymentMethodRequest(card: creditCard));
//                     print(paymentMethod);
//                     widget.scaffoldKey.currentState.removeCurrentSnackBar();
//                     widget.scaffoldKey.currentState.showSnackBar(SnackBar(
//                       content: Text("${paymentMethod.id}"),
//                     ));
//                     setState(() {
//                       isProcessing = false;
//                     });
//                   } catch (error) {
//                     widget.scaffoldKey.currentState.removeCurrentSnackBar();
//                     widget.scaffoldKey.currentState.showSnackBar(SnackBar(
//                       content: Text("${error.message}"),
//                     ));
//                     setState(() {
//                       isProcessing = false;
//                     });
//                   }
//                 }
//               },
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 30.0,
//         ),
//         isProcessing ? CircularProgressIndicator() : SizedBox.shrink()
//       ],
//     );
//   }
// }
