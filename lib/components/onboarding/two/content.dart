import 'package:flutter/material.dart';

class OnBoardingTwoContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "Send us the photos and videos you are considering posting and we’ll work our magic to create amazing photos",
        style: TextStyle(
            color: Color.fromRGBO(66, 74, 82, 1),
            fontSize: 16.0,
            height: mediaQuery.textScaleFactor * 1.50),
      ),
    );
  }
}
