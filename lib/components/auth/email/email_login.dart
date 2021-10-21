import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:gini/app/config/constants.dart';
import 'package:gini/components/auth/email/reset.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class EmailLoginPage extends StatefulWidget {
  @override
  _EmailLoginPageState createState() => _EmailLoginPageState();
}

class _EmailLoginPageState extends State<EmailLoginPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  var _emailFocusNode = FocusNode();
  var _passwordFocusNode = FocusNode();

  var isProcessing = false;

  bool _isWrongEmail = false;

  bool _isWrongPassword = false;

  bool wasValidationTried = false;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Sign in",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 21.0),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16.0, bottom: 8.0, top: 24.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                focusNode: _emailFocusNode,
                // autofocus: true,
                controller: _emailTextController,
                onChanged: (value) {
                  if (wasValidationTried) {
                    if (_isWrongEmail) {
                      setState(() {
                        _isWrongEmail = false;
                      });
                    }
                    _formKey.currentState.validate();
                  }
                },
                validator: MultiValidator([
                  RequiredValidator(errorText: 'This field is required'),
                  EmailValidator(errorText: 'Enter a valid email address'),
                ]),
                onFieldSubmitted: (value) {},
                decoration: _isWrongEmail
                    ? InputDecoration(
                        isDense: true,
                        errorText:
                            "There's no user associated with this email address",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        hintText: "Please enter your email address",
                        labelText: "Email",
                        // prefixIcon: Icon(Icons.email),
                      )
                    : InputDecoration(
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
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: TextFormField(
                keyboardType: TextInputType.visiblePassword,
                focusNode: _passwordFocusNode,
                controller: _passwordTextController,
                obscureText: true,
                onChanged: (value) {
                  if (wasValidationTried) {
                    if (_isWrongPassword) {
                      setState(() {
                        _isWrongPassword = false;
                      });
                    }
                    _formKey.currentState.validate();
                  }
                },
                onFieldSubmitted: (value) {},
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Password is required'),
                  MinLengthValidator(8,
                      errorText: 'Password must be at least 8 digits long'),
                ]),
                decoration: _isWrongPassword
                    ? InputDecoration(
                        isDense: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        hintText: "Please enter your password here",
                        errorText: "Your entered password is wrong!",
                        labelText: "Password",
                        // prefixIcon: Icon(Icons.lock),
                      )
                    : InputDecoration(
                        isDense: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        hintText: "Please enter your password here",
                        labelText: "Password",
                        // prefixIcon: Icon(Icons.lock),
                      ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: FlatButton(
                    padding: EdgeInsets.all(0.0),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => ResetPasswordPage()));
                    },
                    child: Text(
                      "Forget Password?",
                      style: isDark
                          ? TextStyle(
                              fontSize: 13.0, fontWeight: FontWeight.w500)
                          : TextStyle(
                              fontSize: 13.0,
                              color: Color(0xFF808B95),
                              fontWeight: FontWeight.w500),
                    )),
              ),
            ),
            Container(
              height: 56.0,
              width: mediaQuery.orientation == Orientation.portrait
                  ? mediaQuery.size.width
                  : 343.0,
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              decoration: BoxDecoration(
                  gradient: linearGradient,
                  borderRadius: BorderRadius.circular(50.0)),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Center(
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  onTap: isProcessing
                      ? null
                      : () async {
                          wasValidationTried = true;
                          if (_formKey.currentState.validate()) {
                            _emailFocusNode.unfocus();
                            _passwordFocusNode.unfocus();
                            setState(() {
                              isProcessing = true;
                              _signInWithEmailAndPassword();
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

  void _signInWithEmailAndPassword() async {
    try {
      final User user = (await _auth.signInWithEmailAndPassword(
        email: _emailTextController.text,
        password: _passwordTextController.text,
      ))
          .user;
      if (user != null) {
        if (!user.emailVerified) {
          await user.updateProfile(displayName: user.displayName);
          if (!user.emailVerified) {
            user.sendEmailVerification();
          }
        }
        Navigator.popUntil(context, (route) => route.isFirst);
      } else {
        setState(() {
          isProcessing = false;
        });
      }
    } catch (error) {
      setState(() {
        isProcessing = false;
      });
      if (error.code.toString() == "user-not-found") {
        setState(() {
          _isWrongEmail = true;
          _emailFocusNode.requestFocus();
        });
      } else if (error.code.toString() == "wrong-password") {
        _isWrongPassword = true;
        _passwordFocusNode.requestFocus();
      } else {
        _scaffoldKey.currentState.removeCurrentSnackBar();
        _scaffoldKey.currentState
            .showSnackBar(SnackBar(content: Text(error.code.toString())));
      }
    }
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }
}
