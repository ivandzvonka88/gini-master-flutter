// import 'package:credit_card_type_detector/credit_card_type_detector.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_masked_text/flutter_masked_text.dart';
// import 'package:form_field_validator/form_field_validator.dart';
// import 'package:gini/Models/checkout/checkout_form.dart';
//
// class CardNumber extends StatefulWidget {
//   CardNumber({@required this.model});
//   final CheckoutFormModel model;
//   @override
//   _CardNumberState createState() => _CardNumberState();
// }
//
// class _CardNumberState extends State<CardNumber> {
//   final _cardNumberController =
//       MaskedTextController(mask: '0000 0000 0000 0000');
//   var cardType;
//
//   bool autoValidate = false;
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final mediaQuery = MediaQuery.of(context);
//     return TextFormField(
//       autovalidate: autoValidate,
//       controller: _cardNumberController,
//       keyboardType: TextInputType.number,
//       onEditingComplete: () {
//         if (!autoValidate) {
//           setState(() {
//             autoValidate = true;
//           });
//         }
//       },
//       onSaved: (value) {
//         widget.model.cardNumber = value;
//       },
//       onChanged: (value) {
//         var type = detectCCType(value);
//         switch (type) {
//           case CreditCardType.visa:
//             if (cardType != "visa") {
//               setState(() {
//                 cardType = "visa";
//               });
//             }
//             break;
//           case CreditCardType.amex:
//             if (cardType != "amex") {
//               setState(() {
//                 cardType = "amex";
//               });
//             }
//             break;
//           case CreditCardType.discover:
//             if (cardType != "discover") {
//               setState(() {
//                 cardType = "discover";
//               });
//             }
//             break;
//           case CreditCardType.mastercard:
//             if (cardType != "mastercard") {
//               setState(() {
//                 cardType = "mastercard";
//               });
//             }
//             break;
//           case CreditCardType.dinersclub:
//             // TODO: Handle this case.
//             if (cardType != null) {
//               setState(() {
//                 cardType = null;
//               });
//             }
//             break;
//           case CreditCardType.jcb:
//             if (cardType != "jcb") {
//               setState(() {
//                 cardType = "jcb";
//               });
//             }
//             break;
//           case CreditCardType.unionpay:
//             if (cardType != "unionpay") {
//               setState(() {
//                 cardType = "unionpay";
//               });
//             }
//             break;
//           case CreditCardType.maestro:
//             if (cardType != "maestro") {
//               setState(() {
//                 cardType = "maestro";
//               });
//             }
//             break;
//           case CreditCardType.elo:
//             // TODO: Handle this case.
//             if (cardType != null) {
//               setState(() {
//                 cardType = null;
//               });
//             }
//             break;
//           case CreditCardType.mir:
//             // TODO: Handle this case.
//             if (cardType != null) {
//               setState(() {
//                 cardType = null;
//               });
//             }
//             break;
//           case CreditCardType.hiper:
//             // TODO: Handle this case.
//             if (cardType != null) {
//               setState(() {
//                 cardType = null;
//               });
//             }
//             break;
//           case CreditCardType.hipercard:
//             // TODO: Handle this case.
//             if (cardType != null) {
//               setState(() {
//                 cardType = null;
//               });
//             }
//             break;
//           case CreditCardType.unknown:
//             if (cardType != null) {
//               setState(() {
//                 cardType = null;
//               });
//             }
//             break;
//         }
//       },
//       validator: MultiValidator([
//         RequiredValidator(errorText: "Card number is required"),
//         MinLengthValidator(19, errorText: "Credit card number is short"),
//       ]),
//       decoration: InputDecoration(
//           suffixIcon: cardType != null
//               ? Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                   child: Container(
//                     height: 32.0,
//                     width: 32.0,
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                         image: ExactAssetImage("assets/payment/$cardType.png"),
//                       ),
//                     ),
//                   ),
//                 )
//               : SizedBox.shrink(),
//           contentPadding:
//               EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
//           hintStyle: TextStyle(
//               fontWeight: FontWeight.w500,
//               fontSize: 15,
//               color: Color.fromRGBO(83, 91, 98, 1),
//               height: mediaQuery.textScaleFactor * 1.07),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12.0),
//             // borderSide: BorderSide(
//             //   color: Color(0xFFDBE2E9),
//             // ),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12.0),
//             borderSide: BorderSide(
//               color: Color(0xFFDBE2E9),
//             ),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12.0),
//             borderSide: BorderSide(
//               color: theme.primaryColor,
//             ),
//           ),
//           hintText: "Card Number"),
//       style: TextStyle(
//           fontWeight: FontWeight.w500,
//           fontSize: 15,
//           color: Color.fromRGBO(31, 30, 30, 1),
//           height: mediaQuery.textScaleFactor * 1.07),
//     );
//   }
//
//   @override
//   void dispose() {
//     _cardNumberController.dispose();
//     super.dispose();
//   }
// }
