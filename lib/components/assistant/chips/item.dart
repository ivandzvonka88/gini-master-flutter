import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/utils/language.dart';
import 'package:flutter_dialogflow/v2/auth_google.dart';
import 'package:gini/models/dialogflow/dialog_flow.dart' as dialog;
import 'package:gini/models/dialogflow/response.dart' as model;

FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
FirebaseAuth _auth = FirebaseAuth.instance;

class AssistantChipsItem extends StatelessWidget {
  AssistantChipsItem(
      {@required this.suggestion, @required this.insertResponse});
  final model.Suggestion suggestion;
  final Function(model.BotResponse botResponse, bool replace) insertResponse;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color.fromRGBO(246, 244, 252, 1),
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(50.0),
            onTap: () async {
              insertResponse(
                  model.BotResponse(
                      queryResult:
                          model.QueryResult(queryText: suggestion.title)),
                  false);
              try {
                AuthGoogle authGoogle = await AuthGoogle(
                        fileJson:
                            "assets/chatbot/angelina-cnnahw-f1f9b9c2d823.json")
                    .build();
                dialog.Dialogflow dialogflow = dialog.Dialogflow(
                    authGoogle: authGoogle, language: Language.english);

                model.BotResponse response = await dialogflow.detectIntent(
                    suggestion
                        .title); //query.toString().replaceAll("\'", "\"" use if error happens
                insertResponse(response, true);
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
              } catch (error) {
                print(error);
              }
            },
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "${suggestion.title}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(128, 139, 149, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
