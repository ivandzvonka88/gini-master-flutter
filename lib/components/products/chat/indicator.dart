import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:gini/components/products/chat/in_chat_products.dart';

class InChatProductsIndicator extends StatefulWidget {
  InChatProductsIndicator(
      {Key key, @required this.length})
      : super(key: key);
  final int length;
  @override
  _InChatProductsIndicatorState createState() =>
      _InChatProductsIndicatorState();
}

class _InChatProductsIndicatorState extends State<InChatProductsIndicator> {
  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: widget.length,
      position: activeIndex.toDouble(),
      decorator: DotsDecorator(
          color: Color(0xFFD2DAE0),
          spacing: EdgeInsets.all(4.0),
          size: Size(8.0, 8.0),
          activeColor: Color(0xFFA0ACB6)),
    );
  }
}
