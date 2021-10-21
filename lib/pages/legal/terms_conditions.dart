import 'package:flutter/material.dart';
import 'package:gini/components/terms/app_bar.dart';
import 'package:gini/components/terms/text.dart';

class TermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TermsAppBar(),
      body: TermsConditionText(),
    );
  }
}
