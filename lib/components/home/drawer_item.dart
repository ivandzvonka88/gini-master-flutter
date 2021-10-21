import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeDrawerItem extends StatelessWidget {
  HomeDrawerItem(
      {@required this.title,
      @required this.icon,
      this.isSelected = false,
      @required this.onTap});
  final String title;
  final String icon;
  final Function onTap;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;
    final theme = Theme.of(context);
    return Container(
      height: isPortrait ? size.height * 0.0591 : size.width * 0.0591,
      width: isPortrait ? size.width * 0.7866 : size.height * 0.7866,
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: isSelected
            ? Color.fromRGBO(125, 106, 244, 0.1)
            : Colors.transparent,
      ),
      child: InkWell(
        splashColor: Color.fromRGBO(125, 106, 244, 0.1),
        highlightColor: Color.fromRGBO(125, 106, 244, 0.1),
        focusColor: Color.fromRGBO(125, 106, 244, 0.1),
        borderRadius: BorderRadius.circular(50.0),
        onTap: onTap,
        child: Row(
          children: [
            Container(
                width: isPortrait ? size.width * 0.0693 : size.height * 0.0693),
            SvgPicture.asset(
              "assets/drawer/$icon.svg",
              height: isPortrait ? size.height * 0.0246 : size.width * 0.0246,
              color: isSelected ? theme.primaryColor : Color(0xFF989DA8),
            ),
            Container(
                width: isPortrait ? size.width * 0.048 : size.height * 0.048),
            Text(
              '$title',
              style: TextStyle(
                color: isSelected ? theme.primaryColor : Color(0xFF989DA8),
                fontSize:
                    isPortrait ? size.width * 0.0426 : size.height * 0.0426,
              ),
            )
          ],
        ),
      ),
    );
  }
}
