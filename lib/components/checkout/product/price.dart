import 'package:flutter/material.dart';

class CheckoutProductItemPrice extends StatelessWidget {
  CheckoutProductItemPrice({@required this.price});
  final double price;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Text(
      "\$${price.toStringAsFixed(2)}",
      style: TextStyle(
          color: Color.fromRGBO(66, 74, 82, 1),
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          height: mediaQuery.textScaleFactor * 1.31),
    );
  }
}
