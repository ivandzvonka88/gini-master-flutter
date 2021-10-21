import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class DetailsProductSliderIndicator extends StatelessWidget {
  DetailsProductSliderIndicator(
      {@required this.position,
      @required this.imagesLength});
  final int imagesLength;
  final int position;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 75.0,
      left: 0.0,
      right: 0.0,
      child: DotsIndicator(
        dotsCount: imagesLength,
        position: position.toDouble(),
        decorator: DotsDecorator(
            color: Color.fromRGBO(160, 172, 182, 0.5),
            spacing: EdgeInsets.all(4.0),
            size: Size(8.0, 8.0),
            activeColor: Colors.white),
      ),
    );
  }
}
