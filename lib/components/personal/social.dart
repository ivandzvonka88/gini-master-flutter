import 'package:flutter/material.dart';

class PersonalSocial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          "Social",
          style: TextStyle(
              color: Color.fromRGBO(31, 30, 30, 1),
              fontSize: 16.0,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
