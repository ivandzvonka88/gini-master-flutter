import 'package:flutter/material.dart';

class OnBoardingThreeTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "Know when and where to post",
        style: TextStyle(
            color: Color.fromRGBO(31, 30, 30, 1),
            fontSize: 21.0,
            fontWeight: FontWeight.w600,
            height: mediaQuery.textScaleFactor * 1.33),
      ),
    );
  }
}
