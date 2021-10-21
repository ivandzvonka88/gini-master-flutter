import 'package:flutter/material.dart';

class AssistantChatLoadingAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 16.0, left: 16.0,top: 24.0),
          child: CircleAvatar(
            child: Image.asset(
              "assets/chatbot/angelina.png",
              fit: BoxFit.cover,
              width: 32.0,
              height: 32.0,
            ),
            backgroundColor: Colors.transparent,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: Color.fromRGBO(221, 225, 234, 1))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Image.asset("assets/chatbot/loader.gif", height: 48.0),
          ),
        ),
      ],
    );
  }
}
