import 'package:flutter/material.dart';
import 'package:gini/models/order/order_model.dart' as orderModel;
import 'package:intl/intl.dart';

class DetailsOrderDate extends StatelessWidget {
  DetailsOrderDate({@required this.order});
  final orderModel.Order order;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    String dateTime = "${order.timeStamp.toDate().toLocal().day} "
        "${DateFormat(DateFormat.YEAR_ABBR_MONTH).format(order.timeStamp.toDate().toLocal())}";
    return Flexible(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Order date",
          style: TextStyle(
              color: Color.fromRGBO(31, 30, 30, 1),
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              height: mediaQuery.textScaleFactor * 1.50),
        ),
        SizedBox(
          height: 4.0,
        ),
        Text(
          "$dateTime",
          style: TextStyle(
              color: Color.fromRGBO(83, 91, 98, 1),
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              height: mediaQuery.textScaleFactor * 1.50),
        )
      ]),
    );
  }
}
