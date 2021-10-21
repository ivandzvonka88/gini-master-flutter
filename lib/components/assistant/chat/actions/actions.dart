import 'package:flutter/material.dart';
import 'package:gini/components/assistant/chat/actions/select/select_photo.dart';
import 'package:gini/components/assistant/chat/actions/support/support.dart';
import 'package:gini/components/products/chat/in_chat_products.dart';
import 'package:gini/components/services/chat/service.dart';
import 'package:gini/models/dialogflow/response.dart' as bot;

class AssistantActions extends StatelessWidget {
  AssistantActions({@required this.botResponse, @required this.insertResponse});
  final bot.BotResponse botResponse;
  final Function(bot.BotResponse botResponse) insertResponse;

  @override
  Widget build(BuildContext context) {
    switch (botResponse.queryResult.action.split(".").first) {
      case "products":
        {
          String reference =
              botResponse.queryResult.action.replaceAll(".", "/");
          return InChatProducts(collectionReference: reference);
        }
        break;
      case "services":
        {
          print(botResponse.queryResult.action);
          String reference =
              botResponse.queryResult.action.replaceAll(".", "/");
          print(reference);
          return InChatServices(
              collectionReference: reference, insertResponse: insertResponse);
        }
        break;
      case "call":
        {
          return AssistantCallUser(insertResponse: insertResponse);
        }
        break;
      case "local":
        {
          return AssistantChatSelectImage(
              insertResponse: insertResponse, botResponse: botResponse);
        }
        break;
      default:
        {
          return SizedBox.shrink();
        }
    }
  }
}
