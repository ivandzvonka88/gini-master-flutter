import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gini/models/cart/cart.dart';

class CartProductItemQuantity extends StatelessWidget {
  CartProductItemQuantity({@required this.cartProduct});
  final CartProduct cartProduct;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(50.0),
          child: SvgPicture.asset("assets/cart/minus.svg",
              height: 16.0, width: 16.0),
          onTap: () async {
            try {
             if (cartProduct.preferredQuantity > 1){
               await cartProduct.documentReference
                   .update({'preferredQuantity': FieldValue.increment(-1)});
             }
            } catch (error) {
              print(error);
            }
          },
        ),
        SizedBox(width: 20),
        Text(
          "${cartProduct.preferredQuantity}",
          style: TextStyle(
              color: Color.fromRGBO(66, 74, 82, 1),
              fontSize: 14.0,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(width: 20),
        InkWell(
            borderRadius: BorderRadius.circular(50.0),
            child: SvgPicture.asset("assets/cart/plus.svg",
                height: 16.0, width: 16.0),
            onTap: () async {
              try {
                await cartProduct.documentReference
                    .update({'preferredQuantity': FieldValue.increment(1)});
              } catch (error) {
                print(error);
              }
            }),
      ],
    );
  }
}
