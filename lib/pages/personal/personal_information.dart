import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gini/components/personal/profile_image.dart';
import 'package:gini/components/personal/app_bar.dart';
import 'package:gini/components/personal/email.dart';
import 'package:gini/components/personal/first_name.dart';
import 'package:gini/components/personal/last_name.dart';
import 'package:gini/components/personal/phone.dart';
import 'package:gini/components/personal/unsaved_diaog.dart';
import 'package:gini/models/profile/personal_information.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class PersonalInformationPage extends StatelessWidget {
  final personalInfo = PersonalInfoModel();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: PersonalAppBar(
          personalInfoModel: personalInfo,
          formKey: _formKey,
          scaffoldKey: _scaffoldKey),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
            left: mediaQuery.padding.left,
            right: mediaQuery.padding.right,
            bottom: mediaQuery.padding.bottom),
        child: Form(
          onWillPop: () async {
            if (!personalInfo.isFormEdited) return true;
            bool result = await showDialog(
                    context: context,
                    builder: (context) => PersonalUnSavedAlertDialog()) ??
                false;
            if (!result) {
              saveChanges(_formKey, personalInfo, context, _scaffoldKey);
            }
            return result;
          },
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 36.0),
              ProfileImage(isEnabled: true),
              SizedBox(height: 32.0),
              Container(height: 1.0, color: Color.fromRGBO(226, 234, 241, 1)),
              SizedBox(height: 16.0),
              PersonalFirstName(personalInfoModel: personalInfo),
              SizedBox(height: 16.0),
              Container(height: 1.0, color: Color.fromRGBO(226, 234, 241, 1)),
              SizedBox(height: 16.0),
              PersonalLastName(personalInfoModel: personalInfo),
              SizedBox(height: 16.0),
              Container(height: 1.0, color: Color.fromRGBO(226, 234, 241, 1)),
              SizedBox(height: 16.0),
              PersonalEmail(
                  personalInfoModel: personalInfo, scaffoldKey: _scaffoldKey),
              SizedBox(height: 16.0),
              Container(height: 1.0, color: Color.fromRGBO(226, 234, 241, 1)),
              SizedBox(height: 16.0),
              PersonalPhone(personalInfoModel: personalInfo),
              SizedBox(height: 16.0),
              Container(height: 1.0, color: Color.fromRGBO(226, 234, 241, 1)),
            ],
          ),
        ),
      ),
    );
  }

  void saveChanges(
      GlobalKey<FormState> formKey,
      PersonalInfoModel personalInfoModel,
      BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey) async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      try {
        await _auth.currentUser.updateProfile(
            displayName: "${personalInfoModel.firstName} "
                "${personalInfoModel.lastName}");
        Navigator.pop(context, true);
      } catch (error) {
        scaffoldKey.currentState.removeCurrentSnackBar();
        scaffoldKey.currentState
            .showSnackBar(SnackBar(content: Text("$error")));
      }
    }
  }
}
