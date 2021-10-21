import 'package:flutter/material.dart';

class DetailsOrderProductItemQuantity extends StatelessWidget {
  DetailsOrderProductItemQuantity({@required this.quantity});
  final int quantity;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Text(
      "$quantity",
      style: TextStyle(
          color: Color.fromRGBO(66, 74, 82, 1),
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
          height: mediaQuery.textScaleFactor * 1.50),
    );
  }
}
