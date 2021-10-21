import 'package:flutter/material.dart';

class DetailsOrderPaymentMethodWord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          "Payment Method",
          style: TextStyle(
              color: Color.fromRGBO(31, 30, 30, 1),
              fontWeight: FontWeight.w600,
              fontSize: 16.0),
        ),
      ),
    );
  }
}
