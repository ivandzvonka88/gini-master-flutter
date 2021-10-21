import 'package:flutter/material.dart';
import 'package:gini/components/checkout/delivery_charges.dart';
import 'package:gini/components/checkout/taxes.dart';
import 'package:gini/components/checkout/total.dart';
import 'package:gini/models/checkout/checkout.dart';

class CheckoutBalance extends StatelessWidget {
  CheckoutBalance({@required this.checkoutModel, this.subTotal});
  final CheckoutModel checkoutModel;
  final double subTotal;

  @override
  Widget build(BuildContext context) {
    final bool isPaymentFilled = checkoutModel.paymentMethodModel != null ||
        checkoutModel.wallet != null;
    final bool isDeliveryTypeFilled = checkoutModel.deliveryMethod != null;
    final bool isShippingNotNull = checkoutModel.shippingAddress != null &&
        checkoutModel.deliveryMethod != "In-Store Pick Up";
    final bool isShippingFilled = checkoutModel.shippingAddress != null ||
        checkoutModel.deliveryMethod == "In-Store Pick Up";
    final isDataFilled =
        isPaymentFilled && isDeliveryTypeFilled && isShippingFilled;
    return isDataFilled
        ? Column(
            children: [
              isShippingNotNull ? SizedBox(height: 16.0) : SizedBox.shrink(),
              isShippingNotNull
                  ? CheckoutDeliveryCharges(checkoutModel: checkoutModel)
                  : SizedBox.shrink(),
              SizedBox(height: 16.0),
              CheckoutTaxes(subTotal: subTotal),
              SizedBox(height: 16.0),
              CheckoutTotal(checkoutModel: checkoutModel, subTotal: subTotal),
            ],
          )
        : SizedBox.shrink();
  }
}
