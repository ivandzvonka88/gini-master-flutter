import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

void signInWithGoogle(
    {@required GlobalKey<ScaffoldState> globalKey,
    @required FirebaseAuth auth,
    @required VoidCallback voidCallback,
    @required bool isLink}) async {
  try {
    UserCredential userCredential;

    if (kIsWeb) {
      GoogleAuthProvider googleProvider = GoogleAuthProvider();
      userCredential = await auth.signInWithPopup(googleProvider);
    } else {
      final GoogleSignInAccount googleUser =
          await GoogleSignIn(scopes: ['email', 'profile']).signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final GoogleAuthCredential googleAuthCredential =
          GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      if (isLink) {
        userCredential =
            await auth.currentUser.linkWithCredential(googleAuthCredential);
      } else {
        userCredential = await auth.signInWithCredential(googleAuthCredential);
      }
    }
    voidCallback.call();
    final user = userCredential.user;
    globalKey.currentState.removeCurrentSnackBar();
    globalKey.currentState.showSnackBar(SnackBar(
      content: Text("Welcome ${user.displayName}"),
    ));
  } on PlatformException catch (error) {
    voidCallback.call();
    globalKey.currentState.removeCurrentSnackBar();
    globalKey.currentState.showSnackBar(SnackBar(
      content: Text("${error.code}"),
    ));
  } catch (e) {
    voidCallback.call();
    print(e);
    // globalKey.currentState.removeCurrentSnackBar();
    // globalKey.currentState.showSnackBar(SnackBar(
    //   content: Text("Failed to sign in with Google"),
    // ));
  }
}
