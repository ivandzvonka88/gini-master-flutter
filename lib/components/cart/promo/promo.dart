import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gini/components/cart/promo/promo_code.dart';
import 'package:gini/models/promotion/promotion.dart';

class CartPromoCode extends StatefulWidget {
  CartPromoCode({@required this.promotion, @required this.callback});
  final Promotion promotion;
  final Function(Promotion) callback;

  @override
  _CartPromoCodeState createState() => _CartPromoCodeState();
}

class _CartPromoCodeState extends State<CartPromoCode> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return InkWell(
      child: Padding(
        padding: mediaQuery.padding.add(EdgeInsets.all(16.0)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            "Promo code",
            style: TextStyle(
                color: Color.fromRGBO(128, 139, 149, 1),
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                height: 1.31),
          ),
          widget.promotion.code != null
              ? Text(
                  "${widget.promotion.code}",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                      color: Color.fromRGBO(125, 106, 244, 1),
                      height: mediaQuery.textScaleFactor * 1.31),
                )
              : SvgPicture.asset(
                  "assets/ui/arrow_down.svg",
                  semanticsLabel: "Promo code",
                  color: Color.fromRGBO(31, 30, 30, 1),
                  width: 12.0,
                )
        ]),
      ),
      onTap: () async {
        Promotion promotionLocal = await showModalBottomSheet(
          context: context,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(10.0),
            ),
          ),
          builder: (sheetContext) => PromoCode(sheetContext: sheetContext),
        );
        if (promotionLocal != null) {
          widget.promotion.code = promotionLocal.code;
          widget.promotion.discount = promotionLocal.discount;
          widget.callback(promotionLocal);
        }
      },
    );
  }
}
