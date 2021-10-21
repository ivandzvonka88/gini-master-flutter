import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckoutDeliveryInStorePickUp extends StatelessWidget {
  CheckoutDeliveryInStorePickUp(
      {@required this.isSelected, @required this.onTap});
  final bool isSelected;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 28.0),
        child: Row(
          children: [
            SizedBox(width: 16.0),
            SvgPicture.asset(
              "assets/checkout/shop_icon.svg",
              height: 18.0,
              color: isSelected
                  ? Color.fromRGBO(125, 106, 244, 1)
                  : Color.fromRGBO(152, 157, 168, 1),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Text(
                "In-Store Pick Up",
                style: TextStyle(
                    color: isSelected
                        ? Color.fromRGBO(125, 106, 244, 1)
                        : Color.fromRGBO(83, 91, 98, 1)),
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
