import 'package:flutter/material.dart';
import 'package:gini/components/orders/orders/date_price.dart';
import 'package:gini/components/orders/orders/number_status.dart';
import 'package:gini/components/orders/orders/products.dart';
import 'package:gini/components/orders/orders/track.dart';
import 'package:gini/models/order/order_model.dart' as orderModel;

class OrderItem extends StatelessWidget {
  OrderItem({@required this.index, @required this.order});
  final int index;
  final orderModel.Order order;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 32.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: Color.fromRGBO(221, 225, 234, 1),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 24.0),
          OrderItemNumberStatus(orderNumber: index + 1, order: order),
          SizedBox(height: 24.0),
          Container(height: 1.0, color: Color.fromRGBO(221, 225, 234, 1)),
          OrderProductsList(order: order),
          Container(height: 1.0, color: Color.fromRGBO(221, 225, 234, 1)),
          SizedBox(height: 24.0),
          OrderItemDatePrice(order: order),
          SizedBox(height: 24.0),
          OrderItemTrack(order: order, index: index + 1)
        ],
      ),
    );
  }
}
