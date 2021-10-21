import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/v2/auth_google.dart';
import 'package:gini/models/dialogflow/response.dart';

class Dialogflow {
  final AuthGoogle authGoogle;
  final String language;

  const Dialogflow({@required this.authGoogle, this.language = "en"});

  String _getUrl() {
    return "https://dialogflow.googleapis.com/v2/projects/${authGoogle.getProjectId}/agent/sessions/${authGoogle.getSessionId}:detectIntent";
  }

  Future<BotResponse> detectIntent(String query) async {
    var response = await authGoogle.post(_getUrl(),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer ${authGoogle.getToken}"
        },
        body:
            "{'queryInput':{'text':{'text':'$query','language_code':'$language'}}}");
    return BotResponse.fromJson(json.decode(response.body));
  }
}
