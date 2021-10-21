import 'package:flutter/material.dart';

class InChatProductItemTitle extends StatelessWidget {
  InChatProductItemTitle({@required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 11.0),
      child: Container(
        height: 42.0,
        child: Text("$title", textAlign: TextAlign.center),
      ),
    );
  }
}
