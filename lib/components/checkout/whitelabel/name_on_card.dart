// import 'package:flutter/material.dart';
// import 'package:form_field_validator/form_field_validator.dart';
// import 'package:gini/Models/checkout/checkout_form.dart';
// import 'package:gini/components/auth/email/custom_validators.dart';
//
// class NameOnCard extends StatefulWidget {
//   NameOnCard({@required this.model});
//   final CheckoutFormModel model;
//   @override
//   _NameOnCardState createState() => _NameOnCardState();
// }
//
// class _NameOnCardState extends State<NameOnCard> {
//   bool autoValidate = false;
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final mediaQuery = MediaQuery.of(context);
//     return TextFormField(
//       autovalidate: autoValidate,
//       keyboardType: TextInputType.name,
//       onSaved: (value) {
//         widget.model.nameOnCard = value;
//       },
//       onEditingComplete: () {
//         if (!autoValidate) {
//           setState(() {
//             autoValidate = true;
//           });
//         }
//       },
//       validator: MultiValidator([
//         RequiredValidator(errorText: "Name required"),
//         FullNameValidator(errorText: "Only alphabets allowed")
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
//           hintText: "Name on card"),
//       style: TextStyle(
//           fontWeight: FontWeight.w500,
//           fontSize: 15,
//           color: Color.fromRGBO(31, 30, 30, 1),
//           height: mediaQuery.textScaleFactor * 1.07),
//     );
//   }
// }
