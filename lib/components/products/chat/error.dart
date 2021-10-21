import 'package:flutter/material.dart';

class InChatProductsError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 10.0,
        right: 16.0,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          border: Border.all(color: Color(0xffdde1ea))),
      child: Icon(Icons.error),
    );
  }
}
