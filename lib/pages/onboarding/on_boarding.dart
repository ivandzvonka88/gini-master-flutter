import 'package:flutter/material.dart';
import 'package:gini/components/onboarding/get_started_row.dart';
import 'package:gini/components/onboarding/gini_icon.dart';
import 'package:gini/components/onboarding/one/on_boarding_one.dart';
import 'package:gini/components/onboarding/three/on_boarding_three.dart';
import 'package:gini/components/onboarding/two/on_boarding_two.dart';

class OnBoardingPage extends StatelessWidget {
  final _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(elevation: 0.0, toolbarHeight: 0.0),
      body: Padding(
        padding: EdgeInsets.only(
                left: mediaQuery.padding.left, right: mediaQuery.padding.right)
            .add(EdgeInsets.symmetric(horizontal: 16.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 24.0),
            GiniIconColorFul(),
            Expanded(
                child: PageView(controller: _pageController, children: [
              OnBoardingOne(),
              OnBoardingTwo(),
              OnBoardingThree()
            ])),
            SizedBox(height: 43.0),
            OnBoardingGetStartedRow(pageController: _pageController),
            SizedBox(height: 35.0)
          ],
        ),
      ),
    );
  }
}
