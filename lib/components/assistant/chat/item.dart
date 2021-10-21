import 'package:flutter/material.dart';
import 'package:gini/components/assistant/chat/actions/actions.dart';
import 'package:gini/components/assistant/chat/actions/editing/admin_image.dart';
import 'package:gini/components/assistant/chat/actions/editing/image_editing.dart';
import 'package:gini/components/assistant/chat/item/bot_message.dart';
import 'package:gini/components/assistant/chat/item/loading_animation.dart';
import 'package:gini/components/assistant/chat/item/my_message.dart';
import 'package:gini/models/dialogflow/response.dart' as bot;
import 'package:gini/models/dialogflow/response.dart';

class AssistantChatListItem extends StatelessWidget {
  AssistantChatListItem(
      {@required this.botResponse, @required this.insertResponse});
  final bot.BotResponse botResponse;
  final Function(bot.BotResponse botResponse) insertResponse;
  @override
  Widget build(BuildContext context) {
    String userText;
    try {
      userText = botResponse.queryResult.queryText;
    } catch (error) {
      print(error);
    }
    String botText;
    try {
      botText = botResponse.queryResult.fulfillmentText;
    } catch (error) {
      print(error);
    }
    String action;
    try {
      action = botResponse.queryResult.action;
    } catch (error) {
      print(error);
    }
    String imageUrl;
    try {
      imageUrl = botResponse.userImageUrl;
    } catch (error) {
      print(error);
    }
    String botImageUrl;
    try {
      botImageUrl = botResponse.botImageUrl;
    } catch (error) {
      print(error);
    }
    bool isProcessing;
    try {
      isProcessing = botResponse.timestamp == null;
    } catch (error) {
      print(error);
    }
    List<FulfillmentMessage> fulfillmentMessage;
    try {
      fulfillmentMessage = botResponse.queryResult.fulfillmentMessages;
    } catch (error) {
      print(error);
    }
    return Column(
      children: [
        userText != null && userText!=""
            ? AssistantChatItemMyMessage(text: "$userText")
            : SizedBox.shrink(),
        imageUrl != null
            ? AssistantChatEditingImage(url: imageUrl, isUser: true)
            : SizedBox.shrink(),
        fulfillmentMessage != null && fulfillmentMessage[0].text != null
            ? Column(
                children: List.generate(fulfillmentMessage[0].text.text.length,
                    (index) {
                try {
                  return AssistantChatItemBotMessage(
                      text: "${fulfillmentMessage[0].text.text[index]}");
                } catch (error) {
                  return SizedBox.shrink();
                }
              }))
            : botText != null && botText!=""
                ? AssistantChatItemBotMessage(text: "$botText")
                : isProcessing
                    ? AssistantChatLoadingAnimation()
                    : SizedBox.shrink(),
        botImageUrl != null
            ? AdminImage(url: botImageUrl, isUser: false)
            : SizedBox.shrink(),
        action != null
            ? AssistantActions(
                insertResponse: insertResponse, botResponse: botResponse)
            : SizedBox.shrink()
      ],
    );
  }
}
