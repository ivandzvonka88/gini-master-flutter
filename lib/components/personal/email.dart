import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gini/components/auth/apple/apple.dart';
import 'package:gini/components/auth/google/google.dart';
import 'package:gini/components/auth/google/google_sign_in.dart';
import 'package:gini/models/profile/personal_information.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class PersonalEmail extends StatefulWidget {
  PersonalEmail({@required this.personalInfoModel, @required this.scaffoldKey});
  final PersonalInfoModel personalInfoModel;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  _PersonalEmailState createState() => _PersonalEmailState();
}

class _PersonalEmailState extends State<PersonalEmail> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Email",
              style: TextStyle(
                  color: Color.fromRGBO(128, 139, 149, 1),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 16.0),
            InkWell(
                child: Text(
                  "${_auth.currentUser.email}",
                  style: TextStyle(
                      color: Color.fromRGBO(31, 30, 30, 1),
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0),
                ),
                onTap: _auth.currentUser.email != null
                    ? null
                    : () async {
                        await showCupertinoModalPopup(
                            context: context,
                            builder: (context) => CupertinoActionSheet(
                                  title: Text("Link Email Address"),
                                  message: Text(
                                      "Please select your preferred provider to get verified email address"),
                                  actions: [
                                    CupertinoActionSheetAction(
                                      onPressed: () {},
                                      child: AuthApple(
                                          voidCallback: () {
                                            Navigator.pop(context);
                                          },
                                          isLink: true),
                                    ),
                                    CupertinoActionSheetAction(
                                      onPressed: () {},
                                      child: AuthGoogle(
                                        onTap: () {
                                          try {
                                            signInWithGoogle(
                                                auth: _auth,
                                                globalKey: widget.scaffoldKey,
                                                voidCallback: () async {
                                                  Navigator.pop(context);
                                                },
                                                isLink: true);
                                          } catch (error) {
                                            print(error);
                                          }
                                        },
                                      ),
                                    ),
                                    CupertinoActionSheetAction(
                                      isDestructiveAction: true,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Cancel"),
                                    )
                                  ],
                                ));
                        setState(() {});
                      })
          ],
        ),
      ),
    );
  }
}
