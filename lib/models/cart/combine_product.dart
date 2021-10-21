// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:gini/Models/cart/cart_product.dart';
// import 'package:gini/Models/product/product_details.dart';
// import 'package:flutter/material.dart';
// import 'package:rxdart/rxdart.dart';
//
// class CombineProductCartModel {
//   CombineProductCartModel(
//       {@required this.productDetailsModel, @required this.cartProductModel});
//   final ProductDetailsModel productDetailsModel;
//   final CartProductModel cartProductModel;
// }
//
// class CombineCartProductListViewModel {
//   CombineCartProductListViewModel(
//       {@required this.productStream, @required this.cartStream});
//   final FirebaseFirestore productStream;
//   final Stream<QuerySnapshot> cartStream;
//
//   Stream<List<CombineProductCartModel>> combineCartProductStream() {
//     return cartStream.map((convert) {
//       return convert.docs.map((cartProduct) {
//         Stream<CartProductModel> _cartProductStream = Stream.value(cartProduct)
//             .map<CartProductModel>((document) => CartProductModel.fromJson(
//                 cartProduct.data(), cartProduct.reference));
//
//         Stream<ProductDetailsModel> _productStream = productStream
//             .doc(cartProduct.data()['documentReference'])
//             .snapshots()
//             .map<ProductDetailsModel>(
//                 (document) => ProductDetailsModel.fromJson(document.data()));
//
//         return Rx.combineLatest2(
//             _cartProductStream,
//             _productStream,
//             (cartModel, productModel) => CombineProductCartModel(
//                 productDetailsModel: productModel,
//                 cartProductModel: cartModel));
//       });
//     }).switchMap((observables) {
//       return observables.length > 0
//           ? Rx.combineLatestList(observables)
//           : Stream.value([]);
//     });
//   }
// }
//
// // class CombineCartProductListViewModel {
// //   CombineCartProductListViewModel(
// //       {@required this.productStream, @required this.cartStream});
// //   final Stream<QuerySnapshot> productStream;
// //   final Stream<QuerySnapshot> cartStream;
// //
// //   Stream<List<CombineProductCartModel>> combineCartProductStream() {
// //     return Rx.combineLatest2(
// //         productStream.map((event) => List.generate(event.docs.length,
// //             (index) => ProductDetailsModel.fromJson(event.docs[index].data()))),
// //         cartStream.map((event) => List.generate(event.docs.length,
// //             (index) => CartProductModel.fromJson(event.docs[index].data()))),
// //         (List<ProductDetailsModel> products,
// //             List<CartProductModel> cartProducts) {
// //       return List.generate(cartProducts.length, (index) {
// //         return CombineProductCartModel(
// //             productDetailsModel: products[index],
// //             cartProductModel: cartProducts[index]);
// //       });
// //     });
// //   }
// // }
