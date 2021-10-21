import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsProductClose extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 60.0,
      left: 16.0,
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.0)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(60.0),
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: SvgPicture.asset(
                "assets/ui/clear.svg",
                semanticsLabel: "Close",
                color: Color.fromRGBO(31, 30, 30, 1),
                height: 12.0,
                width: 12.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
