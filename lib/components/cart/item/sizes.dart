// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:gini/models/cart/cart.dart';
//
// class CartProductItemSizes extends StatefulWidget {
//   CartProductItemSizes({@required this.sizes, @required this.cartProduct});
//   final List<String> sizes;
//   final CartProduct cartProduct;
//   @override
//   _ProductSizesState createState() => _ProductSizesState();
// }
//
// class _ProductSizesState extends State<CartProductItemSizes> {
//   @override
//   Widget build(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context);
//     return DropdownButton(
//         icon: SvgPicture.asset("assets/ui/arrow_down.svg",
//             semanticsLabel: "More Colors",
//             color: Color.fromRGBO(31, 30, 30, 1),
//             width: 8.0),
//         underline: SizedBox.shrink(),
//         value: widget.cartProduct.preferredSize,
//         items: widget.sizes != null && widget.sizes.isNotEmpty
//             ? List.generate(widget.sizes.length, (index) {
//                 return DropdownMenuItem(
//                     child: Text(widget.sizes[index],
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
//             widget.cartProduct.preferredSize = value;
//           });
//         });
//   }
// }
