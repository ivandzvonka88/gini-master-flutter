import 'package:flutter/material.dart';
import 'package:gini/components/custom/custom_app_bar.dart';

class CartAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;
    return CustomAppBar(
      elevation: 0.0,
      title: Text(
        "Shopping Cart",
        style: TextStyle(
            color: Color(0xFF1F1E1E),
            fontSize: isPortrait ? size.width * 0.064 : size.height * 0.064,
            fontWeight: FontWeight.w600),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
