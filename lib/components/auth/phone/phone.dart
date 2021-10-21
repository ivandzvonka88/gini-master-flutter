import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:gini/app/config/constants.dart';
import 'package:gini/components/auth/phone/verify.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class PhoneAuthPage extends StatefulWidget {
  PhoneAuthPage({@required this.isLink});
  final bool isLink;
  @override
  _PhoneAuthPageState createState() => _PhoneAuthPageState();
}

class _PhoneAuthPageState extends State<PhoneAuthPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var _focusNode = FocusNode();
  var isProcessing = false;
  var autoVerification = false;
  final _phoneTextController = MaskedTextController(mask: '(000) 000-0000');
  var dialCode = "+1";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: isDark ? theme.primaryColor : Colors.white,
        elevation: 0.0,
        title: Text(
          "Phone",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 21.0),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Align(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 48.0, vertical: 16.0),
                child: Text(
                  "Please confirm your country code and enter your phone number",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0, color: Color(0xFF808B95)),
                ),
              ),
            ),
            SizedBox(height: 32.0),
            Container(
              height: 56.0,
              width: 343.0,
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Color(0xFFDBE2E9)),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: CountryCodePicker(
                      initialSelection: 'US',
                      onChanged: (cc) {
                        dialCode = cc.dialCode;
                        print(cc.code);
                        switch (cc.code) {
                          case 'US':
                            {
                              setState(() {
                                _phoneTextController
                                    .updateMask("(000) 000-0000");
                              });
                            }
                            break;
                          case 'PK':
                            {
                              setState(() {
                                _phoneTextController.updateMask("000 0000000");
                              });
                            }
                            break;
                          default:
                            {
                              setState(() {
                                _phoneTextController
                                    .updateMask("000000000000000000");
                              });
                            }
                            break;
                        }
                      },
                    ),
                  ),
                  VerticalDivider(width: 1.0, color: Color(0xFF808B95)),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextFormField(
                        focusNode: _focusNode,
                        keyboardType: TextInputType.phone,
                        controller: _phoneTextController,
                        style: TextStyle(fontSize: 18.0),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                          hintText: _phoneTextController.mask,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 56.0,
              width: 343.0,
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              decoration: BoxDecoration(
                  gradient: linearGradient,
                  borderRadius: BorderRadius.circular(50.0)),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Center(
                    child: Text(
                      "Continue",
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  onTap: isProcessing
                      ? null
                      : () async {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              isProcessing = true;
                              _focusNode.unfocus();
                              _verifyPhoneNumber();
                            });
                          }
                        },
                ),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            isProcessing
                ? Align(child: CircularProgressIndicator())
                : SizedBox.shrink(),
            SizedBox(
              height: 48.0,
            ),
            autoVerification
                ? Align(child: Text("Auto verifying! Please wait"))
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  void _verifyPhoneNumber() async {
    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      if (widget.isLink) {
        await _auth.currentUser.linkWithCredential(phoneAuthCredential);
      } else {
        await _auth.signInWithCredential(phoneAuthCredential);
      }
     Navigator.popUntil(context, (route) => route.isFirst);
    };

    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      _scaffoldKey.currentState.removeCurrentSnackBar();
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(
            'Phone number verification failed. Reason: ${authException.code}'),
        duration: Duration(seconds: 5),
      ));
      setState(() {
        isProcessing = false;
        autoVerification = false;
      });
    };

    PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      if (!Platform.isAndroid) {
        setState(() {
          isProcessing = false;
        });
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PhoneVerifyPage(
                verificationId: verificationId,
                phoneNo: "$dialCode${_phoneTextController.text}",
                isLink: widget.isLink),
          ),
        );
      } else {
        setState(() {
          autoVerification = true;
        });
      }
    };

    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) async {
      setState(() {
        isProcessing = false;
        autoVerification = false;
      });
      if (Platform.isAndroid) {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PhoneVerifyPage(
              verificationId: verificationId,
              phoneNo: "$dialCode${_phoneTextController.text}",
              isLink: widget.isLink,
            ),
          ),
        );
      }
    };

    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: "$dialCode${_phoneTextController.text}",
          timeout: const Duration(seconds: 5),
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    } catch (e) {
      _scaffoldKey.currentState.removeCurrentSnackBar();
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Failed to Verify Phone Number: ${e.code}"),
      ));
      setState(() {
        isProcessing = false;
      });
    }
  }
}
