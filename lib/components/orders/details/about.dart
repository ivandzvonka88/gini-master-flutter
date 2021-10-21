import 'package:flutter/material.dart';
import 'package:gini/components/orders/details/date.dart';
import 'package:gini/components/orders/details/order.dart';
import 'package:gini/components/orders/details/status.dart';
import 'package:gini/models/order/order_model.dart' as orderModel;

class OrderDetailsAbout extends StatelessWidget {
  OrderDetailsAbout({@required this.order, @required this.orderNo});
  final orderModel.Order order;
  final int orderNo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DetailsOrderNumber(order: orderNo),
          DetailsOrderDate(order: order),
          DetailsOrderStatus(status: order.status),
        ],
      ),
    );
  }
}
