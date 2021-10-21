// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:stripe_payment/stripe_payment.dart';
//
// Widget addPaymentMethodWidgets(
//     {@required User user,
//     @required GlobalKey<ScaffoldState> globalKey,
//     BuildContext sheetContext}) {
//   return Wrap(
//     children: [
//       Card(
//         elevation: 0.5,
//         margin: EdgeInsets.all(0.2),
//         child: ListTile(
//           title: Text(
//             "Add Payment Method",
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
//           ),
//         ),
//       ),
//       Card(
//         margin: EdgeInsets.all(0.2),
//         elevation: 0.5,
//         child: ListTile(
//           leading: CircleAvatar(
//               backgroundColor: Colors.blue[100],
//               child: Icon(
//                 Icons.payment,
//                 color: Colors.blue,
//               )),
//           title: Text(
//             "Credit/Debit Card",
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           subtitle: Text("Add credit or debit card here"),
//           trailing: Icon(Icons.arrow_forward_ios),
//           onTap: () {
//             if (sheetContext != null) {
//               Navigator.pop(sheetContext);
//             }
//             startAddingPaymentMethodProcess(globalKey, user);
//           },
//         ),
//       ),
//       Card(
//         elevation: 0.5,
//         margin: EdgeInsets.all(0.2),
//         child: ListTile(
//           leading: CircleAvatar(
//             backgroundColor: Colors.lightGreen[100],
//             child: Icon(
//               Icons.account_balance,
//               color: Colors.lightGreen,
//             ),
//           ),
//           title: Text(
//             "Bank",
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//           subtitle: Text("Add bank account here [Coming soon]"),
//           trailing: Icon(Icons.arrow_forward_ios),
//           onTap: () async {
// //              if (sheetContext != null) {
// //                Navigator.pop(sheetContext);
// //              }
//           },
//         ),
//       ),
//     ],
//   );
// }
//
// void startAddingPaymentMethodProcess(
//     GlobalKey<ScaffoldState> _scaffoldKey, User user) async {
//   await StripePayment.paymentRequestWithCardForm(CardFormPaymentRequest())
//       .then((paymentMethod) async {
//     print(paymentMethod);
//     addPaymentCardToFirestore(paymentMethod, _scaffoldKey, user);
//   }).catchError((onError) {
//     _scaffoldKey.currentState.removeCurrentSnackBar();
//     _scaffoldKey.currentState.showSnackBar(
//       SnackBar(
//         content: Text(
//           onError.code.toString(),
//         ),
//       ),
//     );
//   });
// }
//
// void addPaymentCardToFirestore(PaymentMethod paymentMethod,
//     GlobalKey<ScaffoldState> _scaffoldKey, User user) async {
//   await FirebaseFirestore.instance
//       .collection('users')
//       .doc(user.uid)
//       .collection('paymentMethods')
//       .add({'paymentMethod': paymentMethod.toJson()}).then((value) {
//     _scaffoldKey.currentState.removeCurrentSnackBar();
//     _scaffoldKey.currentState.showSnackBar(
//       SnackBar(
//         content: Text("New payment method added"),
//       ),
//     );
//   }).catchError((error) {
//     _scaffoldKey.currentState.removeCurrentSnackBar();
//     _scaffoldKey.currentState.showSnackBar(
//       SnackBar(
//         content: Text(
//           error.code.toString(),
//         ),
//       ),
//     );
//   });
// }
