import 'package:flutter/material.dart';

class AssistantChatItemBotMessage extends StatelessWidget {
  AssistantChatItemBotMessage({@required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: 64.0,
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
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(right: 72.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    border: Border.all(
                      color: Color.fromRGBO(221, 225, 234, 1),
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                    child: Text(
                      text,
                      style: TextStyle(
                          color: Color.fromRGBO(128, 139, 149, 1),
                          fontSize: 16.0,
                          height: mediaQuery.textScaleFactor * 1.31),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
