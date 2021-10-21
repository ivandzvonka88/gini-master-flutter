import 'package:flutter/material.dart';
import 'package:gini/models/order/order_model.dart' as orderModel;
import 'package:gini/pages/orders/details.dart';

class OrderItemTrack extends StatelessWidget {
  OrderItemTrack({@required this.order, @required this.index});
  final orderModel.Order order;
  final int index;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    bool showTrack = order.status == "Shipped";
    return showTrack
        ? Column(
            children: [
              Container(height: 1.0, color: Color.fromRGBO(221, 225, 234, 1)),
              SizedBox(height: 16.0),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Track Order",
                    style: TextStyle(
                      color: Color.fromRGBO(125, 106, 244, 1),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      height: 1.14 * mediaQuery.textScaleFactor,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              OrderDetailsPage(order: order, orderNo: index)));
                },
              ),
              SizedBox(height: 16.0),
              Container(height: 1.0, color: Color.fromRGBO(221, 225, 234, 1)),
            ],
          )
        : SizedBox.shrink();
  }
}
