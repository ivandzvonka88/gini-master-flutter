import 'package:flutter/material.dart';
import 'package:gini/components/products/details/bottomStack/colors.dart';
import 'package:gini/components/products/details/bottomStack/sizes.dart';
import 'package:gini/models/product/product.dart';
import 'package:gini/models/product/user_preference.dart';

class DetailsProductRow extends StatelessWidget {
  DetailsProductRow({@required this.product, @required this.productPreference});
  final Product product;
  final ProductPreference productPreference;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              flex: 178,
              child: DetailsProductColors(
                  colors: product.productColors,
                  productPreference: productPreference)),
          Spacer(flex: 32),
          Expanded(
              flex: 149,
              child: DetailsProductSizes(
                  sizes: product.sizes, productPreference: productPreference)),
        ],
      ),
    );
  }
}
