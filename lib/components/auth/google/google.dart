import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthGoogle extends StatefulWidget {
  AuthGoogle({@required this.onTap});
  final Function onTap;
  @override
  _AuthGoogleState createState() => _AuthGoogleState();
}

class _AuthGoogleState extends State<AuthGoogle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      width: 343.0,
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
          color: Color(0xFF4285F4), borderRadius: BorderRadius.circular(50.0)),
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
                    child: SvgPicture.asset(
                      "assets/ui/google.svg",
                      height: 18.0,
                    )),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Sign in with Google",
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          onTap: widget.onTap,
        ),
      ),
    );
  }
}
