import 'package:flutter/material.dart';
import 'package:gini/components/assistant/chat/item.dart';
import 'package:gini/components/assistant/chips/chips_list.dart';
import 'package:gini/models/dialogflow/response.dart' as bot;

class AssistantChatList extends StatefulWidget {
  AssistantChatList(
      {@required this.botResponses, @required this.animatedGlobalKey});
  final List<bot.BotResponse> botResponses;
  final GlobalKey<AnimatedListState> animatedGlobalKey;

  @override
  _AssistantChatListState createState() => _AssistantChatListState();
}

class _AssistantChatListState extends State<AssistantChatList>
    with SingleTickerProviderStateMixin {
  var scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return AnimatedList(
      controller: scrollController,
      padding: EdgeInsets.only(
          left: mediaQuery.padding.left, right: mediaQuery.padding.right),
      key: widget.animatedGlobalKey,
      reverse: true,
      initialItemCount: widget.botResponses.length,
      itemBuilder: (context, index, animation) {
        return buildAnimatedItem(context, index, animation);
      },
    );
  }

  Widget buildAnimatedItem(
    BuildContext context,
    int index,
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
        ).animate(animation),
        child: Column(
          children: [
            AssistantChatListItem(
                botResponse: widget.botResponses[index],
                insertResponse: (bot.BotResponse botResponse) {
                  widget.botResponses.insert(0, botResponse);
                  widget.animatedGlobalKey.currentState.insertItem(0);
                  scrollController.animateTo(
                      scrollController.initialScrollOffset,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.fastOutSlowIn);
                }),
            AssistantChipsList(
              botResponses: widget.botResponses,
              insertResponse: (bot.BotResponse response, bool replace) {
                if (replace) {
                  widget.botResponses.removeAt(0);
                  widget.animatedGlobalKey.currentState.removeItem(
                      index, (context, animation) => animatedItem(animation));
                }
                widget.botResponses.insert(0, response);
                widget.animatedGlobalKey.currentState.insertItem(0);
              },
              index: index,
            )
          ],
        ),
      ),
    );
  }

  Widget animatedItem(Animation<double> animation) {
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
