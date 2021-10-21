import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class ProfileSignOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: () async {
          if (_auth.currentUser != null) {
            await _auth.signOut();
          }
        },
        child: Text(
          "Sign Out",
          style: TextStyle(color: Color.fromRGBO(227, 24, 54, 1)),
        ));
  }
}
