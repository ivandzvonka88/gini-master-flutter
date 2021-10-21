import 'package:flutter/material.dart';
import 'package:gini/components/assistant/chat/chat_list.dart';
import 'package:gini/components/assistant/chat/composer/text_composer.dart';
import 'package:gini/models/dialogflow/response.dart';

class Chat extends StatelessWidget {
  Chat(
      {@required this.animatedListState,
      @required this.botResponses,
      @required this.isWaiting});
  final GlobalKey<AnimatedListState> animatedListState;
  final List<BotResponse> botResponses;
  final bool isWaiting;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    if (isWaiting) {
      return Center(child: CircularProgressIndicator());
      return CircularProgressIndicator(
          backgroundColor: Color.fromRGBO(160, 75, 202, 1));
    }
    return Column(children: <Widget>[
      Flexible(
          child: AssistantChatList(
              animatedGlobalKey: animatedListState,
              botResponses: botResponses)),
      SizedBox(height: 16.0),
      Container(height: 1.0, color: Color.fromRGBO(226, 234, 241, 1)),
      SizedBox(height: 15.0),
      Container(
          decoration: BoxDecoration(color: Theme.of(context).cardColor),
          padding: EdgeInsets.only(
              left: mediaQuery.padding.left, right: mediaQuery.padding.right),
          child: BuildTextComposer(
            insertResponse: (BotResponse botResponse, bool replace) {
              if (replace) {
                botResponses.removeAt(0);
                animatedListState.currentState.removeItem(
                    0, (context, animation) => animatedItem(animation));
              }
              botResponses.insert(0, botResponse);
              animatedListState.currentState.insertItem(0);
            },
          )),
      SizedBox(height: 29 + mediaQuery.padding.bottom)
    ]);
  }

  Widget animatedItem(
    Animation<double> animation,
  ) {
    return FadeTransition(
      opacity: Tween<double>(
        begin: 0,
        end: 1,
      ).animate(animation),
      child: SlideTransition(
          position: Tween<Offset>(
        begin: Offset(0, -0.1),
        end: Offset.zero,
      ).animate(animation)),
    );
  }
}
