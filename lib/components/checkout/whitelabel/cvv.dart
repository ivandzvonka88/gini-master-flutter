// import 'package:flutter/material.dart';
// import 'package:flutter_masked_text/flutter_masked_text.dart';
// import 'package:form_field_validator/form_field_validator.dart';
// import 'package:gini/Models/checkout/checkout_form.dart';
// import 'package:gini/components/auth/email/custom_validators.dart';
//
// class CardCvv extends StatefulWidget {
//   CardCvv({@required this.model});
//   final CheckoutFormModel model;
//   @override
//   _CardCvvState createState() => _CardCvvState();
// }
//
// class _CardCvvState extends State<CardCvv> {
//   final _cardCvvController = MaskedTextController(mask: '000');
//   var autoValidate = false;
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final mediaQuery = MediaQuery.of(context);
//     return TextFormField(
//       autovalidate: autoValidate,
//       controller: _cardCvvController,
//       keyboardType: TextInputType.number,
//       onEditingComplete: (){
//         if (!autoValidate) {
//           setState(() {
//             autoValidate = true;
//           });
//         }
//       },
//       onSaved: (value) {
//         widget.model.cvv = value;
//       },
//       validator: MultiValidator([
//         RequiredValidator(errorText: "CVV is required"),
//         MinLengthValidator(3, errorText: "CVV is short"),
//         NumberValidator(errorText: "Numbers only")
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
//           hintText: "CVV"),
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
//     _cardCvvController.dispose();
//     super.dispose();
//   }
// }
