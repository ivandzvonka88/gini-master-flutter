// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:gini/app/config/constants.dart';
// import 'package:gini/components/payment/dashboard/add_payment_sheet_widgets.dart';
// import 'package:gini/components/payment/dashboard/remove_payment_method.dart';
// import 'package:gini/pages/payment/add_funds.dart';
//
// Widget paymentDashboard(
//     {@required User user,
//     @required double height,
//     @required AsyncSnapshot<DocumentSnapshot> userSnapshot,
//     @required GlobalKey<ScaffoldState> scaffoldKey}) {
//   return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance
//           .collection('users')
//           .doc(user.uid)
//           .collection('paymentMethods')
//           .snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.active) {
//           if (snapshot.hasError) {
//             var error = snapshot.error as PlatformException;
//             return Center(
//               child: Text(error.code.toString()),
//             );
//           }
//           bool hasDocuments = snapshot.data.docs.length > 0;
//           var balance;
//           try {
//             balance = userSnapshot.data.data()['balance'].toStringAsFixed(2);
//           } catch (error) {
//             balance = 0.00.toStringAsFixed(2);
//           }
//           return ListView(
//             children: <Widget>[
//               Container(
//                 height: height / 5,
//               ),
//               Align(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(55.0),
//                           gradient: linearGradient,
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Icon(
//                             Icons.account_balance,
//                             color: Colors.white,
//                           ),
//                         )),
//                     Container(
//                       width: 12.0,
//                     ),
//                     Text(
//                       '\$$balance' ?? "error",
//                       style: TextStyle(
//                           fontSize: 32.0, fontWeight: FontWeight.w600),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 height: height / 8,
//               ),
//               Align(
//                 child: GestureDetector(
//                   child: Container(
//                     height: 65,
//                     width: height / 1.7,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(55.0),
//                       gradient: linearGradient,
//                     ),
//                     child: Center(
//                       child: Text(
//                         "Add Money",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 24.0,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
//                   ),
//                   onTap: () {
//                     if (snapshot.data.docs.length < 1) {
//                       scaffoldKey.currentState.removeCurrentSnackBar();
//                       scaffoldKey.currentState.showSnackBar(
//                         SnackBar(
//                           content: Text(
//                             "Please add payment method first",
//                           ),
//                         ),
//                       );
//                     } else {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => AddFundsPage(
//                                   user: user,
//                                   currentBalance: userSnapshot.data
//                                       .data()['balance']
//                                       .toDouble(),
//                                   paymentMethods: snapshot.data,
//                                   userData: userSnapshot.data,
//                                 ),
//                             fullscreenDialog: true),
//                       );
//                     }
//                   },
//                 ),
//               ),
//               Container(
//                 height: height / 4,
//               ),
//               hasDocuments
//                   ? ListView(
//                       primary: false,
//                       shrinkWrap: true,
//                       children: [
//                         Card(
//                           elevation: 0.5,
//                           margin: EdgeInsets.all(0.2),
//                           child: ListTile(
//                             title: Text(
//                               "Payment Method",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold, fontSize: 18.0),
//                             ),
//                             trailing: IconButton(
//                               icon: Icon(Icons.add_circle_outline),
//                               onPressed: () async {
//                                 await showModalBottomSheet(
//                                     context: context,
//                                     builder: (context) {
//                                       return addPaymentMethodWidgets(
//                                           sheetContext: context,
//                                           globalKey: scaffoldKey,
//                                           user: user);
//                                     });
//                               },
//                             ),
//                           ),
//                         ),
//                         ListView(
//                           primary: false,
//                           shrinkWrap: true,
//                           children: snapshot.data.docs.map((element) {
//                             return Card(
//                               elevation: 0.5,
//                               margin: EdgeInsets.all(0.2),
//                               child: ListTile(
//                                 leading: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Image.asset(
//                                       "assets/payment/${element.data()['paymentMethod']['card']['brand']}.png",
//                                       height: 40.0,
//                                       width: 40.0,
//                                     ),
//                                   ],
//                                 ),
//                                 trailing: IconButton(
//                                     icon: Icon(Icons.remove_circle_outline),
//                                     onPressed: () {
//                                       showDialog(
//                                           context: context,
//                                           builder: (context) => AlertDialog(
//                                                 title: Text("Warning"),
//                                                 content: Text(
//                                                     "Are you sure to permanently remove this method?"),
//                                                 actions: [
//                                                   FlatButton(
//                                                     onPressed: () {
//                                                       removePaymentMethodToFirestore(
//                                                         methodDocumentId:
//                                                             element.id,
//                                                         uid: user.uid,
//                                                         scaffoldKey:
//                                                             scaffoldKey,
//                                                       );
//                                                       Navigator.of(context)
//                                                           .pop();
//                                                     },
//                                                     child: Text("Yes"),
//                                                   ),
//                                                   FlatButton(
//                                                     onPressed: () {
//                                                       Navigator.of(context)
//                                                           .pop();
//                                                     },
//                                                     child: Text("Cancel"),
//                                                   ),
//                                                 ],
//                                               ));
//                                     }),
//                                 title: Text(
//                                   element.data()['paymentMethod']['card']
//                                       ['brand'],
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 18.0),
//                                 ),
//                                 subtitle: Text(
//                                   "**** **** **** ${element.data()['paymentMethod']['card']['last4']}",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 18.0),
//                                 ),
//                               ),
//                             );
//                           }).toList(),
//                         )
//                       ],
//                     )
//                   : addPaymentMethodWidgets(globalKey: scaffoldKey, user: user),
//             ],
//           );
//         } else {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//       });
// }
