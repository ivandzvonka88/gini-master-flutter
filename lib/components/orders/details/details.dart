import 'package:flutter/material.dart';

class DetailsOrderDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          "Details",
          style: TextStyle(
              color: Color.fromRGBO(66, 74, 82, 1),
              fontWeight: FontWeight.w600,
              fontSize: 18.0,
              height: mediaQuery.textScaleFactor * 1.17),
        ),
      ),
    );
  }
}
