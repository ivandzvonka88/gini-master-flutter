import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gini/components/cart/item/color.dart';
import 'package:gini/components/cart/item/image.dart';
import 'package:gini/components/cart/item/price.dart';
import 'package:gini/components/cart/item/quantity.dart';
import 'package:gini/components/cart/item/size.dart';
import 'package:gini/components/cart/item/title.dart';
import 'package:gini/models/cart/cart.dart';
import 'package:gini/models/product/product.dart';

class CartProductItem extends StatelessWidget {
  CartProductItem({@required this.product, @required this.cartProduct});
  final Product product;
  final CartProduct cartProduct;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      secondaryActions: [
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () async {
            try {
              await cartProduct.documentReference.delete();
            } catch (error) {
              print(error);
            }
          },
        ),
      ],
      child: Container(
        height: 148.0,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            CartProductItemImage(image: cartProduct.preferredColor.image),
            SizedBox(width: 16.0),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            child: CartProductItemTitle(title: product.title),
                            flex: 60),
                        Flexible(
                            flex: 40,
                            child: CartProductItemPrice(price: product.price))
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Flexible(
                    child: Row(
                      children: [
                        CartProductItemColor(
                            color: cartProduct.preferredColor.color),
                        Spacer(flex: 44),
                        CartProductItemSize(size: cartProduct.preferredSize),
                        Spacer(flex: 86),
                        CartProductItemQuantity(cartProduct: cartProduct)
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
