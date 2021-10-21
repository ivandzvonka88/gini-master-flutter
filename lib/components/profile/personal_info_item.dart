import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gini/pages/personal/personal_information.dart';

class ProfilePersonalInfo extends StatelessWidget {
  ProfilePersonalInfo({@required this.refresh});
  final VoidCallback refresh;

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
                  color: Color.fromRGBO(125, 106, 244, 1),
                  borderRadius: BorderRadius.circular(6.0)),
              child: Align(
                  child: SvgPicture.asset("assets/profile/profile.svg",
                      height: 18.0)),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Text("Personal Information",
                  style: TextStyle(
                      color: Color.fromRGBO(66, 74, 82, 1),
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500)),
            ),
            SvgPicture.asset("assets/profile/arrow_forward.svg", height: 12.0)
          ],
        ),
      ),
      onTap: () async {
        final shouldRefresh = await Navigator.push(context,
            MaterialPageRoute(builder: (_) => PersonalInformationPage()));
        if (shouldRefresh != null) {
          refresh.call();
        }
      },
    );
  }
}
