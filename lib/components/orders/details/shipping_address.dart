import 'package:flutter/material.dart';

class DetailsOrderShippingAddressWord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          "Shipping Address",
          style: TextStyle(
              color: Color.fromRGBO(31, 30, 30, 1),
              fontWeight: FontWeight.w600,
              fontSize: 14.0,
              height: mediaQuery.textScaleFactor * 1.14),
        ),
      ),
    );
  }
}
