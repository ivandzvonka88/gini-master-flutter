import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';

class AssistantChatEditingImage extends StatelessWidget {
  AssistantChatEditingImage({@required this.url, @required this.isUser});
  final String url;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 64.0, left: 64.0, top: 16.0, bottom: 8.0),
      child: Container(
        alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
        height: 150.0,
        child: FullScreenWidget(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(imageUrl: "$url"),
            // child: Image.network("$url"),
          ),
        ),
      ),
    );
  }
}
