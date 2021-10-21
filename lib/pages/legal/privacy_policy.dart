import 'package:flutter/material.dart';
import 'package:gini/components/privacy/app_bar.dart';
import 'package:gini/components/privacy/text.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrivacyPolicyAppBar(),
      body: PrivacyPolicyText(),
    );
  }
}
