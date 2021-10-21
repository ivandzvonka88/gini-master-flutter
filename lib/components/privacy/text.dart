import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gini/components/custom/web_view.dart';

FirebaseFirestore _firestore = FirebaseFirestore.instance;

class PrivacyPolicyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: _firestore.collection("legal").doc("privacyPolicy").get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            try {
              String link = snapshot.data.data()['link'];
              return LegalWebView(link: link);
            } catch (error) {
              return Center(
                child: Text("Ah oh! Something went wrong!"),
              );
            }
          } else {
            return Center(child: Text("Something went wrong! Try again later"));
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
