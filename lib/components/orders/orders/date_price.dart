import 'package:flutter/material.dart';
import 'package:gini/models/order/order_model.dart' as orderModel;
import 'package:intl/intl.dart';

class OrderItemDatePrice extends StatelessWidget {
  OrderItemDatePrice({@required this.order});
  final orderModel.Order order;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    String dateTime = "${order.timeStamp.toDate().toLocal().day} "
        "${DateFormat(DateFormat.YEAR_ABBR_MONTH).format(order.timeStamp.toDate().toLocal())}";
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "$dateTime",
              style: TextStyle(
                color: Color.fromRGBO(83, 91, 98, 1),
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
                height: mediaQuery.textScaleFactor * 1.14,
              ),
            ),
          ),
          Text(
            "\$${order.paid.total.toStringAsFixed(2)}",
            style: TextStyle(
                color: Color.fromRGBO(66, 74, 82, 1),
                fontWeight: FontWeight.w600,
                fontSize: 14.0,
                height: mediaQuery.textScaleFactor * 1.14),
          ),
        ],
      ),
    );
  }
}
