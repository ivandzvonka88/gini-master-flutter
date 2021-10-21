import 'package:flutter/material.dart';
import 'package:gini/models/order/order_model.dart' as orderModel;

class DetailsOrderTotal extends StatelessWidget {
  DetailsOrderTotal({@required this.order});
  final orderModel.Order order;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Total",
            style: TextStyle(
                color: Color.fromRGBO(83, 91, 98, 1),
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                height: mediaQuery.textScaleFactor * 1.14),
          ),
          Text(
            "${order.paid.total}",
            style: TextStyle(
              color: Color.fromRGBO(31, 30, 30, 1),
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              height: mediaQuery.textScaleFactor * 1.14,
            ),
          )
        ],
      ),
    );
  }
}
