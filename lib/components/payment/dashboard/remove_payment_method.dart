// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// void removePaymentMethodToFirestore(
//     {@required String methodDocumentId,
//     @required GlobalKey<ScaffoldState> scaffoldKey,
//     @required String uid}) async {
//   await FirebaseFirestore.instance
//       .collection('users')
//       .doc(uid)
//       .collection('paymentMethods')
//       .doc(methodDocumentId)
//       .delete()
//       .then((value) {
//     scaffoldKey.currentState.removeCurrentSnackBar();
//     scaffoldKey.currentState.showSnackBar(
//       SnackBar(
//         content: Text("Payment method removed"),
//       ),
//     );
//   }).catchError((error) {
//     scaffoldKey.currentState.removeCurrentSnackBar();
//     scaffoldKey.currentState.showSnackBar(
//       SnackBar(
//         content: Text(
//           error.code.toString(),
//         ),
//       ),
//     );
//   });
// }
