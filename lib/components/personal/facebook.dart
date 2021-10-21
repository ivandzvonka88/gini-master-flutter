// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:gini/components/auth/facebook/facebook_login.dart';
//
// String _clientId = "2763788990388299";
// String _redirectUrl = "https://www.facebook.com/connect/login_success.html";
// FirebaseAuth _auth = FirebaseAuth.instance;
//
// class PersonalFacebook extends StatefulWidget {
//   @override
//   _PersonalFacebookState createState() => _PersonalFacebookState();
// }
//
// class _PersonalFacebookState extends State<PersonalFacebook> {
//   var isFacebook = false;
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             height: 32.0,
//             width: 32.0,
//             decoration: BoxDecoration(
//                 color: Color.fromRGBO(24, 119, 242, 1),
//                 borderRadius: BorderRadius.circular(6.0)),
//             child: Align(
//                 child: SvgPicture.asset(
//               "assets/profile/facebook.svg",
//               height: 18.0,
//             )),
//           ),
//           SizedBox(
//             width: 16.0,
//           ),
//           Expanded(
//             child: Text(
//               "Facebook",
//               style: TextStyle(
//                   color: Color.fromRGBO(66, 74, 82, 1),
//                   fontSize: 16.0,
//                   fontWeight: FontWeight.w500),
//             ),
//           ),
//           CupertinoSwitch(
//               activeColor: theme.primaryColor,
//               value: isFacebook,
//               onChanged: (value) async {
//                 String result = await Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => CustomWebView(
//                             selectedUrl:
//                                 'https://www.facebook.com/dialog/oauth?client_id='
//                                 '$_clientId&redirect_uri='
//                                 '$_redirectUrl'
//                                 '&response_type=token&scope=email,public_profile,',
//                           ),
//                       maintainState: true,
//                       fullscreenDialog: true),
//                 );
//
//                 if (result != null) {
//                   try {
//                     final facebookAuthCred =
//                         FacebookAuthProvider.credential(result);
//                     final credential = await _auth.currentUser
//                         .linkWithCredential(facebookAuthCred);
//                     setState(() {
//                       isFacebook = !isFacebook;
//                     });
//                   } on PlatformException catch (error) {
//                     print(error);
//                   } catch (error) {
//                     print(error);
//                   }
//                 }
//               })
//         ],
//       ),
//     );
//   }
// }
