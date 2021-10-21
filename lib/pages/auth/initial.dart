// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:gini/components/auth/widgets/decorated_tab_bar.dart';
// import 'package:gini/pages/auth/login.dart';
// import 'package:gini/pages/auth/register.dart';
// //
// // class InitialPage extends StatefulWidget {
// //   @override
// //   _InitialPageState createState() => _InitialPageState();
// // }
// //
// // class _InitialPageState extends State<InitialPage> {
// //   @override
// //   void initState() {
// //     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
// //       if (mounted) {
// //         showBottomSheet(context: context, isSignIn: false);
// //       }
// //     });
// //     super.initState();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final _theme = Theme.of(context);
// //     final _mediaQuery = MediaQuery.of(context);
// //     final height = _mediaQuery.size.height - _mediaQuery.padding.top;
// //     return Scaffold(
// //       appBar: AppBar(elevation: 0.0, toolbarHeight: 0.0),
// //       body: ListView(
// //         children: [
// //           SizedBox(height: height / 25.0),
// //           Align(child: GiniIconColorFul()),
// //           SizedBox(height: height / 20.73),
// //           Image.asset("assets/rush.png", height: height / 2.0),
// //           SizedBox(height: height / 40.0),
// //           Align(
// //             child: Container(
// //               height: 56.0,
// //               width: _mediaQuery.orientation == Orientation.portrait
// //                   ? _mediaQuery.size.width
// //                   : _mediaQuery.size.width.clamp(50.0, 343.0),
// //               margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
// //               decoration: BoxDecoration(
// //                   gradient: linearGradient,
// //                   borderRadius: BorderRadius.circular(50.0)),
// //               child: Material(
// //                 color: Colors.transparent,
// //                 child: InkWell(
// //                   borderRadius: BorderRadius.circular(50.0),
// //                   child: Center(
// //                     child: Text(
// //                       "Create account",
// //                       style: TextStyle(
// //                           fontSize: 16.0,
// //                           color: Colors.white,
// //                           fontWeight: FontWeight.w600),
// //                     ),
// //                   ),
// //                   onTap: () =>
// //                       showBottomSheet(context: context, isSignIn: false),
// //                 ),
// //               ),
// //             ),
// //           ),
// //           Align(
// //             child: Container(
// //               height: 56.0,
// //               width: _mediaQuery.orientation == Orientation.portrait
// //                   ? _mediaQuery.size.width
// //                   : 343.0,
// //               margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
// //               decoration: BoxDecoration(
// //                   border: Border.all(width: 1.0, color: _theme.primaryColor),
// //                   borderRadius: BorderRadius.circular(50.0)),
// //               child: Material(
// //                 color: Colors.transparent,
// //                 child: InkWell(
// //                   borderRadius: BorderRadius.circular(50.0),
// //                   child: Center(
// //                     child: Text(
// //                       "Sign in",
// //                       style: TextStyle(
// //                           fontSize: 16.0,
// //                           color: _theme.primaryColor,
// //                           fontWeight: FontWeight.w600),
// //                     ),
// //                   ),
// //                   onTap: () =>
// //                       showBottomSheet(context: context, isSignIn: true),
// //                 ),
// //               ),
// //             ),
// //           ),
// //           SizedBox(
// //             height: height / 30.0,
// //           ),
// //           Padding(
// //             padding: const EdgeInsets.only(left: 16.0, right: 16.0),
// //             child: RichText(
// //               textAlign: TextAlign.center,
// //               text: TextSpan(
// //                   text: "By signing in, you accept our ",
// //                   style: TextStyle(color: Color(0xFF808B95), fontSize: 12.0),
// //                   children: [
// //                     TextSpan(
// //                         text: "Terms of Service",
// //                         style: TextStyle(color: _theme.accentColor),
// //                         recognizer: TapGestureRecognizer()..onTap = () {}),
// //                     TextSpan(
// //                         text: " and ",
// //                         style: TextStyle(
// //                             color: Color(0xFF808B95), fontSize: 12.0)),
// //                     TextSpan(
// //                         text: "Privacy Policy",
// //                         style: TextStyle(color: _theme.accentColor),
// //                         recognizer: TapGestureRecognizer()..onTap = () {}),
// //                   ]),
// //             ),
// //           ),
// //           SizedBox(
// //             height: height / 25.0,
// //           )
// //         ],
// //       ),
// //     );
// //   }
// //
// //   void showBottomSheet(
// //       {@required BuildContext context, @required bool isSignIn}) async {
// //     await showModalBottomSheet(
// //         context: context,
// //         isScrollControlled: true,
// //         clipBehavior: Clip.antiAliasWithSaveLayer,
// //         shape: RoundedRectangleBorder(
// //             borderRadius: BorderRadius.vertical(top: Radius.circular(10.0))),
// //         builder: (sheetContext) {
// //           return AuthSheet(
// //             isSignIn: isSignIn,
// //             sheetContext: sheetContext,
// //           );
// //         });
// //   }
// // }
//
// class AuthSheet extends StatelessWidget {
//   AuthSheet({@required this.isSignIn, @required this.sheetContext});
//   final bool isSignIn;
//   final BuildContext sheetContext;
//   @override
//   Widget build(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context);
//     final theme = Theme.of(context);
//     final isDark = theme.brightness == Brightness.dark;
//     return Container(
//       height: mediaQuery.size.height / 1.35,
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
