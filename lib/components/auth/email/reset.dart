import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:gini/app/config/constants.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var _focusNode = FocusNode();
  var isProcessing = false;
  final _emailTextController = TextEditingController();

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
              "Enter the email address associated with your account, and we’ll email a link to reset your password",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0, color: Color(0xFF808B95)),
            ),
          ),
        ),
        SizedBox(height: 32.0),
        Padding(
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0, bottom: 8.0, top: 24.0),
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            focusNode: _focusNode,
            controller: _emailTextController,
            onChanged: (value) {},
            validator: MultiValidator([
              RequiredValidator(errorText: 'This field is required'),
              EmailValidator(errorText: 'Enter a valid email address'),
            ]),
            onFieldSubmitted: (value) {},
            decoration: InputDecoration(
              isDense: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              hintText: "Please enter your email address",
              labelText: "Email",
              // prefixIcon: Icon(Icons.email),
            ),
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
                          _resetEmailPassword();
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
            : SizedBox.shrink()
      ],
    ),
      ),
    );
  }

  void _resetEmailPassword() async {
    try {
      await _auth.sendPasswordResetEmail(email: _emailTextController.text);
      _scaffoldKey.currentState.removeCurrentSnackBar();
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Password reset email sent."),
      ));
      setState(() {
        isProcessing = false;
      });
    } catch (error) {
      setState(() {
        isProcessing = false;
      });
      _scaffoldKey.currentState.removeCurrentSnackBar();
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Error! ${error.code}'),
      ));
    }
  }
}
