import 'package:flutter/material.dart';

class DetailsProductTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Graphic Contrast Hooded Jacket Long Sleeve",
          style: TextStyle(
              color: Color.fromRGBO(66, 74, 82, 1),
              fontSize: 21.0,
              height: mediaQuery.textScaleFactor * 1.33,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
