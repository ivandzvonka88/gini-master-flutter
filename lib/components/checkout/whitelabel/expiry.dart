// import 'package:flutter/material.dart';
// import 'package:flutter_masked_text/flutter_masked_text.dart';
// import 'package:form_field_validator/form_field_validator.dart';
// import 'package:gini/Models/checkout/checkout_form.dart';
// import 'package:gini/components/auth/email/custom_validators.dart';
//
// class CardExpiry extends StatefulWidget {
//   CardExpiry({@required this.model});
//   final CheckoutFormModel model;
//   @override
//   _CardExpiryState createState() => _CardExpiryState();
// }
//
// class _CardExpiryState extends State<CardExpiry> {
//   var _cardExpiryController;
//   var autoValidate = false;
//
//   @override
//   void initState() {
//     _cardExpiryController = MaskedTextController(
//       mask: '00/00',
//     );
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final mediaQuery = MediaQuery.of(context);
//     return TextFormField(
//       keyboardType: TextInputType.number,
//       autovalidate: autoValidate,
//       onChanged: (value) {
//         if (!autoValidate) {
//           setState(() {
//             autoValidate = true;
//           });
//         }
//       },
//       onSaved: (value) {
//         widget.model.expiry = value;
//       },
//       controller: _cardExpiryController,
//       validator: MultiValidator([
//         RequiredValidator(errorText: "Card expiry is required"),
//         MinLengthValidator(4, errorText: ""),
//         ExpiryValidator(errorText: "Invalid date"),
//       ]),
//       decoration: InputDecoration(
//           isCollapsed: true,
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
//           hintText: "Expiry"),
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
//     _cardExpiryController.dispose();
//     super.dispose();
//   }
// }
