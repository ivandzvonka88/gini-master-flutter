import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gini/components/auth/facebook/webview.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
String _clientId = "3341568259273173";
String _redirectUrl = "https://www.facebook.com/connect/login_success.html";

class AuthRegisterTabBarFacebookButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      width: 343.0,
      decoration: BoxDecoration(
          color: Color.fromRGBO(24, 119, 242, 1),
          borderRadius: BorderRadius.circular(50.0)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(50.0),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: SvgPicture.asset("assets/auth/facebook.svg",
                        height: 22.0)),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Continue with Facebook",
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          onTap: () async {
            String result = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CustomWebView(
                        selectedUrl:
                            'https://www.facebook.com/dialog/oauth?client_id=$_clientId&redirect_uri=$_redirectUrl&response_type=token&scope=email,public_profile,',
                      ),
                  maintainState: true,
                  fullscreenDialog: true),
            );

            if (result != null) {
              try {
                final facebookAuthCred =
                    FacebookAuthProvider.credential(result);
                await _auth.signInWithCredential(facebookAuthCred);

                Navigator.popUntil(context, (route) => route.isFirst);
              } on PlatformException catch (error) {
                _showInfoDialog(context, error.message);
              } catch (error) {
                _showInfoDialog(context, error.toString());
              }
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
