import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gini/components/cart/app_bar.dart';
import 'package:gini/components/cart/balance/balance.dart';
import 'package:gini/components/cart/check_out_button.dart';
import 'package:gini/components/cart/empty_cart.dart';
import 'package:gini/components/cart/product_list.dart';
import 'package:gini/components/home/drawer.dart';
import 'package:gini/models/cart/final_cart_model.dart';
import 'package:gini/models/promotion/promotion.dart';

FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
FirebaseAuth _auth = FirebaseAuth.instance;

class CartPage extends StatelessWidget {
  CartPage({this.pageController});
  final PageController pageController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final Promotion promotion = Promotion();
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: CartAppBar(),
      drawer: pageController != null
          ? MainDrawer(pageController: pageController)
          : null,
      body: StreamBuilder<List<FinalCart>>(
        stream: CombineCart(
                firestore: _firebaseFirestore,
                cartStream: _firebaseFirestore
                    .collection("usersData")
                    .doc(_auth.currentUser.uid)
                    .collection("cart")
                    .orderBy("timeStamp")
                    .snapshots())
            .finalStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              if (snapshot.data.isNotEmpty && snapshot.data.length > 0) {
                return ListView(
                  children: [
                    CartProductList(finalCart: snapshot.data),
                    Container(
                        height: 1.0, color: Color.fromRGBO(226, 234, 241, 1)),
                    CartBalance(
                        finalCartList: snapshot.data, promotion: promotion),
                    SizedBox(height: 88.0),
                    CartCheckOutButton(
                        promotion: promotion, finalCartList: snapshot.data),
                    SizedBox(height: mediaQuery.padding.bottom + 50.0)
                  ],
                );
              } else {
                return CartEmptyCart(pageController: pageController);
              }
            } else {
              return CartEmptyCart(pageController: pageController);
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
