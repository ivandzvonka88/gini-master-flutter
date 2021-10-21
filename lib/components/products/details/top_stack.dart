import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gini/components/products/details/topStack/cart_icon.dart';
import 'package:gini/components/products/details/topStack/close.dart';
import 'package:gini/components/products/details/topStack/indicator.dart';
import 'package:gini/components/products/details/topStack/slider.dart';

class DetailsProductTopStack extends StatefulWidget {
  DetailsProductTopStack({@required this.images});
  final List<String> images;

  @override
  _DetailsProductTopStackState createState() => _DetailsProductTopStackState();
}

class _DetailsProductTopStackState extends State<DetailsProductTopStack> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(DetailsProductTopStack oldWidget) {
    currentIndex = 0;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DetailsProductImagesSlider(
            images: widget.images,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            }),
        DetailsProductSliderIndicator(
          position: currentIndex,
          imagesLength: widget.images.length
        ),
        DetailsProductClose(),
        DetailsProductCartIcon()
      ],
    );
  }
}
