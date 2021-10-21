import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/utils/language.dart';
import 'package:flutter_dialogflow/v2/auth_google.dart';
import 'package:gini/app/config/constants.dart';
import 'package:gini/components/assistant/chat/composer/add_file.dart';
import 'package:gini/models/dialogflow/dialog_flow.dart' as dialogFlow;
import 'package:gini/models/dialogflow/response.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseFirestore _firestore = FirebaseFirestore.instance;

class BuildTextComposer extends StatefulWidget {
  BuildTextComposer({@required this.insertResponse});
  final Function(BotResponse botResponse, bool replace) insertResponse;
  @override
  _BuildTextComposerState createState() => _BuildTextComposerState();
}

class _BuildTextComposerState extends State<BuildTextComposer> {
  final _textController = TextEditingController();
  final focusNode = FocusNode();

  int lines = 1;

  void _handleSubmitted(String text, BuildContext context,
      [BotResponse response]) {
    _textController.clear();
    if (text.isEmpty || text.trim() == "") {
      return;
    }
    BotResponse botResponse = response != null
        ? response
        : BotResponse(queryResult: QueryResult(queryText: text));
    widget.insertResponse(botResponse, false);
    sendToBot(text, response);
  }

  void sendToBot(query, [BotResponse botResponse]) async {
    try {
      AuthGoogle authGoogle = await AuthGoogle(
              fileJson: "assets/chatbot/angelina-cnnahw-f1f9b9c2d823.json")
          .build();
      dialogFlow.Dialogflow dialogflow = dialogFlow.Dialogflow(
          authGoogle: authGoogle, language: Language.english);

      BotResponse response = await dialogflow.detectIntent(
          query); //query.toString().replaceAll("\'", "\"" use if error happens
      if (botResponse != null) {
        response = BotResponse(
            queryResult: response.queryResult,
            responseId: response.responseId,
            timestamp: response.timestamp,
            userImageUrl: botResponse.userImageUrl);
      }
      widget.insertResponse(response, true);
      onSend(firestore: _firestore, botResponse: response);
    } catch (error) {
      print(error);
    }
  }

  void onSend(
      {@required BotResponse botResponse,
      @required FirebaseFirestore firestore}) {
    print(botResponse.toJson());
    var documentReference = firestore
        .collection("usersData")
        .doc(_auth.currentUser.uid)
        .collection('chat')
        .doc();

    firestore.runTransaction((transaction) async {
      transaction.set(
        documentReference,
        botResponse.toJson(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        child: Row(
          crossAxisAlignment:
              lines > 1 ? CrossAxisAlignment.end : CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: 16.0),
            AssistantChatComposerAddFile(
              insertResponse: (BotResponse botResponse) {
                _handleSubmitted(
                    "I want you to edit my photo!", context, botResponse);
              },
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.text,
                focusNode: focusNode,
                controller: _textController,
                onFieldSubmitted: (value) {
                  _handleSubmitted(_textController.text, context);
                },
                onChanged: (String value) {
                  int lines = '\n'.allMatches(value).length + 1;
                  print(lines);
                  // if (true) {
                  //   setState(() {
                  //     this.lines = lines;
                  //   });
                  // }
                },
                style: TextStyle(
                    color: Color.fromRGBO(128, 139, 149, 1),
                    fontSize: 16.0,
                    height: mediaQuery.textScaleFactor * 1.31),
                maxLines: 5,
                minLines: 1,
                decoration: InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: lines > 1
                        ? BorderRadius.circular(0.0)
                        : BorderRadius.circular(50.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: lines > 1
                        ? BorderRadius.circular(0.0)
                        : BorderRadius.circular(50.0),
                    borderSide: BorderSide(
                      color: Color(0xFFDBE2E9),
                    ),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: lines > 1
                          ? BorderRadius.circular(0.0)
                          : BorderRadius.circular(50.0),
                      borderSide: BorderSide(
                        color: Color(0xFFDBE2E9),
                      )),
                  hintText: "Type message...",
                  hintStyle: TextStyle(
                      color: Color.fromRGBO(128, 139, 149, 1), fontSize: 16.0),
                ),
              ),
            ),
            SizedBox(width: 16.0),
            Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(55.0),
                  gradient: linearGradient,
                ),
                child: FloatingActionButton(
                  foregroundColor: Colors.transparent,
                  elevation: 0.0,
                  backgroundColor: Colors.transparent,
                  onPressed: () {
                    _handleSubmitted(_textController.text, context);
                  },
                  child: Icon(
                    Icons.arrow_upward,
                    color: theme.buttonColor,
                  ),
                )),
            SizedBox(width: 16.0)
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    focusNode.dispose();
    super.dispose();
  }
}
