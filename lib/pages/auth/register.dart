// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:gini/app/config/constants.dart';
// import 'package:gini/components/auth/apple/apple.dart';
// import 'package:gini/components/auth/email/email_register.dart';
// import 'package:gini/components/auth/facebook/facebook_login.dart';
// import 'package:gini/components/auth/google/google_sign_in.dart';
// import 'package:gini/components/auth/phone/phone.dart';
// import 'package:gini/pages/legal/privacy_policy.dart';
// import 'package:gini/pages/legal/terms_conditions.dart';
//
// FirebaseAuth _auth = FirebaseAuth.instance;
//
// class RegisterPage extends StatefulWidget {
//   RegisterPage({@required this.sheetContext});
//   final BuildContext sheetContext;
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<RegisterPage> {
//   final _scaffoldKey = GlobalKey<ScaffoldState>();
//   var _isProcessing = false;
//
//   @override
//   Widget build(BuildContext context) {
//     final _theme = Theme.of(context);
//     final _mediaQuery = MediaQuery.of(context);
//     return Scaffold(
//       key: _scaffoldKey,
//       body: _isProcessing
//           ? Center(child: CircularProgressIndicator())
//           : Stack(
//               children: [
//                 Align(
//                   alignment: Alignment.bottomCenter,
//                   child: SingleChildScrollView(
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           height: _mediaQuery.size.height / 64.0,
//                         ),
//                         ListTile(
//                           title: Center(
//                             child: Text(
//                               "Create account",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w600, fontSize: 24.0),
//                             ),
//                           ),
//                           subtitle: Center(child: Text("Create a new account")),
//                         ),
//                         SizedBox(
//                           height: _mediaQuery.size.height / 96.0,
//                         ),
//                         Container(
//                           height: 56.0,
//                           width: _mediaQuery.orientation == Orientation.portrait
//                               ? _mediaQuery.size.width
//                               : 343.0,
//                           margin: EdgeInsets.symmetric(
//                               horizontal: 16.0, vertical: 8.0),
//                           decoration: BoxDecoration(
//                               gradient: linearGradient,
//                               borderRadius: BorderRadius.circular(50.0)),
//                           child: Material(
//                             color: Colors.transparent,
//                             child: InkWell(
//                               borderRadius: BorderRadius.circular(50.0),
//                               child: Stack(
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 26.0),
//                                     child: Align(
//                                         alignment: Alignment.centerLeft,
//                                         child: Icon(
//                                           Icons.email,
//                                           color: Colors.white,
//                                         )),
//                                   ),
//                                   Align(
//                                     alignment: Alignment.center,
//                                     child: Text(
//                                       "Continue with Email",
//                                       style: TextStyle(
//                                           fontSize: 16.0,
//                                           color: Colors.white,
//                                           fontWeight: FontWeight.w600),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               onTap: () async {
//                                 await Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (_) => EmailRegisterPage(
//                                               sheetContext: widget.sheetContext,
//                                             ),
//                                         fullscreenDialog: true));
//                               },
//                             ),
//                           ),
//                         ),
//                         Container(
//                           height: 56.0,
//                           width: _mediaQuery.orientation == Orientation.portrait
//                               ? _mediaQuery.size.width
//                               : 343.0,
//                           margin: EdgeInsets.symmetric(
//                               horizontal: 16.0, vertical: 8.0),
//                           decoration: BoxDecoration(
//                               border: Border.all(
//                                   width: 1.0, color: _theme.primaryColor),
//                               borderRadius: BorderRadius.circular(50.0)),
//                           child: Material(
//                             color: Colors.transparent,
//                             child: InkWell(
//                               borderRadius: BorderRadius.circular(50.0),
//                               child: Stack(
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 26.0),
//                                     child: Align(
//                                         alignment: Alignment.centerLeft,
//                                         child: Icon(
//                                           Icons.phone,
//                                           color: _theme.primaryColor,
//                                         )),
//                                   ),
//                                   Align(
//                                     alignment: Alignment.center,
//                                     child: Text(
//                                       "Continue with Phone",
//                                       style: TextStyle(
//                                           fontSize: 16.0,
//                                           color: _theme.primaryColor,
//                                           fontWeight: FontWeight.w600),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               onTap: () async {
//                                 await Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (_) => PhoneAuthPage(
//                                             sheetContext: widget.sheetContext,
//                                           ),
//                                       fullscreenDialog: true),
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                         AuthApple(
//                           voidCallback: () {
//                             setState(() {
//                               _isProcessing = false;
//                             });
//                             if (_auth.currentUser != null) {
//                               Navigator.pop(widget.sheetContext);
//                             }
//                           }, isLink: false,
//                         ),
//                         Container(
//                           height: 56.0,
//                           width: _mediaQuery.orientation == Orientation.portrait
//                               ? _mediaQuery.size.width
//                               : 343.0,
//                           margin: EdgeInsets.symmetric(
//                               horizontal: 16.0, vertical: 8.0),
//                           decoration: BoxDecoration(
//                               color: Color(0xFF3B5998),
//                               borderRadius: BorderRadius.circular(50.0)),
//                           child: Material(
//                             color: Colors.transparent,
//                             child: InkWell(
//                               borderRadius: BorderRadius.circular(50.0),
//                               child: Stack(
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 26.0),
//                                     child: Align(
//                                         alignment: Alignment.centerLeft,
//                                         child: SvgPicture.asset(
//                                           "assets/ui/facebook.svg",
//                                           height: 22.0,
//                                         )),
//                                   ),
//                                   Align(
//                                     alignment: Alignment.center,
//                                     child: Text(
//                                       "Continue with Facebook",
//                                       style: TextStyle(
//                                           fontSize: 16.0,
//                                           color: Colors.white,
//                                           fontWeight: FontWeight.w600),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               onTap: () {
//                                 loginWithFacebook(
//                                     context: context,
//                                     auth: _auth,
//                                     globalKey: _scaffoldKey,
//                                     processOffCallback: () {
//                                       setState(() {
//                                         _isProcessing = false;
//                                       });
//                                       if (_auth.currentUser != null) {
//                                         Navigator.pop(widget.sheetContext);
//                                       }
//                                     },
//                                     processOnCallback: () {
//                                       _isProcessing = true;
//                                     });
//                               },
//                             ),
//                           ),
//                         ),
//                         Container(
//                           height: 56.0,
//                           width: _mediaQuery.orientation == Orientation.portrait
//                               ? _mediaQuery.size.width
//                               : 343.0,
//                           margin: EdgeInsets.symmetric(
//                               horizontal: 16.0, vertical: 8.0),
//                           decoration: BoxDecoration(
//                               color: Color(0xFF4285F4),
//                               borderRadius: BorderRadius.circular(50.0)),
//                           child: Material(
//                             color: Colors.transparent,
//                             child: InkWell(
//                               borderRadius: BorderRadius.circular(50.0),
//                               child: Stack(
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 26.0),
//                                     child: Align(
//                                         alignment: Alignment.centerLeft,
//                                         child: SvgPicture.asset(
//                                           "assets/ui/google.svg",
//                                           height: 18.0,
//                                         )),
//                                   ),
//                                   Align(
//                                     alignment: Alignment.center,
//                                     child: Text(
//                                       "Continue with Google",
//                                       style: TextStyle(
//                                           fontSize: 16.0,
//                                           color: Colors.white,
//                                           fontWeight: FontWeight.w600),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               onTap: () {
//                                 setState(() {
//                                   _isProcessing = true;
//                                 });
//                                 signInWithGoogle(
//                                     auth: _auth,
//                                     globalKey: _scaffoldKey,
//                                     voidCallback: () {
//                                       setState(() {
//                                         _isProcessing = false;
//                                       });
//                                       if (_auth.currentUser != null) {
//                                         Navigator.pop(widget.sheetContext);
//                                       }
//                                     }, isLink: false);
//                               },
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: _mediaQuery.size.height / 33,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                           child: RichText(
//                             textAlign: TextAlign.center,
//                             text: TextSpan(
//                                 text: "By signing in, you accept our ",
//                                 style: TextStyle(
//                                     color: Color(0xFF808B95), fontSize: 12.0),
//                                 children: [
//                                   TextSpan(
//                                       text: "Terms of Service",
//                                       style:
//                                           TextStyle(color: Color(0xFF7A6EF9)),
//                                       recognizer: TapGestureRecognizer()
//                                         ..onTap = () {
//                                           Navigator.push(
//                                               context,
//                                               MaterialPageRoute(
//                                                   builder: (_) =>
//                                                       TermsAndConditionsPage(),
//                                                   fullscreenDialog: true));
//                                         }),
//                                   TextSpan(
//                                       text: " and ",
//                                       style: TextStyle(
//                                           color: Color(0xFF808B95),
//                                           fontSize: 12.0)),
//                                   TextSpan(
//                                       text: "Privacy Policy",
//                                       style:
//                                           TextStyle(color: Color(0xFF7A6EF9)),
//                                       recognizer: TapGestureRecognizer()
//                                         ..onTap = () {
//                                           Navigator.push(
//                                               context,
//                                               MaterialPageRoute(
//                                                   builder: (_) =>
//                                                       PrivacyPolicyPage(),
//                                                   fullscreenDialog: true));
//                                         }),
//                                 ]),
//                           ),
//                         ),
//                         SizedBox(
//                           height: _mediaQuery.size.height / 33,
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }
// }
