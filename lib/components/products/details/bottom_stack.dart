import 'package:flutter/material.dart';
import 'package:gini/components/products/details/bottomStack/add_cart.dart';
import 'package:gini/components/products/details/bottomStack/description.dart';
import 'package:gini/components/products/details/bottomStack/row.dart';
import 'package:gini/components/products/details/bottomStack/title.dart';
import 'package:gini/models/product/product.dart';
import 'package:gini/models/product/user_preference.dart';

class DetailsProductBottomStack extends StatelessWidget {
  DetailsProductBottomStack({@required this.product, @required this.globalKey});
  final Product product;
  final GlobalKey<ScaffoldState> globalKey;
  final productPreference = ProductPreference();
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 435.0,
      left: 0.0,
      right: 0.0,
      child: Container(
        height: 377.0,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12.0),
                topLeft: Radius.circular(12.0))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 22.0),
            DetailsProductTitle(),
            SizedBox(height: 16.0),
            DetailsProductDescription(description: product.content),
            SizedBox(height: 32.0),
            DetailsProductRow(
                product: product, productPreference: productPreference),
            SizedBox(height: 24.0),
            DetailsProductAddToCart(
                product: product,
                productPreference: productPreference,
                globalKey: globalKey),
          ],
        ),
      ),
    );
  }
}
