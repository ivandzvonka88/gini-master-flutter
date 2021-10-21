import 'package:flutter/material.dart';
import 'package:gini/components/home/drawer.dart';
import 'package:gini/components/personal/profile_image.dart';
import 'package:gini/components/profile/app_bar.dart';
import 'package:gini/components/profile/gini_logo.dart';
import 'package:gini/components/profile/my_order.dart';
import 'package:gini/components/profile/name.dart';
import 'package:gini/components/profile/personal_info_item.dart';
import 'package:gini/components/profile/privacy_policy.dart';
import 'package:gini/components/profile/rate_gini.dart';
import 'package:gini/components/profile/sign_out.dart';
import 'package:gini/components/profile/social.dart';
import 'package:gini/components/profile/term_condition.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({@required this.pageController});
  final PageController pageController;
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: ProfileAppBar(),
      drawer: MainDrawer(pageController: widget.pageController),
      body: SingleChildScrollView(
        padding: mediaQuery.padding,
        child: Column(
          children: [
            SizedBox(height: 44.0),
            ProfileImage(isEnabled: false),
            SizedBox(height: 16.0),
            ProfileName(),
            SizedBox(height: 47.0),
            Container(height: 1.0, color: Color.fromRGBO(226, 234, 241, 1)),
            ProfilePersonalInfo(refresh: () => setState(() {})),
            Container(height: 1.0, color: Color.fromRGBO(226, 234, 241, 1)),
            ProfileMyOrder(),
            Container(height: 1.0, color: Color.fromRGBO(226, 234, 241, 1)),
            ProfileSocialAccounts(),
            Container(height: 1.0, color: Color.fromRGBO(226, 234, 241, 1)),
            ProfileRateGini(),
            Container(height: 1.0, color: Color.fromRGBO(226, 234, 241, 1)),
            ProfileTermCondition(),
            Container(height: 1.0, color: Color.fromRGBO(226, 234, 241, 1)),
            ProfilePrivacyPolicy(),
            Container(height: 1.0, color: Color.fromRGBO(226, 234, 241, 1)),
            SizedBox(height: 63.0),
            ProfileSignOut(),
            SizedBox(height: 40.0),
            ProfileGiniLogo()
          ],
        ),
      ),
    );
  }
}
