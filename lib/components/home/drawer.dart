import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gini/components/home/drawer_item.dart';
import 'package:gini/components/personal/profile_image.dart';
import 'package:url_launcher/url_launcher.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class MainDrawer extends StatelessWidget {
  MainDrawer({@required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = Size(mediaQuery.size.width,
        mediaQuery.size.height - (mediaQuery.size.height * 0.029556));
    final isPortrait = mediaQuery.orientation == Orientation.portrait;
    String emailOrPhone;
    if (_auth.currentUser.email != null) {
      emailOrPhone = _auth.currentUser.email;
    } else {
      emailOrPhone = _auth.currentUser.phoneNumber;
    }
    return Container(
      width: isPortrait ? size.width * 0.872 : size.height * 0.872,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
                height:
                    isPortrait ? size.height * 0.0677 : size.width * 0.0677),
            Container(
              height: isPortrait ? size.height * 0.3078 : size.width * 0.3078,
              child: Column(
                children: [
                  SizedBox(
                      height: isPortrait
                          ? size.height * 0.0110
                          : size.width * 0.0110),
                  ProfileImage(isEnabled: false),
                  SizedBox(
                    height:
                        isPortrait ? size.height * 0.0197 : size.width * 0.0197,
                  ),
                  Text(
                    "${_auth.currentUser.displayName}",
                    style: TextStyle(
                        color: Color(0xFF1F1E1E),
                        fontSize: isPortrait
                            ? size.width * 0.0426
                            : size.height * 0.0426,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                      height: isPortrait
                          ? size.height * 0.0098
                          : size.width * 0.0098),
                  Text(
                    "$emailOrPhone",
                    style: TextStyle(
                      color: Color(0xFF808B95),
                      fontSize: isPortrait
                          ? size.width * 0.0373
                          : size.height * 0.0373,
                    ),
                  )
                ],
              ),
            ),
            HomeDrawerItem(
              icon: "sms",
              title: "Assistant",
              onTap: () {
                Navigator.pop(context);
                pageController.jumpToPage(0);
              },
              isSelected: pageController.page.toInt() == 0,
            ),
            Container(
              height: isPortrait ? size.height * 0.0147 : size.width * 0.0147,
            ),
            HomeDrawerItem(
              icon: "cart",
              title: "Shopping Cart",
              onTap: () {
                Navigator.pop(context);
                pageController.jumpToPage(1);
              },
              isSelected: pageController.page.toInt() == 1,
            ),
            Container(
              height: isPortrait ? size.height * 0.0147 : size.width * 0.0147,
            ),
            HomeDrawerItem(
              icon: "wallet",
              title: "Wallet",
              onTap: () {
                Navigator.pop(context);
                pageController.jumpToPage(2);
              },
              isSelected: pageController.page.toInt() == 2,
            ),
            Container(
              height: isPortrait ? size.height * 0.0147 : size.width * 0.0147,
            ),
            HomeDrawerItem(
              icon: "profile",
              title: "Profile",
              onTap: () {
                Navigator.pop(context);
                pageController.jumpToPage(3);
              },
              isSelected: pageController.page.toInt() == 3,
            ),
            Container(
                height:
                    isPortrait ? size.height * 0.2155 : size.width * 0.2155),
            Divider(),
            HomeDrawerItem(
              icon: "contact",
              title: "Contact us",
              onTap: () async {
                const url = "tel:+13122883968";
                try {
                  await launch(url);
                } catch (error) {
                  print(error);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
