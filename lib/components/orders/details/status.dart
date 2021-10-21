import 'package:flutter/material.dart';

class DetailsOrderStatus extends StatelessWidget {
  DetailsOrderStatus({@required this.status});
  final String status;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Flexible(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Status",
          style: TextStyle(
              color: Color.fromRGBO(31, 30, 30, 1),
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              height: mediaQuery.textScaleFactor * 1.50),
        ),
        SizedBox(
          height: 4.0,
        ),
        Text(
          "$status",
          style: TextStyle(
              color: Color.fromRGBO(53, 164, 125, 1),
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              height: mediaQuery.textScaleFactor * 1.14),
        )
      ]),
    );
  }
}
