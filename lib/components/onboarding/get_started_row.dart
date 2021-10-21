import 'package:flutter/material.dart';
import 'package:gini/components/onboarding/get_started.dart';
import 'package:gini/components/onboarding/indicator.dart';

class OnBoardingGetStartedRow extends StatefulWidget {
  OnBoardingGetStartedRow({@required this.pageController});
  final PageController pageController;

  @override
  _OnBoardingGetStartedRowState createState() =>
      _OnBoardingGetStartedRowState();
}

class _OnBoardingGetStartedRowState extends State<OnBoardingGetStartedRow> {
  var currentPage = 0;
  var shouldShow = false;
  @override
  void initState() {
    currentPage = widget.pageController.initialPage;
    widget.pageController.addListener(() {
      if (mounted) {
        try {
          setState(() {
            currentPage = widget.pageController.page.toInt();
            if (currentPage == 2) {
              shouldShow = true;
            }
          });
        } catch (error) {
          print(error);
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OnBoardingIndicator(currentPage: currentPage),
        OnBoardingGetStarted()
      ],
    );
  }

  @override
  void dispose() {
    widget.pageController.dispose();
    super.dispose();
  }
}
