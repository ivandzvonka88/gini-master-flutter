// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class CartProductModel {
//   int preferredSize;
//   String documentReference;
//   int preferredColor;
//   int preferredQuantity;
//   DocumentReference cartDocReference;
//
//   CartProductModel(
//       {this.preferredSize,
//       this.documentReference,
//       this.preferredColor,
//       this.cartDocReference});
//
//   CartProductModel.fromJson(
//       Map<String, dynamic> json, DocumentReference cartDocReference) {
//     preferredSize = json['preferredSize'];
//     documentReference = json['documentReference'];
//     preferredColor = json['preferredColor'];
//     preferredQuantity = json['preferredQuantity'];
//     this.cartDocReference = cartDocReference;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['preferredSize'] = this.preferredSize;
//     data['documentReference'] = this.documentReference;
//     data['preferredColor'] = this.preferredColor;
//     data['preferredQuantity'] = this.preferredQuantity;
//     return data;
//   }
// }
