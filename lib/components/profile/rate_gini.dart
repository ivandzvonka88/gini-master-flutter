import 'package:app_review/app_review.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileRateGini extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 32.0,
              width: 32.0,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(232, 226, 60, 1),
                  borderRadius: BorderRadius.circular(6.0)),
              child: Align(
                  child: SvgPicture.asset(
                "assets/profile/rate.svg",
                height: 18.0,
              )),
            ),
            SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: Text(
                "Rate GINI",
                style: TextStyle(
                    color: Color.fromRGBO(66, 74, 82, 1),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SvgPicture.asset(
              "assets/profile/arrow_forward.svg",
              height: 12.0,
            )
          ],
        ),
      ),
      onTap: () async {
        try {
          await AppReview.requestReview;
        } catch (error) {
          print(error);
        }
      },
    );
  }
}
