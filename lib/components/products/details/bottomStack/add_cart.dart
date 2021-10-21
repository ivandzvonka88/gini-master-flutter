import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gini/app/config/constants.dart';
import 'package:gini/models/product/product.dart';
import 'package:gini/models/product/user_preference.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

class DetailsProductAddToCart extends StatelessWidget {
  DetailsProductAddToCart(
      {@required this.product,
      @required this.productPreference,
      @required this.globalKey});
  final Product product;
  final ProductPreference productPreference;
  final GlobalKey<ScaffoldState> globalKey;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        height: 64.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            gradient: linearGradient),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 24.0),
                SvgPicture.asset("assets/ui/cart_two.svg",
                    semanticsLabel: "Add to Cart",
                    color: Colors.white,
                    height: 20.0),
                SizedBox(width: 18.0),
                Expanded(
                    child: Text("Add to Cart",
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w700))),
                Text("\$${product.price.toStringAsFixed(2)}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        height: mediaQuery.textScaleFactor * 1.12)),
                SizedBox(width: 24.0),
              ],
            ),
            onTap: () async {
              if (productPreference.preferredColor == null) {
                globalKey.currentState.removeCurrentSnackBar();
                globalKey.currentState.showSnackBar(SnackBar(
                    content: Text("Please select color"),
                    duration: Duration(seconds: 1)));
                return;
              }
              if (productPreference.preferredSize == null) {
                globalKey.currentState.removeCurrentSnackBar();
                globalKey.currentState.showSnackBar(SnackBar(
                    content: Text("Please select size"),
                    duration: Duration(seconds: 1)));
                return;
              }
              try {
                ProductColors colors =
                    product.productColors[productPreference.preferredColor];
                String size = product.sizes[productPreference.preferredSize];
                String doc =
                    "${product.productReference.split("/").last}${colors.color}$size";

                await _firebaseFirestore
                    .collection("usersData")
                    .doc(_auth.currentUser.uid)
                    .collection("cart")
                    .doc("$doc")
                    .set({
                  'timeStamp': FieldValue.serverTimestamp(),
                  'preferredColor': colors.toJson(),
                  'preferredSize:': size,
                  'preferredQuantity': FieldValue.increment(1),
                  'productReference': product.productReference
                }, SetOptions(merge: true));
              } catch (error) {
                globalKey.currentState.removeCurrentSnackBar();
                globalKey.currentState
                    .showSnackBar(SnackBar(content: Text("${error}")));
              }
            },
          ),
        ),
      ),
    );
  }
}
