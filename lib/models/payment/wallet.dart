import 'package:cloud_firestore/cloud_firestore.dart';

class Wallet {
  double amount;
  DocumentReference documentReference;
  String customerId;

  Wallet({this.amount, this.documentReference, this.customerId});

  Wallet.fromJson(Map<String, dynamic> json) {
    amount = json['amount'] != null ? json['amount'].toDouble() : 0.00;
    documentReference = json['documentReference'];
    customerId = json['customerId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['documentReference'] = this.documentReference;
    data['customerId'] = this.customerId;
    return data;
  }
}
