// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gini/Models/cart/combine_product.dart';
// import 'package:gini/blocs/cart/cubit/TotalPriceCubit.dart';
// import 'package:gini/components/cart/cart.dart';
//
// FirebaseAuth _auth = FirebaseAuth.instance;
// FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
//
// class ShoppingCartPage extends StatefulWidget {
//   ShoppingCartPage({@required this.scaffoldKey});
//   final GlobalKey<ScaffoldState> scaffoldKey;
//   @override
//   _ShoppingCartPageState createState() => _ShoppingCartPageState();
// }
//
// class _ShoppingCartPageState extends State<ShoppingCartPage>
//     with AutomaticKeepAliveClientMixin {
//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     return StreamBuilder<List<CombineProductCartModel>>(
//       stream: CombineCartProductListViewModel(
//         productStream: _firebaseFirestore,
//         cartStream: _firebaseFirestore
//             .collection("users")
//             .doc(_auth.currentUser.uid)
//             .collection("cart")
//             .snapshots(),
//       ).combineCartProductStream(),
//       builder: (_, snapshot) {
//         if (snapshot.connectionState == ConnectionState.active) {
//           if (snapshot.hasData && snapshot.data.isNotEmpty) {
//             return BlocProvider(
//               create: (_) => TotalPriceCubit(),
//               child: ProductListView(
//                 scaffoldKey: widget.scaffoldKey,
//                 combinedList: snapshot.data,
//               ),
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text("${snapshot.error}"),
//             );
//           } else {
//             return Center(
//               child: Text("Empty cart"),
//             );
//           }
//         } else {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//       },
//     );
//   }
//
//   @override
//   bool get wantKeepAlive => true;
// }
