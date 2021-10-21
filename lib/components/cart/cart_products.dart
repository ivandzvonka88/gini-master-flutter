// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:gini/Models/cart/combine_product.dart';
// import 'package:gini/app/config/constants.dart';
// import 'package:gini/blocs/cart/cubit/TotalPriceCubit.dart';
// import 'package:gini/components/auth/promo_code.dart';
// import 'package:gini/components/cart/product_item.dart';
// import 'package:gini/components/cart/slide_able.dart';
// import 'package:gini/pages/shipping/selection/selection.dart';
//
// class ProductListView extends StatelessWidget {
//   ProductListView({@required this.scaffoldKey, @required this.combinedList});
//
//   final GlobalKey<ScaffoldState> scaffoldKey;
//   final List<CombineProductCartModel> combinedList;
//   final listKey = GlobalKey<AnimatedListState>();
//
//   @override
//   Widget build(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context);
//     final size = mediaQuery.size;
//     final isPortrait = mediaQuery.orientation == Orientation.portrait;
//     context.bloc<TotalPriceCubit>().reset(0.00);
//     return ListView(
//       children: [
//         Divider(
//           height: 1,
//           color: Color(0xFFE2EAF1),
//         ),
//         AnimatedList(
//             key: listKey,
//             shrinkWrap: true,
//             primary: false,
//             itemBuilder: (context, index, animation) {
//               return SlideTransition(
//                 key: UniqueKey(),
//                 position: Tween<Offset>(
//                   begin: const Offset(-200, 0),
//                   end: Offset(0, 0),
//                 ).animate(CurvedAnimation(
//                     parent: animation,
//                     curve: Curves.bounceIn,
//                     reverseCurve: Curves.bounceOut)),
//                 child: Stack(
//                   children: [
//                     CartProductItem(
//                       combinedModel: combinedList[index], //here
//                     ),
//                     CartSlideAble(
//                       index: index,
//                       scaffoldKey: scaffoldKey,
//                       combinedList: combinedList,
//                       listKey: listKey,
//                     )
//                   ],
//                 ),
//               );
//             },
//             // separatorBuilder: (_, index) {
//             //   return Align(
//             //     child: Container(
//             //       width: size.width * 0.9146,
//             //       child: Divider(
//             //         color: Color(0xFFE2EAF1),
//             //         height: 1,
//             //       ),
//             //     ),
//             //   );
//             // },
//             initialItemCount: combinedList.length), //here
//         Divider(
//           height: 1,
//           color: Color(0xFFE2EAF1),
//         ),
//         Align(
//           child: Container(
//             width: isPortrait ? size.width : size.width / 1.1,
//             child: ListTile(
//               dense: true,
//               title: Text(
//                 "Promo code",
//                 style: TextStyle(
//                     color: Color(0xFF808B95),
//                     fontSize:
//                         isPortrait ? size.width * 0.0426 : size.height * 0.0426,
//                     fontWeight: FontWeight.w500,
//                     height: 1.21),
//               ),
//               trailing: SvgPicture.asset(
//                 "assets/ui/arrow_down.svg",
//                 semanticsLabel: "Promo code",
//                 color: Color(0xFF1F1E1E),
//                 height: isPortrait ? size.height * 0.0085 : size.width * 0.0085,
//               ),
//               onTap: () async {
//                 showModalBottomSheet(
//                   context: context,
//                   clipBehavior: Clip.antiAliasWithSaveLayer,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.vertical(
//                       top: Radius.circular(10.0),
//                     ),
//                   ),
//                   builder: (sheetContext) => PromoCode(),
//                 );
//               },
//             ),
//           ),
//         ),
//         Divider(
//           height: 1,
//           color: Color(0xFFE2EAF1),
//         ),
//         Align(
//           child: BlocBuilder<TotalPriceCubit, double>(builder: (_, totalPrice) {
//             return Container(
//               width: isPortrait ? size.width : size.width / 1.1,
//               child: ListTile(
//                 title: (Text(
//                   "Total",
//                   style: TextStyle(
//                       color: Color(0xFF808B95),
//                       fontSize:
//                           isPortrait ? size.width * 0.048 : size.height * 0.048,
//                       fontWeight: FontWeight.w500,
//                       height: 1.21),
//                 )),
//                 trailing: Text("\$$totalPrice",
//                     style: TextStyle(
//                         color: Color(0xFF424A52),
//                         fontSize: 18.0,
//                         fontWeight: FontWeight.w600,
//                         height: 1.21)),
//               ),
//             );
//           }),
//         ),
//         SizedBox(height: size.height * 0.1674),
//         Align(
//           child: Container(
//             width: isPortrait ? size.width * 0.6533 : size.height * 0.6533,
//             height: isPortrait ? size.height * 0.0788 : size.width * 0.0788,
//             margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//             decoration: BoxDecoration(
//                 gradient: linearGradient,
//                 borderRadius: BorderRadius.circular(50.0)),
//             child: Material(
//               color: Colors.transparent,
//               child: InkWell(
//                 borderRadius: BorderRadius.circular(50.0),
//                 child: Center(
//                   child: Text(
//                     "Checkout",
//                     style: TextStyle(
//                         fontSize: isPortrait
//                             ? size.width * 0.048
//                             : size.height * 0.048,
//                         height: 1.16,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 onTap: () {
//                   if (combinedList.isNotEmpty) {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => ShippingSelectionPage(
//                           combinedList: combinedList,
//                         ),
//                       ),
//                     );
//                   }
//                 },
//               ),
//             ),
//           ),
//         ),
//         SizedBox(
//           height: size.height * 0.0674,
//         ),
//       ],
//     );
//   }
// }
