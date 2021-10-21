import 'package:flutter/material.dart';
import 'package:gini/components/checkout/product/color.dart';
import 'package:gini/components/checkout/product/image.dart';
import 'package:gini/components/checkout/product/price.dart';
import 'package:gini/components/checkout/product/quantity.dart';
import 'package:gini/components/checkout/product/size.dart';
import 'package:gini/components/checkout/product/title.dart';
import 'package:gini/models/cart/final_cart_model.dart';

class CheckoutProductsListView extends StatelessWidget {
  CheckoutProductsListView({@required this.finalCartList});
  final List<FinalCart> finalCartList;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.zero,
        primary: false,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            height: 148.0,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                CheckoutProductItemImage(
                    image:
                        finalCartList[index].cartProduct.preferredColor.image),
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
                                child: CheckoutProductItemTitle(
                                    title: finalCartList[index].product.title),
                                flex: 60),
                            Flexible(
                                flex: 40,
                                child: CheckoutProductItemPrice(
                                    price: finalCartList[index].product.price))
                          ],
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                                child: CheckoutProductItemColor(
                                    color: finalCartList[index]
                                        .cartProduct
                                        .preferredColor
                                        .color)),
                            Flexible(
                                child: CheckoutProductItemSize(
                                    size: finalCartList[index]
                                        .cartProduct
                                        .preferredSize)),
                            Flexible(
                                child: CheckoutProductItemQuantity(
                                    quantity: finalCartList[index]
                                        .cartProduct
                                        .preferredQuantity,
                                    price: finalCartList[index]
                                        .product
                                        .price
                                        .toStringAsFixed(2))),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              height: 1.0,
              color: Color.fromRGBO(226, 234, 241, 1));
        },
        itemCount: finalCartList.length);
  }
}
