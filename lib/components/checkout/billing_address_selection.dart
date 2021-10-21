// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// class CheckoutBillingSelectionRow extends StatefulWidget {
//   @override
//   _CheckoutShippingMethodSelectionRowState createState() =>
//       _CheckoutShippingMethodSelectionRowState();
// }
//
// class _CheckoutShippingMethodSelectionRowState
//     extends State<CheckoutBillingSelectionRow> {
//   bool isSelected = false;
//
//   @override
//   Widget build(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context);
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 28.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             "Billing Address",
//             style: TextStyle(
//                 color: Color.fromRGBO(31, 30, 30, 1),
//                 fontSize: 14.0,
//                 fontWeight: FontWeight.w600,
//                 height: mediaQuery.textScaleFactor * 1.14),
//           ),
//           GestureDetector(
//             child: isSelected
//                 ? Row(
//                     children: [
//                       Text(
//                         "Unknown",
//                         style: TextStyle(
//                             color: Color.fromRGBO(83, 91, 98, 1),
//                             fontSize: 14.0,
//                             fontWeight: FontWeight.w600,
//                             height: mediaQuery.textScaleFactor * 1.14),
//                       ),
//                       SizedBox(width: 16.0),
//                       SvgPicture.asset("assets/checkout/arrow_forward.svg",
//                           height: 12.0)
//                     ],
//                   )
//                 : Row(
//                     children: [
//                       Text(
//                         "Select Address",
//                         style: TextStyle(
//                             color: Color.fromRGBO(125, 106, 244, 1),
//                             fontSize: 14.0,
//                             fontWeight: FontWeight.w600,
//                             height: mediaQuery.textScaleFactor * 1.14),
//                       ),
//                       SizedBox(width: 16.0),
//                       SvgPicture.asset("assets/checkout/arrow_forward.svg",
//                           color: Color.fromRGBO(125, 106, 244, 1), height: 12.0)
//                     ],
//                   ),
//             onTap: () {},
//           )
//         ],
//       ),
//     );
//   }
// }
