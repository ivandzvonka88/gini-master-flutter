import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:gini/app/config/constants.dart';
import 'package:gini/components/auth/email/custom_validators.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class UserInfoPage extends StatefulWidget {
  UserInfoPage({
    @required this.hasEmail,
    @required this.hasDisplayName,
    @required this.voidCallback
  });
  final hasEmail;
  final hasDisplayName;
  final VoidCallback voidCallback;
  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  final _firstNameTextController = TextEditingController();
  final _lastNameTextController = TextEditingController();
  final _emailTextController = TextEditingController();

  final _firstNameFocusNode = FocusNode();
  final _lastNameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();

  var isProcessing = false;

  bool wasValidationTried = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _scaffoldKey.currentState.removeCurrentSnackBar();
      _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text(
              "You're successfully signed in. Please enter required information.")));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Information",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 21.0),
        ),
        centerTitle: true,
        elevation: 0.0,
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
                  "Please enter your full name"
                  // " and email address, "
                  // "we will send important information on your given email address"
                  ,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0, color: Color(0xFF808B95)),
                ),
              ),
            ),
            SizedBox(height: 32.0),
            widget.hasDisplayName
                ? SizedBox.shrink()
                : Padding(
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
                        RequiredValidator(errorText: 'First Name is required'),
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
                        labelText: "First Name",
                        // prefixIcon: Icon(Icons.email),
                      ),
                    ),
                  ),
            widget.hasDisplayName
                ? SizedBox.shrink()
                : Padding(
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
                        labelText: "Last Name",
                        // prefixIcon: Icon(Icons.email),
                      ),
                    ),
                  ),
            widget.hasEmail
                ? SizedBox.shrink()
                : Padding(
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
                          _formKey.currentState.validate();
                        }
                      },
                      validator: MultiValidator([
                        RequiredValidator(errorText: 'This field is required'),
                        EmailValidator(
                            errorText: 'Enter a valid email address'),
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
                      "Process",
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
                            if (!widget.hasDisplayName) {
                              _firstNameFocusNode.unfocus();
                              _lastNameFocusNode.unfocus();
                            }
                            if (!widget.hasEmail) {
                              _emailFocusNode.unfocus();
                            }

                            setState(() {
                              isProcessing = true;
                              _userInfo();
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

  void _userInfo() async {
    try {
      if (!widget.hasDisplayName) {
        final name =
            '${_firstNameTextController.text.toUpperCase().substring(0, 1)}'
            '${_firstNameTextController.text.toLowerCase().substring(1)} '
            '${_lastNameTextController.text.toUpperCase().substring(0, 1)}'
            '${_lastNameTextController.text.toLowerCase().substring(1)}';

        await _auth.currentUser.updateProfile(displayName: "$name");
      }
      if (!widget.hasEmail) {
        await _auth.currentUser.updateEmail(_emailTextController.text);
      }
      widget.voidCallback.call();
    } catch (error) {
      _scaffoldKey.currentState.removeCurrentSnackBar();
      _scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text("$error")));
      setState(() {
        isProcessing = false;
      });
    }
  }

  @override
  void dispose() {
    _firstNameTextController.dispose();
    _lastNameTextController.dispose();
    _emailTextController.dispose();
    _firstNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }
}
