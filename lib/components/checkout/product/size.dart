import 'package:flutter/material.dart';

class CheckoutProductItemSize extends StatelessWidget {
  CheckoutProductItemSize({@required this.size});
  final String size;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Text(
      "$size",
      style: TextStyle(
          color: Color.fromRGBO(66, 74, 82, 1),
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
          height: mediaQuery.textScaleFactor * 1.50),
    );
  }
}
