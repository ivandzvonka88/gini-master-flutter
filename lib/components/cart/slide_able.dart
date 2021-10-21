// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:gini/Models/cart/combine_product.dart';
// import 'package:gini/components/chat/widgets/text_composer.dart';
//
// class CartSlideAble extends StatelessWidget {
//   CartSlideAble(
//       {@required this.index,
//       @required this.scaffoldKey,
//       @required this.combinedList,
//       @required this.listKey});
//   final int index;
//   final GlobalKey<ScaffoldState> scaffoldKey;
//   final List<CombineProductCartModel> combinedList;
//   final GlobalKey<AnimatedListState> listKey;
//   @override
//   Widget build(BuildContext context) {
//     return Positioned.fill(
//       child: Slidable(
//         actionPane: SlidableDrawerActionPane(),
//         secondaryActions: <Widget>[
//           IconSlideAction(
//             caption: 'Delete',
//             color: Colors.red,
//             icon: Icons.delete,
//             onTap: () async {
//               try {
//                 await combinedList[index]
//                     .cartProductModel
//                     .cartDocReference
//                     .delete()
//                     .then((value) {
//                   listKey.currentState.removeItem(
//                       index,
//                       (context, animation) => SlideTransition(
//                             position: Tween<Offset>(
//                               begin: const Offset(-200, 0),
//                               end: Offset(0, 0),
//                             ).animate(CurvedAnimation(
//                                 parent: animation,
//                                 curve: Curves.bounceIn,
//                                 reverseCurve: Curves.bounceOut)),
//                           ));
//                 });
//               } on PlatformException catch (error) {
//                 scaffoldKey.currentState.removeCurrentSnackBar();
//                 scaffoldKey.currentState.showSnackBar(
//                   SnackBar(
//                     content: Text("${error.code}"),
//                   ),
//                 );
//               } catch (error) {
//                 print(error);
//               }
//
//               // setState(() {
//               //   docs.removeAt(index);
//               // });
//               // widget.scaffoldKey.currentState
//               //     .removeCurrentSnackBar();
//               // widget.scaffoldKey.currentState
//               //     .showSnackBar(SnackBar(
//               //       content: Text("Product removed from cart"),
//               //       action: SnackBarAction(
//               //         label: "Undo",
//               //         onPressed: () {
//               //           setState(() {
//               //             docs.insert(
//               //                 index, widget.combinedList[index]);
//               //           });
//               //         },
//               //       ),
//               //     ))
//               //     .closed
//               //     .then((SnackBarClosedReason reason) async {
//               //   if (reason != SnackBarClosedReason.action) {
//               //     try {
//               //       await widget.combinedList[index]
//               //           .cartProductModel.cartDocReference
//               //           .delete();
//               //     } on PlatformException catch (error) {
//               //       widget.scaffoldKey.currentState
//               //           .removeCurrentSnackBar();
//               //       widget.scaffoldKey.currentState.showSnackBar(
//               //         SnackBar(
//               //           content: Text("${error.code}"),
//               //         ),
//               //       );
//               //     } catch (error) {
//               //       print(error);
//               //     }
//               //   }
//               // });
//             },
//           ),
//         ],
//         child: Container(),
//         hitTestBehavior: HitTestBehavior.translucent,
//       ),
//     );
//   }
// }
