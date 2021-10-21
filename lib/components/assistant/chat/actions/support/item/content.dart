import 'package:flutter/material.dart';

class AssistantCallUserItemContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        "A Gini agent will "
        "help you with your request."
        " Do you want agent assistance?",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Color.fromRGBO(128, 139, 149, 1),
            fontSize: 16.0,
            height: mediaQuery.textScaleFactor * 1.50),
      ),
    );
  }
}
