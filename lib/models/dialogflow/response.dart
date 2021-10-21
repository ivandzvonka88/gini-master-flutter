// To parse this JSON data, do
//
//     final botResponse = botResponseFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

BotResponse botResponseFromJson(String str) =>
    BotResponse.fromJson(json.decode(str));

String botResponseToJson(BotResponse data) => json.encode(data.toJson());

class BotResponse {
  BotResponse(
      {this.responseId,
      this.queryResult,
      this.timestamp,
      this.botImageUrl,
      this.userImageUrl,
      this.documentReference});

  String responseId;
  QueryResult queryResult;
  Timestamp timestamp;
  DocumentReference documentReference;
  String userImageUrl;
  String botImageUrl;

  factory BotResponse.fromJson(Map<String, dynamic> json) => BotResponse(
      responseId: json["responseId"],
      queryResult: QueryResult.fromJson(json["queryResult"]),
      timestamp: json['timeStamp'],
      botImageUrl: json['botImageUrl'],
      userImageUrl: json['userImageUrl']);

  Map<String, dynamic> toJson() => {
        "responseId": responseId,
        "queryResult": queryResult.toJson(),
        "timeStamp": FieldValue.serverTimestamp(),
        "userImageUrl": userImageUrl,
        "botImageUrl": botImageUrl
      };
}

class QueryResult {
  QueryResult({
    this.queryText,
    this.action,
    // this.parameters,
    this.allRequiredParamsPresent,
    this.fulfillmentText,
    this.fulfillmentMessages,
    this.intent,
    this.intentDetectionConfidence,
    this.languageCode,
  });

  String queryText;
  String action;
  // Parameters parameters;
  bool allRequiredParamsPresent;
  String fulfillmentText;
  List<FulfillmentMessage> fulfillmentMessages;
  Intent intent;
  double intentDetectionConfidence;
  String languageCode;

  factory QueryResult.fromJson(Map<String, dynamic> json) => QueryResult(
        queryText: json["queryText"],
        action: json["action"],
        // parameters: Parameters.fromJson(json["parameters"]),
        allRequiredParamsPresent: json["allRequiredParamsPresent"],
        fulfillmentText: json["fulfillmentText"],
        fulfillmentMessages: List<FulfillmentMessage>.from(
            json["fulfillmentMessages"]
                .map((x) => FulfillmentMessage.fromJson(x))),
        intent: Intent.fromJson(json["intent"]),
        intentDetectionConfidence: json["intentDetectionConfidence"] != null
            ? json["intentDetectionConfidence"].toDouble()
            : null,
        languageCode: json["languageCode"],
      );

  Map<String, dynamic> toJson() => {
        "queryText": queryText,
        "action": action,
        // "parameters": parameters.toJson(),
        "allRequiredParamsPresent": allRequiredParamsPresent,
        "fulfillmentText": fulfillmentText,
        "fulfillmentMessages":
            List<dynamic>.from(fulfillmentMessages.map((x) => x.toJson())),
        "intent": intent.toJson(),
        "intentDetectionConfidence": intentDetectionConfidence,
        "languageCode": languageCode,
      };
}

class FulfillmentMessage {
  FulfillmentMessage({
    this.platform,
    this.simpleResponses,
    this.suggestions,
    this.text,
  });

  String platform;
  SimpleResponses simpleResponses;
  Suggestions suggestions;
  Text text;

  factory FulfillmentMessage.fromJson(Map<String, dynamic> json) =>
      FulfillmentMessage(
        platform: json["platform"] == null ? null : json["platform"],
        simpleResponses: json["simpleResponses"] == null
            ? null
            : SimpleResponses.fromJson(json["simpleResponses"]),
        suggestions: json["suggestions"] == null
            ? null
            : Suggestions.fromJson(json["suggestions"]),
        text: json["text"] == null ? null : Text.fromJson(json["text"]),
      );

  Map<String, dynamic> toJson() => {
        "platform": platform == null ? null : platform,
        "simpleResponses":
            simpleResponses == null ? null : simpleResponses.toJson(),
        "suggestions": suggestions == null ? null : suggestions.toJson(),
        "text": text == null ? null : text.toJson(),
      };
}

class SimpleResponses {
  SimpleResponses({
    this.simpleResponses,
  });

  List<SimpleResponse> simpleResponses;

  factory SimpleResponses.fromJson(Map<String, dynamic> json) =>
      SimpleResponses(
        simpleResponses: List<SimpleResponse>.from(
            json["simpleResponses"].map((x) => SimpleResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "simpleResponses":
            List<dynamic>.from(simpleResponses.map((x) => x.toJson())),
      };
}

class SimpleResponse {
  SimpleResponse({
    this.textToSpeech,
  });

  String textToSpeech;

  factory SimpleResponse.fromJson(Map<String, dynamic> json) => SimpleResponse(
        textToSpeech: json["textToSpeech"],
      );

  Map<String, dynamic> toJson() => {
        "textToSpeech": textToSpeech,
      };
}

class Suggestions {
  Suggestions({
    this.suggestions,
  });

  List<Suggestion> suggestions;

  factory Suggestions.fromJson(Map<String, dynamic> json) => Suggestions(
        suggestions: List<Suggestion>.from(
            json["suggestions"].map((x) => Suggestion.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "suggestions": List<dynamic>.from(suggestions.map((x) => x.toJson())),
      };
}

class Suggestion {
  Suggestion({
    this.title,
  });

  String title;

  factory Suggestion.fromJson(Map<String, dynamic> json) => Suggestion(
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
      };
}

class Text {
  Text({
    this.text,
  });

  List<String> text;

  factory Text.fromJson(Map<String, dynamic> json) => Text(
        text: List<String>.from(json["text"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "text": List<dynamic>.from(text.map((x) => x)),
      };
}

class Intent {
  Intent({
    this.name,
    this.displayName,
  });

  String name;
  String displayName;

  factory Intent.fromJson(Map<String, dynamic> json) => Intent(
        name: json["name"],
        displayName: json["displayName"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "displayName": displayName,
      };
}

// class Parameters {
//   Parameters();
//
//   factory Parameters.fromJson(Map<String, dynamic> json) => Parameters();
//
//   Map<String, dynamic> toJson() => {};
// }
