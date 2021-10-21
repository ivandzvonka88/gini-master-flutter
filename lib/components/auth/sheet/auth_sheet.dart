// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:gini/components/auth/widgets/decorated_tab_bar.dart';
// import 'package:gini/pages/auth/login.dart';
// import 'package:gini/pages/auth/register.dart';
//
// class AuthSheet extends StatelessWidget {
//   AuthSheet({@required this.isSignIn, @required this.sheetContext});
//   final bool isSignIn;
//   final BuildContext sheetContext;
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final isDark = theme.brightness == Brightness.dark;
//     return Container(
//       height: 580.0,
//       child: DefaultTabController(
//         initialIndex: isSignIn ? 1 : 0,
//         length: 2,
//         child: Scaffold(
//           appBar: DecoratedTabBar(
//             tabBar: TabBar(
//               indicatorColor: theme.primaryColor,
//               labelColor: isDark ? Colors.white70 : Color(0xFF1F1E1E),
//               unselectedLabelColor: isDark ? Colors.white70 : Color(0xFF808B95),
//               tabs: [
//                 Tab(
//                   child: Text(
//                     "Create account",
//                     style:
//                         TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
//                   ),
//                 ),
//                 Tab(
//                   child: Text(
//                     "Sign in",
//                     style:
//                         TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
//                   ),
//                 ),
//               ],
//             ),
//             decoration: BoxDecoration(
//               border: Border(
//                 bottom: BorderSide(
//                   color: Color(0xFFE2EAF1),
//                   width: 2.0,
//                 ),
//               ),
//             ),
//           ),
//           body: TabBarView(children: [
//             RegisterPage(sheetContext: sheetContext),
//             LoginPage(sheetContext: sheetContext),
//           ]),
//         ),
//       ),
//     );
//   }
// }
