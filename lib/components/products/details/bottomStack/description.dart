import 'package:flutter/material.dart';

class DetailsProductDescription extends StatelessWidget {
  DetailsProductDescription({@required this.description});
  final String description;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "$description",
          style: TextStyle(
              height: mediaQuery.textScaleFactor * 1.50,
              color: Color.fromRGBO(128, 139, 149, 1),
              fontSize: 14.0),
        ),
      ),
    );
  }
}
