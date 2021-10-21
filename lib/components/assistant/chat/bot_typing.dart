// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:flutter/material.dart';
// import 'package:gini/models/dialogflow/response.dart' as model;
//
// class AssistantTyping extends StatelessWidget {
//   AssistantTyping({@required this.botResponse});
//   final List<model.BotResponse> botResponse;
//   @override
//   Widget build(BuildContext context) {
//     final isTyping =
//         botResponse.isNotEmpty && botResponse.first.timestamp == null;
//
//     return isTyping
//         ? Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: SizedBox(
//               height: 30.0,
//               child: RotateAnimatedTextKit(
//                 onTap: () {
//                   print("Tap Event");
//                 },
//                 text: ["Gini is typing...", "Please wait..."],
//                 textStyle: TextStyle(fontSize: 16.0, color: Colors.grey),
//                 textAlign: TextAlign.start,
//                 repeatForever: true,
//               ),
//             ),
//           )
//         : SizedBox.shrink();
//   }
// }
