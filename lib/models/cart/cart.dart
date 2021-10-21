import 'package:cloud_firestore/cloud_firestore.dart';

class CartProduct {
  String preferredSize;
  String productReference;
  PreferredColor preferredColor;
  int preferredQuantity;
  DocumentReference documentReference;

  CartProduct(
      {this.preferredSize,
      this.productReference,
      this.preferredColor,
      this.preferredQuantity});

  CartProduct.fromJson(Map<String, dynamic> json,
      [DocumentReference reference]) {
    preferredSize = json['preferredSize:'];
    productReference = json['productReference'];
    preferredColor = json['preferredColor'] != null
        ? PreferredColor.fromJson(json['preferredColor'])
        : null;
    preferredQuantity = json['preferredQuantity'];
    documentReference = reference;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['preferredSize:'] = this.preferredSize;
    data['productReference'] = this.productReference;
    if (this.preferredColor != null) {
      data['preferredColor'] = this.preferredColor.toJson();
    }
    data['preferredQuantity'] = this.preferredQuantity;
    return data;
  }
}

class PreferredColor {
  String color;
  String image;

  PreferredColor({this.color, this.image});

  PreferredColor.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['color'] = this.color;
    data['image'] = this.image;
    return data;
  }
}
