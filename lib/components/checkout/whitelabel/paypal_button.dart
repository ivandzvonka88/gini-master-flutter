// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// class PayPalButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 56.0,
//       decoration: BoxDecoration(
//           color: Color.fromRGBO(0, 48, 135, 1),
//           borderRadius: BorderRadius.circular(6.0)),
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           borderRadius: BorderRadius.circular(6.0),
//           onTap: () {
//             print("yo");
//           },
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(
//                 width: 20.0,
//               ),
//               SvgPicture.asset(
//                 "assets/ui/paypal.svg",
//                 height: 20.0,
//               ),
//               SizedBox(
//                 width: 20.0,
//               ),
//               Text(
//                 "Pay with PayPal",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.w600,
//                     fontSize: 16.0),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
