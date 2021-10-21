import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gini/components/checkout/delivery/delivery_method_type_selection.dart';
import 'package:gini/models/checkout/checkout.dart';

class CheckoutShippingMethodSelectionRow extends StatelessWidget {
  CheckoutShippingMethodSelectionRow(
      {@required this.checkoutModel, @required this.refresh});
  final CheckoutModel checkoutModel;
  final VoidCallback refresh;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Shipping Method",
            style: TextStyle(
                color: Color.fromRGBO(31, 30, 30, 1),
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                height: mediaQuery.textScaleFactor * 1.14),
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            child: checkoutModel.deliveryMethod != null
                ? Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Text(
                          "${checkoutModel.deliveryMethod}",
                          style: TextStyle(
                              color: Color.fromRGBO(83, 91, 98, 1),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                              height: mediaQuery.textScaleFactor * 1.14),
                        ),
                        SizedBox(width: 16.0),
                        SvgPicture.asset("assets/checkout/arrow_forward.svg",
                            height: 12.0)
                      ],
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Text(
                          "Select Delivery",
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
                      CheckoutDeliveryMethods(checkoutModel: checkoutModel));

              refresh.call();
            },
          )
        ],
      ),
    );
  }
}
