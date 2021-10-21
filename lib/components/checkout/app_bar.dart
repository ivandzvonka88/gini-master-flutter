import 'package:flutter/material.dart';

class CheckoutAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      title: Text(
        "Checkout",
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24.0,
            color: Color.fromRGBO(31, 30, 30, 1)),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
