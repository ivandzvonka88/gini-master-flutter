import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gini/components/checkout/shipping/shipping_addresses.dart';
import 'package:gini/models/checkout/checkout.dart';

FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
FirebaseAuth _auth = FirebaseAuth.instance;

class CheckoutGetShippingAddresses extends StatelessWidget {
  CheckoutGetShippingAddresses({@required this.checkoutModel});
  final CheckoutModel checkoutModel;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firebaseFirestore
            .collection("usersData")
            .doc(_auth.currentUser.uid)
            .collection("shippingAddresses")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return Center(
                child: CheckoutShippingAddresses(
                    checkoutModel: checkoutModel, docs: snapshot.data.docs),
              );
            } else {
              return Center(
                child: Text("Try again later"),
              );
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
