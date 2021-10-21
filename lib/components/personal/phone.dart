import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:gini/components/auth/phone/phone.dart';
import 'package:gini/models/profile/personal_information.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class PersonalPhone extends StatefulWidget {
  PersonalPhone({@required this.personalInfoModel});
  final PersonalInfoModel personalInfoModel;

  @override
  _PersonalPhoneState createState() => _PersonalPhoneState();
}

class _PersonalPhoneState extends State<PersonalPhone> {
  final controller = MaskedTextController(mask: "+0 000 000 0000 00000");

  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser.phoneNumber != null) {
      controller.updateText("${_auth.currentUser.phoneNumber}");
    }
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Phone Number",
              style: TextStyle(
                  color: Color.fromRGBO(128, 139, 149, 1),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 16.0),
            GestureDetector(
              child: TextFormField(
                controller: controller,
                onSaved: (value) {
                  widget.personalInfoModel.phoneNo = value;
                },
                onChanged: (value) {
                  widget.personalInfoModel.isFormEdited = true;
                },
                validator: MultiValidator([
                  RequiredValidator(errorText: "Phone number is required"),
                ]),
                style: TextStyle(
                    color: Color.fromRGBO(31, 30, 30, 1),
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    hintText: "Phone required",
                    isCollapsed: true,
                    enabled: false),
              ),
              onTap: _auth.currentUser.phoneNumber != null
                  ? null
                  : () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PhoneAuthPage(isLink: true)));
                      setState(() {});
                    },
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
