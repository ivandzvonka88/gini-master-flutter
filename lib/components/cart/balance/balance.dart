import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gini/components/cart/discount.dart';
import 'package:gini/components/cart/promo/promo.dart';
import 'package:gini/components/cart/total.dart';
import 'package:gini/models/cart/final_cart_model.dart';
import 'package:gini/models/promotion/promotion.dart';

class CartBalance extends StatefulWidget {
  CartBalance({@required this.finalCartList, @required this.promotion});
  final List<FinalCart> finalCartList;
  final Promotion promotion;
  @override
  _CartBalanceState createState() => _CartBalanceState();
}

class _CartBalanceState extends State<CartBalance> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slidable(
          actionPane: SlidableDrawerActionPane(),
          enabled: widget.promotion.code != null,
          secondaryActions: [
            IconSlideAction(
              caption: 'Remove',
              color: Colors.red,
              icon: Icons.delete,
              onTap: () {
                setState(() {
                  widget.promotion.discount = null;
                  widget.promotion.code = null;
                });
              },
            ),
          ],
          child: CartPromoCode(
              callback: (promotion) {
                if (mounted){
                  setState(() {
                    widget.promotion.discount = promotion.discount;
                    widget.promotion.code = promotion.code;
                  });
                }
              },
              promotion: widget.promotion),
        ),
        Container(height: 1.0, color: Color.fromRGBO(226, 234, 241, 1)),
        widget.promotion.discount != null
            ? CartDiscount(discount: widget.promotion.discount)
            : SizedBox.shrink(),
        CartTotalPrice(
            finalCartList: widget.finalCartList,
            discount: widget.promotion.discount),
      ],
    );
  }
}
