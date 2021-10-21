import 'package:flutter/material.dart';
import 'package:gini/components/products/chat/item/image.dart';
import 'package:gini/components/products/chat/item/price.dart';
import 'package:gini/components/products/chat/item/title.dart';
import 'package:gini/models/product/product.dart';
import 'package:gini/pages/products/details.dart';

class InChatProductsListItem extends StatelessWidget {
  InChatProductsListItem({@required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(
          right: 16.0,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            border: Border.all(color: Color(0xffdde1ea))),
        child: Column(
          children: [
            InChatProductItemImage(imageUrl: product.image),
            InChatProductItemTitle(title: product.title),
            InChatProductItemPrice(price: product.price),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => DetailsProductPage(product: product)));
      },
    );
  }
}
