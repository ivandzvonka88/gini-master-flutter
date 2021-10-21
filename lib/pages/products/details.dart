import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gini/components/products/details/bottom_stack.dart';
import 'package:gini/components/products/details/top_stack.dart';
import 'package:gini/models/product/product.dart';

class DetailsProductPage extends StatelessWidget {
  DetailsProductPage({@required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: mediaQuery.padding.left,
          right: mediaQuery.padding.right,
        ),
        child: Stack(
          children: [
            Container(height: 812.0),
            DetailsProductTopStack(images: product.images),
            DetailsProductBottomStack(product: product, globalKey: _scaffoldKey)
          ],
        ),
      ),
    );
  }
}
