// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:gini/components/auth/facebook/webview.dart';
//
// String _clientId = "3341568259273173";
// String _redirectUrl = "https://www.facebook.com/connect/login_success.html";
//
// loginWithFacebook(
//     {@required BuildContext context,
//     @required FirebaseAuth auth,
//     @required GlobalKey<ScaffoldState> globalKey,
//     @required VoidCallback processOnCallback,
//     @required VoidCallback processOffCallback}) async {
//   String result = await Navigator.push(
//     context,
//     MaterialPageRoute(
//         builder: (context) => CustomWebView(
//               selectedUrl:
//                   'https://www.facebook.com/dialog/oauth?client_id=$_clientId&redirect_uri=$_redirectUrl&response_type=token&scope=email,public_profile,',
//             ),
//         maintainState: true,
//         fullscreenDialog: true),
//   );
//
//   if (result != null) {
//     processOnCallback.call();
//     try {
//       final facebookAuthCred = FacebookAuthProvider.credential(result);
//       final credential = await auth.signInWithCredential(facebookAuthCred);
//       // globalKey.currentState.removeCurrentSnackBar();
//       // globalKey.currentState.showSnackBar(SnackBar(
//       //   content: Text("Welcome ${credential.user.displayName}"),
//       // ));
//       processOffCallback.call();
//     } on PlatformException catch (error) {
//       processOffCallback.call();
//       print(error);
//       globalKey.currentState.removeCurrentSnackBar();
//       globalKey.currentState.showSnackBar(SnackBar(
//         content: Text("${error.code}"),
//         duration: Duration(seconds: 20),
//       ));
//     } catch (error) {
//       processOffCallback.call();
//       print(error);
//       globalKey.currentState.removeCurrentSnackBar();
//       globalKey.currentState.showSnackBar(SnackBar(
//         content: Text("${error.code}"),
//         duration: Duration(seconds: 20),
//       ));
//     }
//   }
// }
