import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stripe_payment/stripe_payment.dart';

class CheckoutPaymentMethodItem extends StatelessWidget {
  CheckoutPaymentMethodItem(
      {@required this.isSelected,
      @required this.paymentMethod,
      @required this.onTap});
  final bool isSelected;
  final PaymentMethod paymentMethod;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    var icon;
    try {
      icon = SvgPicture.asset("assets/brands/${paymentMethod.card.brand}.svg");
    } catch (error) {
      print(error);
    }
    try {
      return InkWell(
        child: Container(
          height: 72.0,
          child: Center(
            child: Row(
              children: [
                SizedBox(width: 16.0),
                icon != null ? icon : SizedBox(width: 32.0),
                SizedBox(width: 16.0),
                Text(
                  "···· ${paymentMethod.card.last4}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(83, 91, 98, 1)),
                ),
                Spacer(),
                SizedBox(width: 16.0),
                isSelected
                    ? SvgPicture.asset(
                        "assets/checkout/check_mark.svg",
                        height: 20.0,
                      )
                    : SizedBox(width: 20.0),
                SizedBox(width: 16.0),
              ],
            ),
          ),
        ),
        onTap: onTap,
      );
    } catch (error) {
      return SizedBox.shrink();
    }
  }

  String toCamelCase(String value) {
    String newName = "";
    value.split(" ").forEach((element) {
      newName = "$newName ${element.characters.first.toUpperCase()}"
          "${element.substring(1)}";
    });
    return newName;
  }
}
