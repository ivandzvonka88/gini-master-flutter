import 'package:flutter/material.dart';
import 'package:gini/components/onboarding/one/content.dart';
import 'package:gini/components/onboarding/one/image.dart';
import 'package:gini/components/onboarding/one/title.dart';

class OnBoardingOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: OnBoardingOneImage()),
        OnBoardingOneTitle(),
        SizedBox(height: 8.0),
        OnBoardingOneContent()
      ],
    );
  }
}
