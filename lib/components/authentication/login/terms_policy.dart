import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gini/pages/legal/privacy_policy.dart';
import 'package:gini/pages/legal/terms_conditions.dart';

class AuthLoginTabBarPolicyTermsDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: "By signing in, you accept our  ",
            style: TextStyle(color: Color(0xFF808B95), fontSize: 12.0),
            children: [
              TextSpan(
                  text: "Terms of Service",
                  style: TextStyle(color: Color(0xFF7A6EF9)),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => TermsAndConditionsPage(),
                              fullscreenDialog: true));
                    }),
              TextSpan(
                  text: " and ",
                  style: TextStyle(color: Color(0xFF808B95), fontSize: 12.0)),
              TextSpan(
                  text: "Privacy Policy",
                  style: TextStyle(color: Color(0xFF7A6EF9)),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => PrivacyPolicyPage(),
                              fullscreenDialog: true));
                    }),
            ]),
      ),
    );
  }
}
