// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:gini/Models/cart/combine_product.dart';
// import 'package:gini/blocs/cart/cubit/TotalPriceCubit.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class CartProductItem extends StatefulWidget {
//   CartProductItem({@required this.combinedModel});
//   final CombineProductCartModel combinedModel;
//
//   @override
//   _CartProductItemState createState() => _CartProductItemState();
// }
//
// class _CartProductItemState extends State<CartProductItem> {
//   int currentSizeIndex = 0;
//   int currentColorIndex = 0;
//   int currentQuantityIndex = 0;
//   double price;
//
//   @override
//   void initState() {
//     currentQuantityIndex =
//         widget.combinedModel.cartProductModel.preferredQuantity - 1;
//     currentColorIndex = widget.combinedModel.cartProductModel.preferredColor;
//     currentSizeIndex = widget.combinedModel.cartProductModel.preferredSize;
//     try {
//       price = double.parse(
//           widget.combinedModel.productDetailsModel.price.toString());
//       context.bloc<TotalPriceCubit>().increment(price);
//     } catch (error) {
//       print(error);
//     }
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context);
//     final size = mediaQuery.size;
//     final isPortrait = mediaQuery.orientation == Orientation.portrait;
//
//     return SizedBox(
//       height: isPortrait ? size.height * 0.1822 : size.width * 0.1822,
//       child: Row(
//         children: [
//           size.aspectRatio > 1.4
//               ? Spacer(
//                   flex: 10,
//                 )
//               : Container(
//                   width: size.width * 0.0426,
//                 ),
//           Container(
//             width: size.width * 0.2133,
//             height: isPortrait ? size.height * 0.1231 : size.width * 0.1231,
//             decoration: BoxDecoration(
//                 color: Color(0xFFF3F3F1),
//                 borderRadius: BorderRadius.circular(6.0)),
//             child: CachedNetworkImage(
//                 imageUrl: widget
//                     .combinedModel.productDetailsModel.imagesModel.images[0]),
//           ),
//           Container(
//             width: size.width * 0.04266,
//           ),
//           Expanded(
//             flex: 100,
//             child: Column(
//               children: [
//                 Spacer(
//                   flex: 3,
//                 ),
//                 Expanded(
//                   flex:
//                       size.aspectRatio > 0.70 && size.aspectRatio < 1.0 ? 6 : 4,
//                   child: Row(
//                     children: [
//                       Expanded(
//                         flex: 100,
//                         child: Align(
//                           child: Text(
//                             "${widget.combinedModel.productDetailsModel.title}",
//                             style: TextStyle(
//                                 color: Color(0xFF424A52),
//                                 fontSize: isPortrait
//                                     ? size.width * 0.0426
//                                     : size.height * 0.0426,
//                                 height: 1.21,
//                                 fontWeight: FontWeight.w500),
//                           ),
//                           alignment: Alignment.centerLeft,
//                         ),
//                       ),
//                       Expanded(
//                         flex: 37,
//                         child: Align(
//                           alignment: Alignment.centerRight,
//                           child: Text(
//                             "\$${price.toStringAsFixed(2)}",
//                             style: TextStyle(
//                                 color: Color(0xFF424A52),
//                                 fontSize: isPortrait
//                                     ? size.width * 0.0426
//                                     : size.height * 0.0426,
//                                 height: 1.21,
//                                 fontWeight: FontWeight.w600),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Spacer(),
//                 Expanded(
//                   flex: 3,
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: Align(
//                           child: DropdownButton(
//                               underline: SizedBox.shrink(),
//                               value: currentColorIndex,
//                               items: widget.combinedModel.productDetailsModel
//                                       .colorsModel.colors.isNotEmpty
//                                   ? List.generate(
//                                       widget.combinedModel.productDetailsModel
//                                           .colorsModel.colors.length, (index) {
//                                       return DropdownMenuItem(
//                                         child: Text(
//                                             "${widget.combinedModel.productDetailsModel.colorsModel.colors[index]}",
//                                             style: TextStyle(
//                                                 height: 1.21,
//                                                 color: Color(0xFF424A52),
//                                                 fontWeight: FontWeight.w600,
//                                                 fontSize: isPortrait
//                                                     ? size.width * 0.0373
//                                                     : size.height * 0.0373)),
//                                         value: index,
//                                       );
//                                     })
//                                   : [],
//                               onChanged: (value) {
//                                 setState(() {
//                                   currentColorIndex = value;
//                                 });
//                               }),
//                           alignment: Alignment.centerLeft,
//                         ),
//                       ),
//                       Expanded(
//                         child: Align(
//                           alignment: Alignment.center,
//                           child: DropdownButton(
//                               underline: SizedBox.shrink(),
//                               value: currentSizeIndex,
//                               items: widget.combinedModel.productDetailsModel
//                                       .sizesModel.sizes.isNotEmpty
//                                   ? List.generate(
//                                       widget.combinedModel.productDetailsModel
//                                           .sizesModel.sizes.length, (index) {
//                                       return DropdownMenuItem(
//                                         child: Text(
//                                             "${widget.combinedModel.productDetailsModel.sizesModel.sizes[index]}",
//                                             style: TextStyle(
//                                                 height: 1.21,
//                                                 color: Color(0xFF424A52),
//                                                 fontWeight: FontWeight.w600,
//                                                 fontSize: isPortrait
//                                                     ? size.width * 0.0373
//                                                     : size.height * 0.0373)),
//                                         value: index,
//                                       );
//                                     })
//                                   : [],
//                               onChanged: (value) {
//                                 setState(() {
//                                   currentSizeIndex = value;
//                                 });
//                               }),
//                         ),
//                       ),
//                       Expanded(
//                         child: Align(
//                           alignment: Alignment.centerRight,
//                           child: DropdownButton(
//                               underline: SizedBox.shrink(),
//                               value: currentQuantityIndex,
//                               items: List.generate(
//                                   widget.combinedModel.cartProductModel
//                                       .preferredQuantity, (index) {
//                                 return DropdownMenuItem(
//                                   child: Text("${index + 1}",
//                                       style: TextStyle(
//                                           height: 1.21,
//                                           color: Color(0xFF424A52),
//                                           fontWeight: FontWeight.w600,
//                                           fontSize: isPortrait
//                                               ? size.width * 0.0373
//                                               : size.height * 0.0373)),
//                                   value: index,
//                                 );
//                               }),
//                               onChanged: (value) {
//                                 setState(() {
//                                   currentQuantityIndex = value;
//                                 });
//                               }),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Spacer(
//                   flex: 3,
//                 ),
//               ],
//             ),
//           ),
//           size.aspectRatio > 1.4
//               ? Spacer(
//                   flex: 90,
//                 )
//               : Container(
//                   width: size.width * 0.0426,
//                 ),
//         ],
//       ),
//     );
//   }
// }
