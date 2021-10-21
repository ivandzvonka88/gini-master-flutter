import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class NameValidator extends TextFieldValidator {
  NameValidator({@required String errorText}) : super(errorText);

  @override
  bool isValid(String value) {
    return RegExp(r'^[a-zA-Z]+$').hasMatch(value);
  }
}

class FullNameValidator extends TextFieldValidator {
  FullNameValidator({@required String errorText}) : super(errorText);

  @override
  bool isValid(String value) {
    return RegExp(r'^[a-zA-Z\ ]+$').hasMatch(value);
  }
}

class NumberValidator extends TextFieldValidator {
  NumberValidator({@required String errorText}) : super(errorText);

  @override
  bool isValid(String value) {
    return RegExp(r'^\d+$').hasMatch(value);
  }
}

class PhoneValidator extends TextFieldValidator {
  PhoneValidator({@required String errorText}) : super(errorText);

  @override
  bool isValid(String value) {
    return RegExp(r'^\+?\d+$').hasMatch(value);
  }
}

class ExpiryValidator extends TextFieldValidator {
  ExpiryValidator({@required String errorText}) : super(errorText);

  @override
  bool isValid(String value) {
    return RegExp(r'^(?:0[1-9]|1[0-2])/[0-9]{2}').hasMatch(value);
  }
}

class CustomEmailValidator extends TextFieldValidator {
  /// regex pattern to validate email inputs.
  final Pattern _emailPattern =
      r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$";

  CustomEmailValidator({@required String errorText}) : super(errorText);

  @override
  bool isValid(String value) => hasMatch(_emailPattern, value.toLowerCase());
}
