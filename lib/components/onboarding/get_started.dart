import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gini/components/authentication/sheet/sheet.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

class OnBoardingGetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.zero,
      child: Text(
        "GET STARTED",
        style: TextStyle(
            color: Color.fromRGBO(125, 106, 244, 1),
            fontSize: 14.0,
            fontWeight: FontWeight.bold),
      ),
      onPressed: () async {
        try {
          await _auth.signOut();
          await _firebaseFirestore.clearPersistence();
        } catch (error) {
          print(error);
        }
        showModalBottomSheet(
            context: context,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0)),
            builder: (sheetContext) {
              return AuthSheet();
            });
      },
    );
  }
}
