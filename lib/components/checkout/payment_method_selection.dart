import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gini/components/checkout/payment/get_payment_methods.dart';
import 'package:gini/models/checkout/checkout.dart';

class CheckoutPaymentSelectionRow extends StatelessWidget {
  CheckoutPaymentSelectionRow(
      {@required this.checkoutModel, @required this.refresh});
  final CheckoutModel checkoutModel;
  final VoidCallback refresh;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final bool isPaymentMethodFilled =
        checkoutModel.paymentMethodModel != null ||
            checkoutModel.wallet != null;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Payment Method",
            style: TextStyle(
                color: Color.fromRGBO(31, 30, 30, 1),
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                height: mediaQuery.textScaleFactor * 1.14),
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            child: isPaymentMethodFilled
                ? checkoutModel.wallet != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Wallet",
                              style: TextStyle(
                                  color: Color.fromRGBO(83, 91, 98, 1),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                  height: mediaQuery.textScaleFactor * 1.14),
                            ),
                            SizedBox(width: 16.0),
                            SvgPicture.asset(
                                "assets/checkout/arrow_forward.svg",
                                height: 12.0)
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                                "assets/payment/${checkoutModel.paymentMethodModel.card.brand}.png",
                                height: 20.0),
                            SizedBox(width: 8.0),
                            Text(
                              "${toCamelCase(checkoutModel.paymentMethodModel.card.brand)}",
                              style: TextStyle(
                                  color: Color.fromRGBO(83, 91, 98, 1),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                  height: mediaQuery.textScaleFactor * 1.14),
                            ),
                            SizedBox(width: 16.0),
                            SvgPicture.asset(
                                "assets/checkout/arrow_forward.svg",
                                height: 12.0)
                          ],
                        ),
                      )
                : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Text(
                          "Select Payment",
                          style: TextStyle(
                              color: Color.fromRGBO(125, 106, 244, 1),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                              height: mediaQuery.textScaleFactor * 1.14),
                        ),
                        SizedBox(width: 16.0),
                        SvgPicture.asset("assets/checkout/arrow_forward.svg",
                            color: Color.fromRGBO(125, 106, 244, 1),
                            height: 12.0)
                      ],
                    ),
                  ),
            onTap: () async {
              await showModalBottomSheet(
                  context: context,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  builder: (sheetContext) =>
                      CheckoutGetPaymentMethods(checkoutModel: checkoutModel));

              refresh.call();
            },
          )
        ],
      ),
    );
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
