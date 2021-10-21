import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gini/app/config/constants.dart';
import 'package:gini/models/dialogflow/response.dart' as bot;

FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

class AssistantCallUserItemSupportButton extends StatefulWidget {
  AssistantCallUserItemSupportButton({@required this.insertResponse});
  final Function(bot.BotResponse botResponse) insertResponse;

  @override
  _AssistantCallUserItemSupportButtonState createState() =>
      _AssistantCallUserItemSupportButtonState();
}

class _AssistantCallUserItemSupportButtonState
    extends State<AssistantCallUserItemSupportButton> {
  var isProcessing = false;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return isProcessing
        ? SizedBox(
            height: 24.0,
            width: 24.0,
            child: CircularProgressIndicator(strokeWidth: 3.0))
        : Container(
            decoration: BoxDecoration(
                gradient: linearGradient,
                borderRadius: BorderRadius.circular(50.0)),
            child: Material(
                color: Colors.transparent,
                child: InkWell(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 8.0),
                        child: Text("Yes",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                height: mediaQuery.textScaleFactor * 1.14))),
                    onTap: () async {
                      try {
                        setState(() {
                          isProcessing = true;
                        });
                        await _firebaseFirestore
                            .collection("usersData")
                            .doc(_auth.currentUser.uid)
                            .collection("support")
                            .add({
                          "phoneNumber": _auth.currentUser.phoneNumber,
                          "name": _auth.currentUser.displayName,
                          "added": FieldValue.serverTimestamp()
                        });
                        var response = bot.BotResponse(
                            queryResult: bot.QueryResult(fulfillmentMessages: [
                              bot.FulfillmentMessage(
                                  text: bot.Text(text: [
                                "Agent will call you very soon.",
                                "Please prepare for a call."
                              ]))
                            ], intent: bot.Intent()),
                            timestamp: Timestamp.now());
                        var documentReference = _firebaseFirestore
                            .collection("usersData")
                            .doc(_auth.currentUser.uid)
                            .collection('chat')
                            .doc();

                        _firebaseFirestore.runTransaction((transaction) async {
                          transaction.set(
                            documentReference,
                            response.toJson(),
                          );
                        });
                        widget.insertResponse(response);
                        setState(() {
                          isProcessing = false;
                        });
                      } catch (error) {
                        setState(() {
                          isProcessing = false;
                        });
                        widget.insertResponse(bot.BotResponse(
                            queryResult: bot.QueryResult(fulfillmentMessages: [
                          bot.FulfillmentMessage(
                              text: bot.Text(text: [error.toString()]))
                        ])));
                      }
                    })));
  }
}
