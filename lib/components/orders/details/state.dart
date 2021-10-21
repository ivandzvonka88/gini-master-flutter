import 'package:flutter/material.dart';

class DetailsOrderState extends StatelessWidget {
  DetailsOrderState({@required this.state});
  final String state;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
        child: Text(
          "$state",
          style: TextStyle(
              color: Color.fromRGBO(128, 139, 149, 1),
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
              height: mediaQuery.textScaleFactor * 1.14),
        ),
      ),
    );
  }
}
