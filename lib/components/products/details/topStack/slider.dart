import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DetailsProductImagesSlider extends StatelessWidget {
  DetailsProductImagesSlider(
      {@required this.images,
      @required this.onPageChanged});
  final List<String> images;
  final Function(int, CarouselPageChangedReason) onPageChanged;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          initialPage: 0,
          viewportFraction: 1.0,
          onPageChanged: onPageChanged,
          height: 494.0),
      items: images != null && images.isNotEmpty
          ? List.generate(images.length, (index) {
              return Container(
                width: double.infinity,
                child: CachedNetworkImage(
                  imageUrl: images[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              );
            })
          : [],
    );
  }
}
