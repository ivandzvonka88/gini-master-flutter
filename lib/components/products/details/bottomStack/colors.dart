import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gini/models/product/product.dart';
import 'package:gini/models/product/user_preference.dart';

class DetailsProductColors extends StatefulWidget {
  DetailsProductColors(
      {@required this.colors, @required this.productPreference});
  final List<ProductColors> colors;
  final ProductPreference productPreference;
  @override
  _ProductSizesState createState() => _ProductSizesState();
}

class _ProductSizesState extends State<DetailsProductColors> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
          border: Border.all(
            width: 1.0,
            color: Color.fromRGBO(219, 226, 233, 1),
          ),
          borderRadius: BorderRadius.circular(50.0)),
      child: DropdownButton(
          isExpanded: true,
          hint: DropdownMenuItem(
            child: Text("Colors",
                style: TextStyle(
                    color: Color.fromRGBO(66, 74, 82, 1),
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600)),
            value: null,
          ),
          icon: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/ui/arrow_down.svg",
                    semanticsLabel: "More Colors",
                    color: Color.fromRGBO(31, 30, 30, 1),
                    width: 12.0),
              ],
            ),
          ),
          underline: SizedBox.shrink(),
          value: widget.productPreference.preferredColor,
          items: widget.colors != null && widget.colors.isNotEmpty
              ? List.generate(widget.colors.length, (index) {
                  return DropdownMenuItem(
                      child: Text(widget.colors[index].color,
                          style: TextStyle(
                              color: Color.fromRGBO(66, 74, 82, 1),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600)),
                      value: index);
                })
              : [],
          onChanged: (value) {
            setState(() {
              widget.productPreference.preferredColor = value;
            });
          }),
    );
  }
}
