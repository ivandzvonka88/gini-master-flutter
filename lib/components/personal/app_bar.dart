import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gini/models/profile/personal_information.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class PersonalAppBar extends StatefulWidget implements PreferredSizeWidget {
  PersonalAppBar(
      {@required this.personalInfoModel,
      @required this.scaffoldKey,
      @required this.formKey});
  final PersonalInfoModel personalInfoModel;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final GlobalKey<FormState> formKey;

  @override
  _PersonalAppBarState createState() => _PersonalAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _PersonalAppBarState extends State<PersonalAppBar> {
  bool isProcessing = false;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      title: Text(
        "Profile Details",
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w600,
          color: Color.fromRGBO(31, 30, 30, 1),
        ),
      ),
      actions: [
        isProcessing
            ? FlatButton.icon(
                icon: Container(
                    height: 24.0,
                    width: 24.0,
                    child: CircularProgressIndicator(strokeWidth: 3.0)),
                onPressed: null,
                label: Text(""),
              )
            : FlatButton(
                onPressed: () async {
                  if (widget.formKey.currentState.validate()) {
                    widget.formKey.currentState.save();
                    try {
                      setState(() {
                        isProcessing = true;
                      });
                      await _auth.currentUser.updateProfile(
                          displayName: "${widget.personalInfoModel.firstName} "
                              "${widget.personalInfoModel.lastName}");
                      Navigator.pop(context, true);
                    } catch (error) {
                      setState(() {
                        isProcessing = false;
                      });
                      widget.scaffoldKey.currentState.removeCurrentSnackBar();
                      widget.scaffoldKey.currentState
                          .showSnackBar(SnackBar(content: Text("$error")));
                    }
                  }
                },
                child: Text(
                  "Save",
                  style: TextStyle(
                    color: Color.fromRGBO(125, 106, 244, 1),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
      ],
    );
  }
}
