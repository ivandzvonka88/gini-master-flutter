import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gini/app/config/constants.dart';
import 'package:gini/models/cart/cart.dart';
import 'package:gini/pages/cart/cart.dart';

FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
FirebaseAuth _auth = FirebaseAuth.instance;

class DetailsProductCartIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 60.0,
      right: 16.0,
      child: Stack(
        children: [
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60.0)),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(60.0),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => CartPage(), fullscreenDialog: true),
                  );
                },
                child: Align(
                  child: Container(
                    child: Align(
                      child: SvgPicture.asset(
                        "assets/ui/cart_two.svg",
                        semanticsLabel: "Cart",
                        color: Color.fromRGBO(31, 30, 30, 1),
                        height: 20.0,
                        width: 20.0,
                      ),
                    ),
                    height: 40.0,
                    width: 40.0,
                  ),
                ),
              ),
            ),
          ),
          StreamBuilder<QuerySnapshot>(
              stream: _firebaseFirestore
                  .collection("usersData")
                  .doc(_auth.currentUser.uid)
                  .collection("cart")
                  .snapshots(),
              builder: (context, snapshot) {
                int length = 0;
                try {
                  snapshot.data.docs.forEach((element) {
                    CartProduct cart = CartProduct.fromJson(element.data());
                    length = cart.preferredQuantity + length;
                  });
                } catch (error) {
                  print(error);
                }
                return length > 0
                    ? Positioned(
                        child: Container(
                          alignment: Alignment.center,
                          height: 16.0,
                          width: 16.0,
                          decoration: BoxDecoration(
                            gradient: linearGradient,
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          child: AutoSizeText(
                            "$length",
                            maxLines: 1,
                            minFontSize: 6,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        top: 0.0,
                        right: 0.0,
                      )
                    : SizedBox.shrink();
              })
        ],
      ),
    );
  }
}
