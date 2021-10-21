import 'package:flutter/material.dart';
import 'package:gini/components/checkout/delivery/in_store_pick_up.dart';
import 'package:gini/components/checkout/delivery/shipping_delivery.dart';
import 'package:gini/components/checkout/delivery/shipping_method_word.dart';
import 'package:gini/models/checkout/checkout.dart';

class CheckoutDeliveryMethods extends StatefulWidget {
  CheckoutDeliveryMethods({@required this.checkoutModel});
  final CheckoutModel checkoutModel;
  @override
  _CheckoutDeliveryMethodsState createState() =>
      _CheckoutDeliveryMethodsState();
}

class _CheckoutDeliveryMethodsState extends State<CheckoutDeliveryMethods> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SingleChildScrollView(
      padding: mediaQuery.padding,
      child: Column(
        children: [
          SizedBox(height: 24.0),
          CheckoutDeliveryShippingMethodWord(),
          SizedBox(height: 24.0),
          Container(height: 1.0, color: Color.fromRGBO(226, 234, 241, 1)),
          CheckoutDeliveryInStorePickUp(
            isSelected:
                widget.checkoutModel.deliveryMethod == "In-Store Pick Up",
            onTap: () {
              setState(() {
                widget.checkoutModel.deliveryMethod = "In-Store Pick Up";
              });
            },
          ),
          Container(height: 1.0, color: Color.fromRGBO(226, 234, 241, 1)),
          Container(height: 1.0, color: Color.fromRGBO(226, 234, 241, 1)),
          CheckoutDeliveryShipping(
            isSelected:
                widget.checkoutModel.deliveryMethod == "Shipping Address",
            onTap: () {
              setState(() {
                widget.checkoutModel.deliveryMethod = "Shipping Address";
              });
            },
          ),
          Container(height: 1.0, color: Color.fromRGBO(226, 234, 241, 1)),
        ],
      ),
    );
  }
}
