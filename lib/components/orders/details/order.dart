import 'package:flutter/material.dart';

class DetailsOrderNumber extends StatelessWidget {
  DetailsOrderNumber({@required this.order});
  final int order;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Flexible(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Order",
          style: TextStyle(
              color: Color.fromRGBO(31, 30, 30, 1),
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              height: mediaQuery.textScaleFactor * 1.31),
        ),
        SizedBox(
          height: 4.0,
        ),
        Text(
          "#${order.toString().padLeft(6, "0")}",
          style: TextStyle(
              color: Color.fromRGBO(128, 139, 149, 1),
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              height: mediaQuery.textScaleFactor * 1.50),
        )
      ]),
    );
  }
}
