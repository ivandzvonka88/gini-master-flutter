import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gini/pages/legal/terms_conditions.dart';

class ProfileTermCondition extends StatelessWidget {
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
                  color: Color.fromRGBO(205, 203, 220, 1),
                  borderRadius: BorderRadius.circular(6.0)),
              child: Align(
                  child: SvgPicture.asset(
                "assets/profile/policy.svg",
                height: 18.0,
              )),
            ),
            SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: Text(
                "Terms of Service",
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
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => TermsAndConditionsPage()));
      },
    );
  }
}
