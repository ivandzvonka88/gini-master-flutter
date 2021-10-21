import 'package:flutter/material.dart';

LinearGradient linearGradient = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Color.fromRGBO(122, 110, 249, 1),
    Color.fromRGBO(160, 75, 202, 1),
  ],
);

// String validateEmail(String value) {
//   Pattern pattern =
//       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//   RegExp regex = new RegExp(pattern);
//   if (!regex.hasMatch(value))
//     return 'Enter Valid Email';
//   else
//     return null;
// }

// class WrongPasswordValidator extends TextFieldValidator {
//   WrongPasswordValidator({@required String errorText}) : super(errorText);
//
//   @override
//   bool isValid(String value) {
//     return false;
//   }
// }
//
// class WrongEmailValidator extends TextFieldValidator {
//   WrongEmailValidator({@required String errorText, @required this.isWrongEmail})
//       : super(errorText);
//   final bool isWrongEmail;
//   @override
//   bool isValid(String value) {
//     return !isWrongEmail;
//   }
// }
