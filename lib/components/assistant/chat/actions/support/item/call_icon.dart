import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AssistantCallUserItemCallIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 64.0,
        width: 64.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(228, 228, 228, 1), blurRadius: 32.0)
            ]),
        child: Center(
            child: SvgPicture.asset("assets/call/phone.svg", height: 28.0)));
  }
}
