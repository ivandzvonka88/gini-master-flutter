import 'package:flutter/material.dart';

class DetailsOrderZip extends StatelessWidget {
  DetailsOrderZip({@required this.zip});
  final String zip;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
        child: Text(
          "$zip",
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
