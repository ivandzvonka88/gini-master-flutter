import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:gini/app/config/constants.dart';
import 'package:gini/components/auth/email/custom_validators.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class EmailRegisterPage extends StatefulWidget {
  @override
  _EmailLoginPageState createState() => _EmailLoginPageState();
}

class _EmailLoginPageState extends State<EmailRegisterPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  final _firstNameTextController = TextEditingController();
  final _lastNameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _passwordAgainTextController = TextEditingController();

  final _firstNameFocusNode = FocusNode();
  final _lastNameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _passwordAgainFocusNode = FocusNode();

  var isProcessing = false;

  bool _userAlreadyExists = false;

  bool _isWrongPassword = false;

  bool wasValidationTried = false;

  String password;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Create account",
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
                left: 16.0,
                right: 16.0,
                bottom: 8.0,
                top: 8.0,
              ),
              child: TextFormField(
                keyboardType: TextInputType.name,
                focusNode: _firstNameFocusNode,
                controller: _firstNameTextController,
                onChanged: (value) {
                  if (wasValidationTried) {
                    _formKey.currentState.validate();
                  }
                },
                onFieldSubmitted: (value) {},
                validator: MultiValidator([
                  RequiredValidator(errorText: 'First name is required'),
                  MinLengthValidator(2,
                      errorText: 'Name must be at least two character'),
                  NameValidator(errorText: "Only alphabets are allowed")
                ]),
                decoration: InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  hintText: "Please enter your first name",
                  labelText: "First name",
                  // prefixIcon: Icon(Icons.email),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: 8.0,
                top: 8.0,
              ),
              child: TextFormField(
                keyboardType: TextInputType.name,
                focusNode: _lastNameFocusNode,
                controller: _lastNameTextController,
                onChanged: (value) {
                  if (wasValidationTried) {
                    _formKey.currentState.validate();
                  }
                },
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Last name is required'),
                  MinLengthValidator(2,
                      errorText: 'Name must be at least two character'),
                  NameValidator(errorText: "Only alphabets are allowed")
                ]),
                onFieldSubmitted: (value) {},
                decoration: InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  hintText: "Please enter your last name",
                  labelText: "Last name",
                  // prefixIcon: Icon(Icons.email),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: 8.0,
                top: 8.0,
              ),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                focusNode: _emailFocusNode,
                controller: _emailTextController,
                onChanged: (value) {
                  if (wasValidationTried) {
                    if (_userAlreadyExists) {
                      setState(() {
                        _userAlreadyExists = false;
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
                decoration: _userAlreadyExists
                    ? InputDecoration(
                        isDense: true,
                        errorText: "User with that email address already exist",
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
                  password = value;
                  if (_isWrongPassword) {
                    setState(() {
                      _isWrongPassword = false;
                    });
                  }
                  if (wasValidationTried) {
                    _formKey.currentState.validate();
                  }
                },
                onFieldSubmitted: (value) {},
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Password is required'),
                  MinLengthValidator(8,
                      errorText: 'Password must be at least 8 digits long'),
                  PatternValidator(r'^(?=.*?[0-9])(?=.*?[a-zA-Z])',
                      errorText:
                          'Passwords must have at least one number and alphabet')
                ]),
                decoration: _isWrongPassword
                    ? InputDecoration(
                        isDense: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        hintText: "Please enter your password",
                        errorText: "You entered a wrong password",
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
                        hintText: "Please enter your password",
                        labelText: "Password",
                        // prefixIcon: Icon(Icons.lock),
                      ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: TextFormField(
                keyboardType: TextInputType.visiblePassword,
                focusNode: _passwordAgainFocusNode,
                controller: _passwordAgainTextController,
                obscureText: true,
                onChanged: (value) {
                  if (wasValidationTried) {
                    _formKey.currentState.validate();
                  }
                },
                onFieldSubmitted: (value) {},
                validator: (val) =>
                    MatchValidator(errorText: "Passwords do not match")
                        .validateMatch(val, password),
                decoration: InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  hintText: "Please enter your password again",
                  labelText: "Re-Password",
                  // prefixIcon: Icon(Icons.lock),
                ),
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
                      "Sign up",
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
                            _firstNameFocusNode.unfocus();
                            _lastNameFocusNode.unfocus();
                            _emailFocusNode.unfocus();
                            _passwordFocusNode.unfocus();
                            _passwordAgainFocusNode.unfocus();

                            setState(() {
                              isProcessing = true;
                              _register();
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

  void _register() async {
    try {
      final User user = (await _auth.createUserWithEmailAndPassword(
        email: _emailTextController.text,
        password: _passwordTextController.text,
      ))
          .user;
      if (user != null) {
        var name =
            '${_firstNameTextController.text.toUpperCase().substring(0, 1)}'
            '${_firstNameTextController.text.toLowerCase().substring(1)} '
            '${_lastNameTextController.text.toUpperCase().substring(0, 1)}'
            '${_lastNameTextController.text.toLowerCase().substring(1)}';

        await user.updateProfile(displayName: "$name");
        await user.sendEmailVerification();

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
      if (error.code.toString() == "email-already-in-use") {
        setState(() {
          _userAlreadyExists = true;
          _emailFocusNode.requestFocus();
        });
      } else {
        _scaffoldKey.currentState.removeCurrentSnackBar();
        _scaffoldKey.currentState
            .showSnackBar(SnackBar(content: Text('${error.code}')));
      }
    }
  }

  @override
  void dispose() {
    _firstNameTextController.dispose();
    _lastNameTextController.dispose();
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _passwordAgainTextController.dispose();
    _firstNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _passwordAgainFocusNode.dispose();
    super.dispose();
  }
}
