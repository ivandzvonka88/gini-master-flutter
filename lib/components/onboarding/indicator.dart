import 'package:flutter/material.dart';

class OnBoardingIndicator extends StatelessWidget {
  OnBoardingIndicator({@required this.currentPage});
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 24.0,
          height: 4.0,
          decoration: BoxDecoration(
            color: currentPage == 0
                ? Color.fromRGBO(125, 106, 244, 1)
                : Color.fromRGBO(226, 226, 226, 1),
          ),
        ),
        SizedBox(width: 8.0),
        Container(
          width: 24.0,
          height: 4.0,
          decoration: BoxDecoration(
            color: currentPage == 1
                ? Color.fromRGBO(125, 106, 244, 1)
                : Color.fromRGBO(226, 226, 226, 1),
          ),
        ),
        SizedBox(width: 8.0),
        Container(
          width: 24.0,
          height: 4.0,
          decoration: BoxDecoration(
            color: currentPage == 2
                ? Color.fromRGBO(125, 106, 244, 1)
                : Color.fromRGBO(226, 226, 226, 1),
          ),
        ),
      ],
    );
  }
}
