import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gini/app/config/constants.dart';
import 'package:gini/components/auth/email/email_login.dart';

class AuthLoginTabBarEmailSignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      width: 343.0,
      decoration: BoxDecoration(
          gradient: linearGradient, borderRadius: BorderRadius.circular(50.0)),
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
                      child: SvgPicture.asset("assets/auth/email.svg",
                          height: 16.0, width: 20.0))),
              Align(
                  alignment: Alignment.center,
                  child: Text("Sign in with Email",
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600))),
            ],
          ),
          onTap: () async {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => EmailLoginPage()));
          },
        ),
      ),
    );
  }
}
