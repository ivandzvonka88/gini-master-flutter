import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class AuthRegisterTabBarAppleButton extends StatelessWidget {
  AuthRegisterTabBarAppleButton({@required this.isLink});
  final bool isLink;
  @override
  Widget build(BuildContext context) {
    if (!Platform.isIOS) {
      return SizedBox.shrink();
    }
    return Container(
      height: 56.0,
      width: 343.0,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(50.0)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(50.0),
          child: Stack(children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: SvgPicture.asset("assets/auth/apple.svg",
                        height: 22.0))),
            Align(
                alignment: Alignment.center,
                child: Text("Continue with Apple",
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600)))
          ]),
          onTap: () async {
            try {
              final credential =
                  await SignInWithApple.getAppleIDCredential(scopes: [
                AppleIDAuthorizationScopes.email,
                AppleIDAuthorizationScopes.fullName,
              ]);

              final oAuthProvider = OAuthProvider("apple.com");
              final authCredentials = oAuthProvider.credential(
                  idToken: credential.identityToken,
                  accessToken: credential.authorizationCode);
              if (isLink) {
                await _auth.currentUser.linkWithCredential(authCredentials);
              } else {
                await _auth.signInWithCredential(authCredentials);
              }
              if (_auth.currentUser != null) {
                Navigator.popUntil(context, (route) => route.isFirst);
                await _auth.currentUser.updateProfile(
                    displayName:
                        "${credential.givenName} ${credential.familyName}");
              }
            } on PlatformException catch (error) {
              _showInfoDialog(context, error.message);
            } on MissingPluginException catch (error) {
              _showInfoDialog(context, error.message);
            } on SignInWithAppleAuthorizationException catch (error) {
              _showInfoDialog(context, error.code.toString());
            } catch (error) {
              _showInfoDialog(context, error);
            }
          },
        ),
      ),
    );
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
