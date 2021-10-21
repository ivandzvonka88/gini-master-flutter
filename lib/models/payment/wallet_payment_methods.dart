import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class WalletAndPaymentMethods {
  final QuerySnapshot paymentMethodSnapshot;
  final DocumentSnapshot walletSnapshot;
  String totalPrice;
  QueryDocumentSnapshot documentSnapshot;

  WalletAndPaymentMethods(
      {@required this.paymentMethodSnapshot,
      @required this.walletSnapshot,
      this.totalPrice,
      this.documentSnapshot});
}
