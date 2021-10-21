import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InChatProductItemShare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.0,
      width: 32.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          border: Border.all(color: Color.fromRGBO(221, 225, 234, 1))),
      child: InkWell(
        borderRadius: BorderRadius.circular(50.0),
        child: Align(
            child: SvgPicture.asset(
          "assets/product/share.svg",
          width: 18.0,
        )),
        onTap: (){},
      ),
    );
  }
}
