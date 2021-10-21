import 'package:flutter/material.dart';
import 'package:gini/components/authentication/register/continue_with_apple.dart';
import 'package:gini/components/authentication/register/continue_with_facebook.dart';
import 'package:gini/components/authentication/register/continue_with_google_button.dart';
import 'package:gini/components/authentication/register/continue_with_phone.dart';
import 'package:gini/components/authentication/register/description.dart';
import 'package:gini/components/authentication/register/register_with_email_button.dart';
import 'package:gini/components/authentication/register/terms_policy.dart';
import 'package:gini/components/authentication/register/welcome_word.dart';

class AuthRegisterTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 32.0),
          AuthRegisterTabBarWelcomeWord(),
          SizedBox(height: 8.0),
          AuthRegisterTabBarDescription(),
          SizedBox(height: 48.0),
          AuthRegisterTabBarEmailSignInButton(),
          SizedBox(height: 16.0),
          AuthRegisterTabBarPhoneSignInButton(),
          SizedBox(height: 16.0),
          AuthRegisterTabBarAppleButton(isLink: false),
          SizedBox(height: 16.0),
          AuthRegisterTabBarFacebookButton(),
          SizedBox(height: 16.0),
          AuthRegisterTabBarGoogleButton(isLink: false),
          SizedBox(height: 40.0),
          AuthRegisterTabBarPolicyTermsDescription(),
          SizedBox(height: 37.0)
        ],
      ),
    );
  }
}
