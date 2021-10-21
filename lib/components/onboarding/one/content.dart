import 'package:flutter/material.dart';

class OnBoardingOneContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "Take the guess work out of deciding what and when to post on places like Tik Tok, Instagram, Facebook, Linkedin, and more.",
        style: TextStyle(
            color: Color.fromRGBO(66, 74, 82, 1),
            fontSize: 16.0,
            height: mediaQuery.textScaleFactor * 1.50),
      ),
    );
  }
}
