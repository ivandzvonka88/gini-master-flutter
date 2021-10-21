import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CheckoutProductItemImage extends StatelessWidget {
  CheckoutProductItemImage({@required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0,
      height: 100,
      decoration: BoxDecoration(
          color: Color.fromRGBO(243, 243, 241, 1),
          borderRadius: BorderRadius.circular(6.0)),
      child: CachedNetworkImage(imageUrl: image),
    );
  }
}
