import 'package:flutter/material.dart';
import 'package:gini/app/config/constants.dart';
import 'package:gini/models/cart/final_cart_model.dart';
import 'package:gini/models/promotion/promotion.dart';
import 'package:gini/pages/checkout/checkout.dart';

class CartCheckOutButton extends StatelessWidget {
  CartCheckOutButton({@required this.promotion, @required this.finalCartList});
  final Promotion promotion;
  final List<FinalCart> finalCartList;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Align(
      child: Container(
        alignment: Alignment.center,
        height: 64.0,
        width: 250.0,
        decoration: BoxDecoration(
            gradient: linearGradient,
            borderRadius: BorderRadius.circular(50.0)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(50.0),
            child: Center(
              child: Text(
                "Checkout",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                    height: mediaQuery.textScaleFactor * 0.89),
              ),
            ),
            onTap: () async {
              // await _firebaseFirestore
              //     .collection("usersData")
              //     .doc(_auth.currentUser.uid)
              //     .collection("usedPromotions")
              //     .add(promotion.toJson());
              // promotion.code = null;
              // promotion.discount = null;

              double subTotalPrice = 0;
              finalCartList.forEach((element) {
                for (int i = 0;
                    i < element.cartProduct.preferredQuantity;
                    i++) {
                  subTotalPrice = subTotalPrice + element.product.price;
                }
              });

              if (promotion.code != null && promotion.discount != null) {
                subTotalPrice = subTotalPrice - promotion.discount;
              }

              await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CheckoutPage(
                          finalCartList: finalCartList,
                          subTotal: subTotalPrice)));
            },
          ),
        ),
      ),
    );
  }
}
