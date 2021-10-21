// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// class ChatMessage {
//   String text;
//   String name;
//   bool type;
//   String uid;
//   String action;
//   Timestamp timestamp;
//   ChatMessage({
//     @required this.text,
//     @required this.name,
//     @required this.type,
//     this.action,
//     this.uid,
//     this.timestamp,
//   });
//
//   ChatMessage.fromJson(Map<dynamic, dynamic> json) {
//     text = json['text'];
//     name = json['name'];
//     type = json['type'];
//     uid = json['uid'];
//     action = json['action'];
//     timestamp = json['timeStamp'];
//   }
//
//   Map<String, dynamic> toJson() => {
//         'text': text,
//         'name': name,
//         'type': type,
//         'uid': uid,
//         'action': action,
//         'timeStamp': FieldValue.serverTimestamp(),
//       };
// }
