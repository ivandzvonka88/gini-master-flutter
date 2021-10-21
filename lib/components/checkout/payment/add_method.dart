import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gini/models/checkout/checkout.dart';
import 'package:gini/pages/wallet/card/add_credit_card.dart';
import 'package:stripe_payment/stripe_payment.dart';

class CheckoutAddPaymentMethod extends StatelessWidget {
  CheckoutAddPaymentMethod({@required this.checkoutModel});
  final CheckoutModel checkoutModel;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return InkWell(
      child: Container(
        height: 72.0,
        alignment: Alignment.center,
        child: Center(
          child: Row(
            children: [
              SizedBox(width: 16.0),
              Container(
                  width: 32.0,
                  height: 22.0,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(152, 157, 168, 1),
                      borderRadius: BorderRadius.circular(4.0)),
                  child: Align(
                      child: SvgPicture.asset("assets/checkout/add.svg",
                          width: 10.0))),
              SizedBox(width: 16.0),
              Expanded(
                child: Text(
                  "Add Payment Method",
                  style: TextStyle(
                      color: Color.fromRGBO(83, 91, 98, 1),
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                      height: mediaQuery.textScaleFactor * 1.07),
                ),
              ),
              SvgPicture.asset(
                "assets/checkout/arrow_forward.svg",
                height: 12.0,
                color: Color.fromRGBO(178, 189, 199, 1),
              ),
              SizedBox(width: 16.0),
            ],
          ),
        ),
      ),
      onTap: () async {
        PaymentMethod paymentMethod = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddCreditCardPaymentMethodPage()));
        if (paymentMethod != null) {
          checkoutModel.paymentMethodModel = paymentMethod;
        }
      },
    );
  }
}
