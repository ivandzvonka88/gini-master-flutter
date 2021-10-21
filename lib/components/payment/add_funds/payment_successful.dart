// import 'package:flutter/material.dart';
// import 'package:gini/app/config/constants.dart';
//
// class PaymentSuccessfulPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var mediaQuery = MediaQuery.of(context);
//     var height = mediaQuery.size.height;
//     var width = mediaQuery.size.width;
//     if (mediaQuery.orientation == Orientation.landscape) {
//       width = mediaQuery.size.height;
//     }
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Payment Status"),
//       ),
//       body: ListView(
//         children: [
//           Container(
//             height: height / 4,
//           ),
//           Align(
//             child: Container(
//               height: 85,
//               width: 85,
//               decoration: BoxDecoration(
//                 gradient: linearGradient,
//                 borderRadius: BorderRadius.circular(55.0),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(1.5),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(55.0),
//                   ),
//                   child: Icon(
//                     Icons.done,
//                     size: 28.0,
//                     color: Colors.indigo,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             height: height / 25,
//           ),
//           Align(
//             child: Text(
//               "Payment Successful",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
//             ),
//           ),
//           Align(
//             child: Padding(
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 40.0, vertical: 8.0),
//               child: Text(
//                 "Your payment has been processed successfully.",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 18.0),
//               ),
//             ),
//           ),
//           Container(
//             height: height / 6,
//           ),
//           Align(
//             child: GestureDetector(
//               child: Container(
//                 height: 65,
//                 width: width / 1.7,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(55.0),
//                   gradient: linearGradient,
//                 ),
//                 child: Center(
//                   child: Text(
//                     "Done",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 24.0,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ),
//               onTap: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ),
//           Container(
//             height: height / 6,
//           ),
//         ],
//       ),
//     );
//   }
// }
