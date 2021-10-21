import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FinalCheckoutPaymentMethods {
  FinalCheckoutPaymentMethods(
      {@required this.paymentMethodSnapshot, @required this.walletSnapshot});
  final QuerySnapshot paymentMethodSnapshot;
  final DocumentSnapshot walletSnapshot;
}
