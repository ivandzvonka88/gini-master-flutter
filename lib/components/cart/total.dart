import 'package:flutter/material.dart';
import 'package:gini/models/cart/final_cart_model.dart';

class CartTotalPrice extends StatelessWidget {
  CartTotalPrice({@required this.finalCartList, @required this.discount});
  final List<FinalCart> finalCartList;
  final double discount;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double totalPrice = 0;
    finalCartList.forEach((element) {
      for (int i = 0; i < element.cartProduct.preferredQuantity; i++) {
        totalPrice = totalPrice + element.product.price;
      }
    });
    if (discount != null) {
      totalPrice = totalPrice - discount;
    }
    return Padding(
      padding: mediaQuery.padding.add(EdgeInsets.symmetric(horizontal: 16.0)
          .add(
              discount == null ? EdgeInsets.only(top: 24.0) : EdgeInsets.zero)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Total",
            style: TextStyle(
                color: Color.fromRGBO(128, 139, 149, 1),
                fontWeight: FontWeight.w500,
                fontSize: 18.0,
                height: mediaQuery.textScaleFactor * 1.17),
          ),
          Text(
            "\$${totalPrice.toStringAsFixed(2)}",
            style: TextStyle(
                color: Color.fromRGBO(66, 74, 82, 1),
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                height: 1.17 * mediaQuery.textScaleFactor),
          )
        ],
      ),
    );
  }
}
