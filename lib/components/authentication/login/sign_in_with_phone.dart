import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gini/components/auth/phone/phone.dart';

class AuthLoginTabBarPhoneSignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      width: 343.0,
      decoration: BoxDecoration(
          border:
              Border.all(width: 1.0, color: Color.fromRGBO(125, 106, 244, 1)),
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
                    child: SvgPicture.asset("assets/auth/phone.svg",
                        height: 18.0, width: 18.0)),
              ),
              Align(
                alignment: Alignment.center,
                child: Text("Sign in with Phone",
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Color.fromRGBO(125, 106, 244, 1),
                        fontWeight: FontWeight.w600)),
              ),
            ],
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => PhoneAuthPage(isLink: false)));
          },
        ),
      ),
    );
  }
}
