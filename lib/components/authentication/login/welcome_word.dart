import 'package:flutter/material.dart';

class AuthLoginTabBarWelcomeWord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Welcome back",
        style: TextStyle(
            color: Color.fromRGBO(31, 30, 30, 1),
            fontSize: 24.0,
            fontWeight: FontWeight.w600));
  }
}
