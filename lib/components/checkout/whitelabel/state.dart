// import 'package:flutter/material.dart';
// import 'package:form_field_validator/form_field_validator.dart';
// import 'package:gini/Models/checkout/checkout_form.dart';
// import 'package:gini/components/auth/email/custom_validators.dart';
//
// class CheckoutState extends StatefulWidget {
//   CheckoutState({@required this.model});
//   final CheckoutFormModel model;
//   @override
//   _CheckoutStateState createState() => _CheckoutStateState();
// }
//
// class _CheckoutStateState extends State<CheckoutState> {
//   bool autoValidate = false;
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final mediaQuery = MediaQuery.of(context);
//     return TextFormField(
//       autovalidate: autoValidate,
//       keyboardType: TextInputType.name,
//       validator:
//           MultiValidator([RequiredValidator(errorText: "State is required"),NameValidator(errorText: "Only alphabets allowed")]),
//       onSaved: (value) {
//         widget.model.state = value;
//       },
//       onEditingComplete: (){
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
//             borderRadius: BorderRadius.zero,
//             // borderSide: BorderSide(
//             //   color: Color(0xFFDBE2E9),
//             // ),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.zero,
//             borderSide: BorderSide(
//               color: Color(0xFFDBE2E9),
//             ),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.zero,
//             borderSide: BorderSide(
//               color: theme.primaryColor,
//             ),
//           ),
//           hintText: "State"),
//       style: TextStyle(
//           fontWeight: FontWeight.w500,
//           fontSize: 15,
//           color: Color.fromRGBO(31, 30, 30, 1),
//           height: mediaQuery.textScaleFactor * 1.07),
//     );
//   }
// }
