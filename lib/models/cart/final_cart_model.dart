import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gini/models/cart/cart.dart';
import 'package:gini/models/product/product.dart';
import 'package:rxdart/rxdart.dart';

class FinalCart {
  FinalCart({@required this.cartProduct, @required this.product});
  final Product product;
  final CartProduct cartProduct;
}

class CombineCart {
  CombineCart({@required this.firestore, @required this.cartStream});
  final FirebaseFirestore firestore;
  final Stream<QuerySnapshot> cartStream;

  Stream<List<FinalCart>> finalStream() {
    return cartStream.map((element) {
      return element.docs.map((e) {
        CartProduct cartProduct = CartProduct.fromJson(e.data(),e.reference);
        Stream<CartProduct> _cartStream =
            Stream.value(cartProduct).map<CartProduct>((document) => cartProduct);

        Stream<Product> _productStream = firestore
            .doc(cartProduct.productReference)
            .snapshots()
            .map<Product>((document) =>
                Product.fromJson(document.data(), cartProduct.productReference));

        return Rx.combineLatest2(_cartStream, _productStream,
            (cart, product) => FinalCart(cartProduct: cart, product: product));
      });
    }).switchMap((observables) {
      return observables.length > 0
          ? Rx.combineLatestList(observables)
          : Stream.value([]);
    });
  }
}
