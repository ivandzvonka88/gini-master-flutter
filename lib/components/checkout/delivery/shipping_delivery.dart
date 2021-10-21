import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckoutDeliveryShipping extends StatelessWidget {
  CheckoutDeliveryShipping({@required this.isSelected, @required this.onTap});
  final bool isSelected;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        child: Row(
          children: [
            SizedBox(width: 16.0),
            SvgPicture.asset(
              "assets/checkout/delivery.svg",
              width: 22.0,
              color: isSelected
                  ? Color.fromRGBO(125, 106, 244, 1)
                  : Color.fromRGBO(152, 157, 168, 1),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Shipping Address",
                    style: TextStyle(
                        color: isSelected
                            ? Color.fromRGBO(125, 106, 244, 1)
                            : Color.fromRGBO(83, 91, 98, 1)),
                  ),
                  SizedBox(height: 4.0),
                  //TODO: Can get from server maybe
                  Text(
                    "Estimated time 7- 14 days",
                    style: TextStyle(
                        color: isSelected
                            ? Color.fromRGBO(125, 106, 244, 1)
                            : Color.fromRGBO(152, 157, 168, 1),
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                        height: mediaQuery.textScaleFactor * 1.14),
                  )
                ],
              ),
            ),
            isSelected
                ? SvgPicture.asset(
                    "assets/checkout/check_mark.svg",
                    height: 20.0,
                  )
                : SizedBox.shrink(),
            SizedBox(width: 16.0),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
