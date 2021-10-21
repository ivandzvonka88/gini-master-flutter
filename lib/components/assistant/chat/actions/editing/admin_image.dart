import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AdminImage extends StatelessWidget {
  AdminImage({@required this.url, @required this.isUser});

  final String url;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 24.0,left: 60),
        child:Row(

          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
                onTap: () {

                },
                child: Container(
                  width: 80.0,
                  height: 130.0,
                  margin: const EdgeInsets.only(right: 32.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(10.0)),
                    image: DecorationImage(
                        fit: BoxFit.fill, image: CachedNetworkImageProvider(url)
                      // image: CachedNetworkImageProvider(imageUrl),
                    ),
                  ),
                ))
          ],
        ));
  }


}
