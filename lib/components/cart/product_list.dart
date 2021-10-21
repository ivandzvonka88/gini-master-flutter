import 'package:flutter/material.dart';
import 'package:gini/components/cart/item.dart';
import 'package:gini/models/cart/final_cart_model.dart';

class CartProductList extends StatelessWidget {
  CartProductList({@required this.finalCart});
  final List<FinalCart> finalCart;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return ListView.separated(
        primary: false,
        shrinkWrap: true,
        padding: EdgeInsets.only(
            left: mediaQuery.padding.left,
            right: mediaQuery.padding.right,
            bottom: mediaQuery.padding.bottom),
        itemBuilder: (context, index) {
          final product = finalCart[index].product;
          final cartProduct = finalCart[index].cartProduct;
          return CartProductItem(product: product, cartProduct: cartProduct);
        },
        separatorBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child:
                Container(height: 1.0, color: Color.fromRGBO(226, 234, 241, 1)),
          );
        },
        itemCount: finalCart.length);
  }
}
