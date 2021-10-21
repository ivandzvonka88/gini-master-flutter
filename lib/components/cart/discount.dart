import 'package:flutter/material.dart';

class CartDiscount extends StatelessWidget {
  CartDiscount({@required this.discount});
  final double discount;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: mediaQuery.padding.add(EdgeInsets.all(16.0)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          "Discount",
          style: TextStyle(
              color: Color.fromRGBO(128, 139, 149, 1),
              fontWeight: FontWeight.w500,
              fontSize: 18.0,
              height: mediaQuery.textScaleFactor * 1.17),
        ),
        Text(
          "-\$${discount.toStringAsFixed(2)}",
          style: TextStyle(
              color: Color.fromRGBO(66, 74, 82, 1),
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              height: 1.17 * mediaQuery.textScaleFactor),
        )
      ]),
    );
  }
}
