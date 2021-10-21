import 'package:flutter/material.dart';

class DetailsOrderDiscount extends StatelessWidget {
  DetailsOrderDiscount({@required this.price});
  final String price;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Discount",
            style: TextStyle(
                color: Color.fromRGBO(128, 139, 149, 1),
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                height: mediaQuery.textScaleFactor * 1.50),
          ),
          Text(
            "$price",
            style: TextStyle(
              color: Color.fromRGBO(66, 74, 82, 1),
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              height: mediaQuery.textScaleFactor * 1.50,
            ),
          ),
        ],
      ),
    );
  }
}
