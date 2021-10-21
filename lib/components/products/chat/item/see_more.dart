import 'package:flutter/material.dart';

class InChatProductItemSeeMore extends StatelessWidget {
  InChatProductItemSeeMore({@required this.length});
  final int length;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      width: 116.0,
      height: 37.0,
      decoration: BoxDecoration(
          color: Color.fromRGBO(246, 244, 252, 1),
          borderRadius: BorderRadius.circular(50.0)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(50.0),
          onTap: () {},
          child: Align(
            child: Text(
              "See $length more",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(125, 106, 244, 1),
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  height: mediaQuery.textScaleFactor * 1.31),
            ),
          ),
        ),
      ),
    );
  }
}
