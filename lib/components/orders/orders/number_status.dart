import 'package:flutter/material.dart';
import 'package:gini/models/order/order_model.dart' as orderModel;

class OrderItemNumberStatus extends StatelessWidget {
  OrderItemNumberStatus({@required this.orderNumber, @required this.order});
  final int orderNumber;
  final orderModel.Order order;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    Color color;
    switch (order.status) {
      case "Cancelled":
        {
          color = Color.fromRGBO(227, 24, 54, 1);
        }
        break;
      case "Picked Up":
        {
          color = Color.fromRGBO(53, 164, 125, 1);
        }
        break;

      case "Delivered":
        {
          color = Color.fromRGBO(53, 164, 125, 1);
        }
        break;

      case "Shipped":
        {
          color = Color.fromRGBO(125, 106, 244, 1);
        }
        break;
      case "Waiting for pick up":
        {
          color = Color.fromRGBO(125, 106, 244, 1);
        }
        break;

      default:
        {
          color = Colors.black;
        }
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "Order #${orderNumber.toString().padLeft(6,"0")}",
              style: TextStyle(
                color: Color.fromRGBO(31, 30, 30, 1),
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              ),
            ),
          ),
          Text(
            "${order.status}",
            style: TextStyle(
                color: color,
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
                height: mediaQuery.textScaleFactor * 1.14),
          ),
        ],
      ),
    );
  }
}
