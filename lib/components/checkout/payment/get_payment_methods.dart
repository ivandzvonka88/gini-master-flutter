import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gini/components/checkout/payment/payment_methods.dart';
import 'package:gini/models/checkout/checkout.dart';
import 'package:gini/models/checkout/payment.dart';
import 'package:rxdart/rxdart.dart';

FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
FirebaseAuth _auth = FirebaseAuth.instance;

class CheckoutGetPaymentMethods extends StatelessWidget {
  CheckoutGetPaymentMethods({@required this.checkoutModel});
  final CheckoutModel checkoutModel;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FinalCheckoutPaymentMethods>(
      stream: Rx.combineLatest2(
          _firebaseFirestore
              .collection("usersData")
              .doc(_auth.currentUser.uid)
              .collection("paymentMethods")
              .snapshots(),
          _firebaseFirestore
              .collection("usersData")
              .doc(_auth.currentUser.uid)
              .collection("wallet")
              .doc("wallet")
              .snapshots(),
          (paymentMethods, wallet) => (FinalCheckoutPaymentMethods(
              paymentMethodSnapshot: paymentMethods, walletSnapshot: wallet))),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return CheckoutPaymentMethods(
              checkoutModel: checkoutModel,
              finalCheckoutPaymentMethods: snapshot.data);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
