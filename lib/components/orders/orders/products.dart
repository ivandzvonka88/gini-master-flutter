import 'package:flutter/material.dart';
import 'package:gini/components/orders/details/product_item/color.dart';
import 'package:gini/components/orders/details/product_item/image.dart';
import 'package:gini/components/orders/details/product_item/price.dart';
import 'package:gini/components/orders/details/product_item/quantity.dart';
import 'package:gini/components/orders/details/product_item/size.dart';
import 'package:gini/components/orders/details/product_item/title.dart';
import 'package:gini/models/order/order_model.dart' as orderModel;

class OrderProductsList extends StatelessWidget {
  OrderProductsList({@required this.order});
  final orderModel.Order order;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.zero,
        primary: false,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            height: 148.0,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                DetailsOrderProductItemImage(
                    image: order.carProduct[index].preferredColor.image),
                SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DetailsOrderProductItemTitle(
                          title: order.products[index].title),
                      SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DetailsOrderProductItemColor(
                              color:
                                  order.carProduct[index].preferredColor.color),
                          DetailsOrderProductItemSize(
                              size: order.carProduct[index].preferredSize),
                          DetailsOrderProductItemQuantity(
                              quantity:
                                  order.carProduct[index].preferredQuantity)
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(width: 24.0),
                DetailsOrderProductItemPrice(
                    price: order.products[index].price.toStringAsFixed(2))
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Container(
              height: 1.0, color: Color.fromRGBO(226, 234, 241, 1));
        },
        itemCount: order.carProduct.length);
  }
}
