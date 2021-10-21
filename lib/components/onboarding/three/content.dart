import 'package:flutter/material.dart';

class OnBoardingThreeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "Grow your audience with not only a great caption and photo, but by posting at a time for maximum impact.",
        style: TextStyle(
            color: Color.fromRGBO(66, 74, 82, 1),
            fontSize: 16.0,
            height: mediaQuery.textScaleFactor * 1.50),
      ),
    );
  }
}
