import 'package:flutter/material.dart';

class CheckoutProductItemColor extends StatelessWidget {
  CheckoutProductItemColor({@required this.color});
  final String color;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Text(
      "$color",
      style: TextStyle(
          color: Color.fromRGBO(66, 74, 82, 1),
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
          height: mediaQuery.textScaleFactor * 1.50),
    );
  }
}
