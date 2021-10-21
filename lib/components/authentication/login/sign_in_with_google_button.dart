import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class AuthLoginTabBarGoogleButton extends StatelessWidget {
  AuthLoginTabBarGoogleButton({@required this.isLink});
  final bool isLink;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 56.0,
        width: 343.0,
        decoration: BoxDecoration(
            color: Color.fromRGBO(66, 133, 244, 1),
            borderRadius: BorderRadius.circular(50.0)),
        child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(50.0),
              child: Stack(children: [
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26.0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: SvgPicture.asset("assets/auth/google.svg",
                            height: 18.0))),
                Align(
                    alignment: Alignment.center,
                    child: Text("Sign in with Google",
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600)))
              ]),
              onTap: () async {
                try {
                  UserCredential userCredential;

                  if (kIsWeb) {
                    GoogleAuthProvider googleProvider = GoogleAuthProvider();
                    userCredential =
                        await _auth.signInWithPopup(googleProvider);
                  } else {
                    final GoogleSignInAccount googleUser =
                        await GoogleSignIn(scopes: ['email', 'profile'])
                            .signIn();
                    final GoogleSignInAuthentication googleAuth =
                        await googleUser.authentication;
                    final GoogleAuthCredential googleAuthCredential =
                        GoogleAuthProvider.credential(
                      accessToken: googleAuth.accessToken,
                      idToken: googleAuth.idToken,
                    );
                    if (isLink) {
                      userCredential = await _auth.currentUser
                          .linkWithCredential(googleAuthCredential);
                    } else {
                      userCredential = await _auth
                          .signInWithCredential(googleAuthCredential);
                    }
                  }
                  final user = userCredential.user;
                  Navigator.popUntil(context, (route) => route.isFirst);
                } on PlatformException catch (error) {
                  _showInfoDialog(context, error.message);
                } catch (error) {
                  // _showInfoDialog(context, error.toString());
                }
              },
            )));
  }

  void _showInfoDialog(BuildContext context, String error) {
    showCupertinoDialog(
        context: context,
        builder: (context) =>
            CupertinoAlertDialog(content: Text("$error"), actions: [
              CupertinoDialogAction(
                  child: Text("Okay",
                      style:
                          TextStyle(color: Color.fromRGBO(125, 106, 244, 1))),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ]));
  }
}
