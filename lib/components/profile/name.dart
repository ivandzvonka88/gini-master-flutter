import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class ProfileName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Text(
      "${_auth.currentUser.displayName}",
      style: TextStyle(
          color: Color.fromRGBO(31, 30, 30, 1),
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
          height: mediaQuery.textScaleFactor * 0.87),
    );
  }
}
