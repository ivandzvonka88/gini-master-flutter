import 'package:flutter/material.dart';
import 'package:gini/components/onboarding/two/content.dart';
import 'package:gini/components/onboarding/two/image.dart';
import 'package:gini/components/onboarding/two/title.dart';

class OnBoardingTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: OnBoardingTwoImage()),
        OnBoardingTwoTitle(),
        SizedBox(height: 8.0),
        OnBoardingTwoContent()
      ],
    );
  }
}
