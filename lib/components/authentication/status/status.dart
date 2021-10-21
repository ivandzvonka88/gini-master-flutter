import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gini/pages/auth/info.dart';
import 'package:gini/pages/home/home.dart';
import 'package:gini/pages/onboarding/on_boarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
enum AuthStatusEvents { none, hasUser, noUserFound }

class AuthStatus extends StatefulWidget {
  AuthStatus({@required this.sharedPreferences});
  final SharedPreferences sharedPreferences;
  @override
  _AuthStatusState createState() => _AuthStatusState();
}

class _AuthStatusState extends State<AuthStatus> {
  AuthStatusEvents authStatusEvents = AuthStatusEvents.none;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (widget.sharedPreferences.getBool("isFirst") ?? true) {
        await _auth.signOut();
        await _firebaseFirestore.clearPersistence();
        widget.sharedPreferences.setBool("isFirst", false);
      }
      _auth.userChanges().listen((event) {
        if (_auth.currentUser != null) {
          setState(() {
            authStatusEvents = AuthStatusEvents.hasUser;
          });
        } else {
          setState(() {
            authStatusEvents = AuthStatusEvents.noUserFound;
          });
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatusEvents) {
      case AuthStatusEvents.none:
        return Container(color: Colors.white);
        break;
      case AuthStatusEvents.hasUser:
        {
          final hasDisplayName = _auth.currentUser.displayName != null &&
              _auth.currentUser.displayName != "";
          return hasDisplayName
              ? _auth.currentUser.emailVerified
                  ? HomePage(initialPage: 0)
                  : HomePage(initialPage: 0)
              : UserInfoPage(
                  hasEmail: true,
                  hasDisplayName: hasDisplayName,
                  voidCallback: () => setState(() {}));
        }
        break;
      case AuthStatusEvents.noUserFound:
        return OnBoardingPage();
        break;
      default:
        // Never gonna come here?
        return Container(
            color: Colors.white,
            child: RaisedButton(
              onPressed: () {
                setState(() {});
              },
              child: Text("Refresh"),
            ));
    }
  }
}
