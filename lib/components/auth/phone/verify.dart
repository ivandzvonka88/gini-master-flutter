import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sms_autofill/sms_autofill.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class PhoneVerifyPage extends StatefulWidget {
  PhoneVerifyPage(
      {@required this.verificationId,
      @required this.phoneNo,
      @required this.isLink});
  final String verificationId;
  final String phoneNo;
  final bool isLink;

  @override
  _PhoneVerifyPageState createState() => _PhoneVerifyPageState();
}

class _PhoneVerifyPageState extends State<PhoneVerifyPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var isProcessing = false;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: isDark ? theme.primaryColor : Colors.white,
          elevation: 0.0,
          title: Text(
            "Code verification",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 21.0),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                  child: Text(
                "Enter 6-digit code we sent to ${widget.phoneNo}",
                textAlign: TextAlign.center,
              )),
            ),
            SizedBox(
              height: mediaQuery.size.height / 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                  child: PinFieldAutoFill(
                keyboardType: TextInputType.numberWithOptions(
                    decimal: true, signed: true),
                decoration: UnderlineDecoration(
                  lineHeight: 6.0,
                  colorBuilder: PinListenColorBuilder(
                      theme.primaryColor, Color(0xFFE2EAF1)),
                ),
                onCodeSubmitted: (value) {
                  if (value.length == 6) {
                    setState(() {
                      isProcessing = true;
                    });
                    _signInWithPhoneNumber(value);
                  }
                },
              )),
            ),
            SizedBox(height: 50.0),
            Align(
              child: isProcessing
                  ? CircularProgressIndicator()
                  : SizedBox.shrink(),
            )
          ],
        ));
  }

  void _signInWithPhoneNumber(String code) async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: code,
      );
      if (widget.isLink) {
        await _auth.currentUser.linkWithCredential(credential);
      } else {
        await _auth.signInWithCredential(credential);
      }
      if (mounted) {
        setState(() {
          isProcessing = false;
        });
      }
      Navigator.popUntil(context, (route) => route.isFirst);
    } on PlatformException catch (error) {
      if (mounted) {
        setState(() {
          isProcessing = false;
        });
      }
      print(error);
      _scaffoldKey.currentState.removeCurrentSnackBar();
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("${error.message}"),
      ));
    } catch (e) {
      if (mounted) {
        setState(() {
          isProcessing = false;
        });
      }
      print(e);
      _scaffoldKey.currentState.removeCurrentSnackBar();
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("${e.code}"),
      ));
    }
  }
}
