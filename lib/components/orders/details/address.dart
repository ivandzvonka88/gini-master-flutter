import 'package:flutter/material.dart';
import 'package:gini/models/order/order_model.dart' as orderModel;

class DetailsOrderAddress extends StatelessWidget {
  DetailsOrderAddress({@required this.order});
  final orderModel.Order order;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    if (order.deliveryMethod == "In-Store Pick Up") {
      return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "${order.deliveryMethod}",
            style: TextStyle(
                color: Color.fromRGBO(83, 91, 98, 1),
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
                height: mediaQuery.textScaleFactor * 1.50),
          ),
        ),
      );
    }

    final orderModel.ShippingAddress shippingAddress = order.shippingAddress;
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          "${shippingAddress.apartment != "" ? "${shippingAddress.apartment} " : ""}"
          "${shippingAddress.streetAddress}, "
          "${shippingAddress.city}, "
          "${shippingAddress.state}, "
          "${shippingAddress.zip}, "
          "${shippingAddress.phone}",
          style: TextStyle(
              color: Color.fromRGBO(83, 91, 98, 1),
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
              height: mediaQuery.textScaleFactor * 1.50),
        ),
      ),
    );
  }
}
