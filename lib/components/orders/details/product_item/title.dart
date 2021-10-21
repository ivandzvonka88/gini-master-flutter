import 'package:flutter/material.dart';

class DetailsOrderProductItemTitle extends StatelessWidget {
  DetailsOrderProductItemTitle({@required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Text(
      "$title",
      style: TextStyle(
          color: Color.fromRGBO(66, 74, 82, 1),
          fontSize: 14.0,
          height: mediaQuery.textScaleFactor * 1.50,
          fontWeight: FontWeight.w500),
    );
  }
}
