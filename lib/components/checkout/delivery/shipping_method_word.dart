import 'package:flutter/material.dart';

class CheckoutDeliveryShippingMethodWord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text("Shipping Method",
            style: TextStyle(
                color: Color.fromRGBO(31, 30, 30, 1),
                fontSize: 18.0,
                height: mediaQuery.textScaleFactor * 0.89,
                fontWeight: FontWeight.w600)),
      ),
    );
  }
}
