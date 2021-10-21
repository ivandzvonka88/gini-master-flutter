import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gini/models/order/order_model.dart' as orderModel;

class DetailsOrderPaymentMethodValue extends StatelessWidget {
  DetailsOrderPaymentMethodValue({@required this.order});
  final orderModel.Order order;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    if (order.paymentType == "Wallet") {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          children: [
            Container(
                width: 32.0,
                height: 22.0,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(122, 110, 249, 1),
                    borderRadius: BorderRadius.circular(4.0)),
                child: Align(
                  child: SvgPicture.asset("assets/checkout/wallet.svg",
                      color: Colors.white, width: 12.0),
                )),
            SizedBox(width: 12.0),
            Text(
              "Wallet",
              style: TextStyle(
                color: Color.fromRGBO(83, 91, 98, 1),
                fontWeight: FontWeight.w600,
                fontSize: 14.0,
                height: mediaQuery.textScaleFactor * 1.14,
              ),
            ),
          ],
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: [
          Image.asset("assets/payment/${order.paymentMethod.card.brand}.png",
              height: 24.0),
          SizedBox(width: 12.0),
          Text(
            "Credit Card",
            style: TextStyle(
              color: Color.fromRGBO(83, 91, 98, 1),
              fontWeight: FontWeight.w600,
              fontSize: 14.0,
              height: mediaQuery.textScaleFactor * 1.14,
            ),
          ),
          Expanded(
            child: Text(
              "*${order.paymentMethod.card.last4}",
              textAlign: TextAlign.end,
              style: TextStyle(
                  color: Color.fromRGBO(83, 91, 98, 1),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  height: mediaQuery.textScaleFactor * 1.14),
            ),
          )
        ],
      ),
    );
  }
}
