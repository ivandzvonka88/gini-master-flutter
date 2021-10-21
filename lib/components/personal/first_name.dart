import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:gini/components/auth/email/custom_validators.dart';
import 'package:gini/models/profile/personal_information.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class PersonalFirstName extends StatelessWidget {
  PersonalFirstName({@required this.personalInfoModel});
  final PersonalInfoModel personalInfoModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "First Name",
            style: TextStyle(
                color: Color.fromRGBO(128, 139, 149, 1),
                fontSize: 14.0,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 16.0),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onSaved: (value) {
              personalInfoModel.firstName = value;
            },
            onChanged: (value) {
              personalInfoModel.isFormEdited = true;
            },
            validator: MultiValidator([
              RequiredValidator(errorText: "First name required"),
              NameValidator(errorText: "Only alphabets allowed")
            ]),
            initialValue: _auth.currentUser.displayName.split(" ").first,
            style: TextStyle(
                color: Color.fromRGBO(31, 30, 30, 1),
                fontWeight: FontWeight.w500,
                fontSize: 16.0),
            decoration: InputDecoration(
                border: InputBorder.none, isDense: true, isCollapsed: true),
          )
        ],
      ),
    );
  }
}
