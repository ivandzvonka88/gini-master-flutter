import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gini/components/assistant/app_bar.dart';
import 'package:gini/components/assistant/chat/chat.dart';
import 'package:gini/components/home/drawer.dart';
import 'package:gini/models/dialogflow/response.dart' as bot;

FirebaseFirestore _firestore = FirebaseFirestore.instance;
FirebaseAuth _auth = FirebaseAuth.instance;

class AssistantPage extends StatefulWidget {
  AssistantPage({@required this.pageController});
  final PageController pageController;
  @override
  _AssistantPageState createState() => _AssistantPageState();
}

class _AssistantPageState extends State<AssistantPage>
    with AutomaticKeepAliveClientMixin {

  var isWaiting = true;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (mounted) {
        setState(() {
          isWaiting = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    final List<bot.BotResponse> botResponses = [];
    final animatedListState = GlobalKey<AnimatedListState>();

    super.build(context);
    return Scaffold(
      key: scaffoldKey,
      appBar: AssistantAppBar(pageController: widget.pageController),
      drawer: MainDrawer(pageController: widget.pageController),

        body:  StreamBuilder<QuerySnapshot>(
          stream:_firestore
              .collection("usersData")
              .doc(_auth.currentUser.uid)
              .collection("chat")
              .orderBy('timeStamp', descending: false)
              .snapshots(),
          builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
            botResponses.clear();
            if (!snapshot.hasData)
              return Column(children: <Widget>[LinearProgressIndicator()]);
            if (snapshot != null && snapshot.data.docs != null) {
              botResponses.insert(
                  0,
                  bot.BotResponse(
                      queryResult: bot.QueryResult(fulfillmentMessages: [
                        bot.FulfillmentMessage(
                            text: bot.Text(text: [
                              "Hi 👋",
                              "I'm Angelina, your social media assistant",
                              "What I can do for you?"
                            ]))
                      ])));
              if (snapshot.data.docs.isNotEmpty) {
                snapshot.data.docs.forEach((element) {
                  try {
                    var response = bot.BotResponse.fromJson(element.data());
                    response.documentReference = element.reference;
                    botResponses.insert(0, response);
                    animatedListState.currentState.insertItem(0);
                  } catch (error) {
                    print("assistant => $error");
                  }
                });
              }
            }
            return  Chat(
                animatedListState: animatedListState,
                botResponses: botResponses,
                isWaiting: false);
          },
        )
    );
  }

  @override
  bool get wantKeepAlive => true;
}
