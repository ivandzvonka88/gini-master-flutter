import 'package:flutter/material.dart';
import 'package:gini/components/authentication/login/description.dart';
import 'package:gini/components/authentication/login/sign_in_with_apple.dart';
import 'package:gini/components/authentication/login/sign_in_with_facebook.dart';
import 'package:gini/components/authentication/login/sign_in_with_google_button.dart';
import 'package:gini/components/authentication/login/sign_in_with_phone.dart';
import 'package:gini/components/authentication/login/sign_with_email_button.dart';
import 'package:gini/components/authentication/login/terms_policy.dart';
import 'package:gini/components/authentication/login/welcome_word.dart';

class AuthLoginTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 32.0),
          AuthLoginTabBarWelcomeWord(),
          SizedBox(height: 8.0),
          AuthLoginTabBarDescription(),
          SizedBox(height: 48.0),
          AuthLoginTabBarEmailSignInButton(),
          SizedBox(height: 16.0),
          AuthLoginTabBarPhoneSignInButton(),
          SizedBox(height: 16.0),
          AuthLoginTabBarAppleButton(isLink: false),
          SizedBox(height: 16.0),
          AuthLoginTabBarFacebookButton(),
          SizedBox(height: 16.0),
          AuthLoginTabBarGoogleButton(isLink: false),
          SizedBox(height: 40.0),
          AuthLoginTabBarPolicyTermsDescription(),
          SizedBox(height: 37.0)
        ],
      ),
    );
  }
}
