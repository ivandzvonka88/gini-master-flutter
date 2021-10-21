import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gini/components/auth/phone/phone.dart';
import 'package:gini/models/dialogflow/response.dart' as bot;

FirebaseAuth _auth = FirebaseAuth.instance;

class AssistantPhoneButton extends StatelessWidget {
  AssistantPhoneButton({@required this.insertResponse});
  final Function(bot.BotResponse botResponse) insertResponse;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        margin: EdgeInsets.only(top: 24.0),
        height: 56.0,
        width: 156.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          border: Border.all(
            color: Color.fromRGBO(219, 226, 233, 1),
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(50.0),
            child: Center(
              child: Text("Verify Phone"),
            ),
            onTap: () async {
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PhoneAuthPage(isLink: true)));
              if (_auth.currentUser.phoneNumber != null) {
                insertResponse(bot.BotResponse(
                    queryResult: bot.QueryResult(
                        fulfillmentText:
                            "Your phone successfully linked to your account"),
                    timestamp: Timestamp.now()));
              }
            },
          ),
        ),
      ),
    );
  }
}
