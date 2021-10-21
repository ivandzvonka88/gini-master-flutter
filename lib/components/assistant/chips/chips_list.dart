import 'package:flutter/material.dart';
import 'package:gini/components/assistant/chips/item.dart';
import 'package:gini/models/dialogflow/response.dart';

class AssistantChipsList extends StatelessWidget {
  AssistantChipsList(
      {@required this.botResponses,
      @required this.insertResponse,
      @required this.index});
  final List<BotResponse> botResponses;
  final int index;
  final Function(BotResponse botResponse, bool replace) insertResponse;

  @override
  Widget build(BuildContext context) {
    List<Suggestion> suggestions = [];
    try {
      if (index == 0) {
        botResponses.first.queryResult.fulfillmentMessages.forEach((element) {
          if (element.suggestions != null) {
            element.suggestions.suggestions.forEach((element) {
              if (element != null) {
                suggestions.add(element);
              }
            });
          }
        });
      }
    } catch (error) {
      print(error);
    }
    return suggestions.isNotEmpty
        ? Container(
            margin: EdgeInsets.only(top: 24.0),
            height: 40.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              itemBuilder: (context, index) {
                return AssistantChipsItem(
                    suggestion: suggestions[index],
                    insertResponse: insertResponse);
              },
              itemCount: suggestions.length,
            ),
          )
        : SizedBox.shrink();
  }
}
