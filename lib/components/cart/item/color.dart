import 'package:flutter/material.dart';

class CartProductItemColor extends StatelessWidget {
  CartProductItemColor({@required this.color});
  final String color;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Text("$color",
        style: TextStyle(
            color: Color.fromRGBO(66, 74, 82, 1),
            fontSize: 14.0,
            height: mediaQuery.textScaleFactor * 1.50,
            fontWeight: FontWeight.w600));
  }
}
