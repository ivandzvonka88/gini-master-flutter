import 'package:flutter/material.dart';
import 'package:gini/app/config/constants.dart';

class InChatProductItemPrice extends StatelessWidget {
  InChatProductItemPrice({@required this.price});
  final double price;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50.0, right: 50.0, bottom: 16.0),
      child: Container(
        height: 30,
        width: 76,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          gradient: linearGradient,
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Material(
            color: Colors.transparent,
            child: Center(
              child: Text(
                "\$${price.toStringAsFixed(2)}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
