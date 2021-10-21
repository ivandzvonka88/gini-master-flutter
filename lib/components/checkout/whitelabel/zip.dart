// import 'package:flutter/material.dart';
// import 'package:form_field_validator/form_field_validator.dart';
// import 'package:gini/Models/checkout/checkout_form.dart';
// import 'package:gini/components/auth/email/custom_validators.dart';
//
// class CheckoutZip extends StatefulWidget {
//   CheckoutZip({@required this.model});
//   final CheckoutFormModel model;
//   @override
//   _CheckoutZipState createState() => _CheckoutZipState();
// }
//
// class _CheckoutZipState extends State<CheckoutZip> {
//   bool autoValidate = false;
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final mediaQuery = MediaQuery.of(context);
//     return TextFormField(
//       autovalidate: autoValidate,
//       keyboardType: TextInputType.number,
//       validator: MultiValidator([
//         RequiredValidator(errorText: "Zip code is required"),
//         NumberValidator(errorText: "Numbers only")
//       ]),
//       onSaved: (value) {
//         widget.model.zipCode = value;
//       },
//       onEditingComplete: () {
//         if (!autoValidate) {
//           setState(() {
//             autoValidate = true;
//           });
//         }
//       },
//       textAlign: TextAlign.center,
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
//             borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(12.0),
//                 bottomRight: Radius.circular(12.0)),
//             // borderSide: BorderSide(
//             //   color: Color(0xFFDBE2E9),
//             // ),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(12.0),
//                 bottomRight: Radius.circular(12.0)),
//             borderSide: BorderSide(
//               color: Color(0xFFDBE2E9),
//             ),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(12.0),
//                 bottomRight: Radius.circular(12.0)),
//             borderSide: BorderSide(
//               color: theme.primaryColor,
//             ),
//           ),
//           hintText: "Zip code"),
//       style: TextStyle(
//           fontWeight: FontWeight.w500,
//           fontSize: 15,
//           color: Color.fromRGBO(31, 30, 30, 1),
//           height: mediaQuery.textScaleFactor * 1.07),
//     );
//   }
// }
