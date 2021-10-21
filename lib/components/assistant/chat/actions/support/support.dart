import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gini/components/assistant/chat/actions/support/item/call_icon.dart';
import 'package:gini/components/assistant/chat/actions/support/item/content.dart';
import 'package:gini/components/assistant/chat/actions/support/item/support_bottom.dart';
import 'package:gini/components/assistant/chat/actions/support/phone/get_phone.dart';
import 'package:gini/models/dialogflow/response.dart' as bot;

FirebaseAuth _auth = FirebaseAuth.instance;

class AssistantCallUser extends StatelessWidget {
  AssistantCallUser({@required this.insertResponse});
  final Function(bot.BotResponse botResponse) insertResponse;

  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser.phoneNumber == null) {
      return AssistantPhoneButton(insertResponse: insertResponse);
    }
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
                    width: 218.0,
                    height: 264.0,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(246, 244, 252, 1),
                        borderRadius: BorderRadius.circular(12.0)),
                    child: Column(
                      children: [
                        SizedBox(height: 24.0),
                        AssistantCallUserItemCallIcon(),
                        SizedBox(height: 16.0),
                        AssistantCallUserItemContent(),
                        SizedBox(height: 32.0),
                        AssistantCallUserItemSupportButton(
                            insertResponse: insertResponse),
                        SizedBox(height: 24.0)
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
