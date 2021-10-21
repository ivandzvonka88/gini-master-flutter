import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gini/app/config/constants.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class AssistantChatItemMyMessage extends StatelessWidget {
  AssistantChatItemMyMessage({@required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(left: 72.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    gradient: linearGradient,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                    child: Text(
                      text,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          height: mediaQuery.textScaleFactor * 1.31),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 64.0,
            child: _auth.currentUser.photoURL != null
                ? Center(
                    child: Container(
                      height: 32.0,
                      width: 32.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(
                              "${_auth.currentUser.photoURL}"),
                        ),
                      ),
                    ),
                  )
                : CircleAvatar(
                    child: Text(
                        "${_auth.currentUser.displayName.characters.first}")),
          ),
        ],
      ),
    );
  }
}
