import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class InChatProductItemImage extends StatelessWidget {
  InChatProductItemImage({@required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 8, left: 16.0, right: 16.0, bottom: 1.0),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        height: 180,
        width: 144,
        errorWidget: (_, __, ___) => Center(
          child: Icon(Icons.error),
        ),
      ),
    );
  }
}
