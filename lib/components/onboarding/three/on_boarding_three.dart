import 'package:flutter/material.dart';
import 'package:gini/components/onboarding/three/content.dart';
import 'package:gini/components/onboarding/three/image.dart';
import 'package:gini/components/onboarding/three/title.dart';

class OnBoardingThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: OnBoardingThreeImage()),
        OnBoardingThreeTitle(),
        SizedBox(height: 8.0),
        OnBoardingThreeContent()
      ],
    );
  }
}
