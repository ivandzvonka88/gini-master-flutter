import 'package:flutter/material.dart';

class PrivacyPolicyAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      title: Text(
        "Privacy Policy",
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w600,
          color: Color.fromRGBO(31, 30, 30, 1),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
