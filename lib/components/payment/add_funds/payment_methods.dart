// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:gini/pages/payment/add_funds.dart';
//
// class PaymentMethods extends StatefulWidget {
//   PaymentMethods(
//       {@required this.paymentMethods,
//       @required this.userData,
//       @required this.user,
//       @required this.callback});
//   final QuerySnapshot paymentMethods;
//   final DocumentSnapshot userData;
//   final User user;
//   final Function callback;
//   @override
//   _PaymentMethodsState createState() => _PaymentMethodsState();
// }
//
// class _PaymentMethodsState extends State<PaymentMethods> {
//   final _scaffoldKey = GlobalKey<ScaffoldState>();
//   var isChangingPaymentMethod = false;
//
//   @override
//   void initState() {
//     selectedMethod = selectedMethod ?? widget.userData.data()['selectedMethod'];
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       body: ListView(
//         children: [
//           AnimatedOpacity(
//             opacity: isChangingPaymentMethod ? 1 : 0,
//             duration: Duration(seconds: 0),
//             child: LinearProgressIndicator(),
//           ),
//           ListView(
//             shrinkWrap: true,
//             primary: false,
//             children: List.generate(widget.paymentMethods.docs.length, (index) {
//               return RadioListTile(
//                 secondary: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Image.asset(
//                       "assets/payment/${widget.paymentMethods.docs[index].data()['paymentMethod']['card']['brand']}.png",
//                       height: 40.0,
//                       width: 40.0,
//                     ),
//                   ],
//                 ),
//                 title: Text(
//                   widget.paymentMethods.docs[index].data()['paymentMethod']
//                       ['card']['brand'],
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
//                 ),
//                 subtitle: Text(
//                   "**** **** **** ${widget.paymentMethods.docs[index].data()['paymentMethod']['card']['last4']}",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
//                 ),
//                 onChanged: isChangingPaymentMethod
//                     ? null
//                     : (value) async {
//                         setState(() {
//                           isChangingPaymentMethod = true;
//                         });
//                         await FirebaseFirestore.instance
//                             .collection('users')
//                             .doc(widget.user.uid)
//                             .update({
//                           'selectedMethod': widget.paymentMethods.docs[index].id
//                         }).then((value) {
//                           setState(() {
//                             isChangingPaymentMethod = false;
//                             selectedMethod =
//                                 widget.paymentMethods.docs[index].id;
//                             widget.callback();
//                           });
//                           _scaffoldKey.currentState.removeCurrentSnackBar();
//                           _scaffoldKey.currentState.showSnackBar(
//                             SnackBar(
//                               content: Text(
//                                 "Payment method changed",
//                               ),
//                             ),
//                           );
//                         }).catchError((error) {
//                           if (mounted) {
//                             setState(() {
//                               isChangingPaymentMethod = false;
//                             });
//
//                             _scaffoldKey.currentState.removeCurrentSnackBar();
//                             _scaffoldKey.currentState.showSnackBar(
//                               SnackBar(
//                                 content: Text(
//                                   error.code.toString(),
//                                 ),
//                               ),
//                             );
//                           }
//                         });
//                       },
//                 groupValue: (selectedMethod == null)
//                     ? null
//                     : (widget.paymentMethods.docs[index].id == selectedMethod)
//                         ? index
//                         : null,
//                 value: index,
//               );
//             }),
//           ),
//         ],
//       ),
//     );
//   }
// }
