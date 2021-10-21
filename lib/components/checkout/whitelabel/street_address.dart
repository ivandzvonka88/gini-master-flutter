// import 'package:flutter/material.dart';
// import 'package:form_field_validator/form_field_validator.dart';
// import 'package:gini/Models/checkout/checkout_form.dart';
//
// class CheckoutStreetAddress extends StatefulWidget {
//   CheckoutStreetAddress({@required this.model});
//   final CheckoutFormModel model;
//   @override
//   _CheckoutStreetAddressState createState() => _CheckoutStreetAddressState();
// }
//
// class _CheckoutStreetAddressState extends State<CheckoutStreetAddress> {
//   bool autoValidate = false;
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final mediaQuery = MediaQuery.of(context);
//     return TextFormField(
//       autovalidate: autoValidate,
//       keyboardType: TextInputType.text,
//       validator: MultiValidator(
//           [RequiredValidator(errorText: "Street address is required")]),
//       onSaved: (value) {
//         widget.model.streetAddress = value;
//       },
//       onEditingComplete: (){
//         if (!autoValidate) {
//           setState(() {
//             autoValidate = true;
//           });
//         }
//       },
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
//           hintText: "Street Address"),
//       style: TextStyle(
//           fontWeight: FontWeight.w500,
//           fontSize: 15,
//           color: Color.fromRGBO(31, 30, 30, 1),
//           height: mediaQuery.textScaleFactor * 1.07),
//     );
//   }
// }
