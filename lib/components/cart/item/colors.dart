// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:gini/models/cart/cart.dart';
// import 'package:gini/models/product/product.dart';
//
// class CartProductItemColors extends StatefulWidget {
//   CartProductItemColors({@required this.colors, @required this.cartProduct});
//   final List<ProductColors> colors;
//   final CartProduct cartProduct;
//   @override
//   _ProductSizesState createState() => _ProductSizesState();
// }
//
// class _ProductSizesState extends State<CartProductItemColors> {
//   @override
//   Widget build(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context);
//     return DropdownButton(
//         icon: Center(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SvgPicture.asset("assets/ui/arrow_down.svg",
//                   semanticsLabel: "More Colors",
//                   color: Color.fromRGBO(31, 30, 30, 1),
//                   width: 8.0),
//             ],
//           ),
//         ),
//         underline: SizedBox.shrink(),
//         value: widget.cartProduct.preferredColor,
//         items: widget.colors != null && widget.colors.isNotEmpty
//             ? List.generate(widget.colors.length, (index) {
//                 return DropdownMenuItem(
//                     child: Text(widget.colors[index].color,
//                         style: TextStyle(
//                             color: Color.fromRGBO(66, 74, 82, 1),
//                             fontSize: 14.0,
//                             height: mediaQuery.textScaleFactor * 1.50,
//                             fontWeight: FontWeight.w600)),
//                     value: index);
//               })
//             : [],
//         onChanged: (value) {
//           setState(() {
//             widget.cartProduct.preferredColor = value;
//           });
//         });
//   }
// }
