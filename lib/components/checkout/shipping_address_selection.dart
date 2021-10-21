import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gini/components/checkout/shipping/get_addresses.dart';
import 'package:gini/models/checkout/checkout.dart';
import 'package:gini/models/shipping/shipping.dart';
import 'package:gini/pages/shipping/shipping.dart';

class CheckoutShippingSelectionRow extends StatelessWidget {
  CheckoutShippingSelectionRow(
      {@required this.checkoutModel,
      @required this.scaffoldKey,
      @required this.refresh});
  final CheckoutModel checkoutModel;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final VoidCallback refresh;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    ShippingAddress shippingAddress = checkoutModel.shippingAddress;
    if (checkoutModel.deliveryMethod != null &&
        checkoutModel.deliveryMethod == "In-Store Pick Up") {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 28.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Shipping Address",
                    style: TextStyle(
                        color: Color.fromRGBO(31, 30, 30, 1),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        height: mediaQuery.textScaleFactor * 1.14),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    "In-Store Pick Up",
                    style: TextStyle(
                        color: Color.fromRGBO(83, 91, 98, 1),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        height: mediaQuery.textScaleFactor * 1.50),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
    return shippingAddress != null
        ? InkWell(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 28.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 70,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Shipping Address",
                          style: TextStyle(
                              color: Color.fromRGBO(31, 30, 30, 1),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                              height: mediaQuery.textScaleFactor * 1.14),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          "${shippingAddress.apartment != "" ? "${shippingAddress.apartment} " : ""}"
                          "${shippingAddress.streetAddress}, "
                          "${shippingAddress.city}, "
                          "${shippingAddress.state}, "
                          "${shippingAddress.zip}, "
                          "${shippingAddress.phone}",
                          style: TextStyle(
                              color: Color.fromRGBO(83, 91, 98, 1),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              height: mediaQuery.textScaleFactor * 1.50),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 30,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: SvgPicture.asset(
                          "assets/checkout/arrow_forward.svg",
                          color: Color.fromRGBO(83, 91, 98, 1),
                          height: 12.0),
                    ),
                  )
                ],
              ),
            ),
            onTap: () async {
              ShippingAddress shippingAddress = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ShippingFormPage()));
              if (shippingAddress != null) {
                checkoutModel.shippingAddress = shippingAddress;
                refresh.call();
              }
            },
          )
        : Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Shipping Address",
                  style: TextStyle(
                      color: Color.fromRGBO(31, 30, 30, 1),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      height: mediaQuery.textScaleFactor * 1.14),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Text(
                          "Select Address",
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
                    ShippingAddress shippingAddress = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShippingFormPage()));
                    if (shippingAddress != null) {
                      checkoutModel.shippingAddress = shippingAddress;
                      refresh.call();
                    }
                  },
                )
              ],
            ),
          );
  }
}
