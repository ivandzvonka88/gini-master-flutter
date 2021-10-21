import 'package:flutter/material.dart';

class DetailsOrderPhone extends StatelessWidget {
  DetailsOrderPhone({@required this.phone});
  final String phone;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(
            left: 16.0, right: 16.0, top: 4.0, bottom: 24.0),
        child: Text(
          "$phone",
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
