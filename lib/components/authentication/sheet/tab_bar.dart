import 'package:flutter/material.dart';

class AuthSheetTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return TabBar(
        indicatorColor: Color.fromRGBO(125, 106, 244, 1),
        labelColor: Color(0xFF1F1E1E),
        unselectedLabelColor: Color.fromRGBO(226, 234, 241, 1),
        tabs: [
          Tab(
              child: Text("Create account",
                  style: TextStyle(
                      color: Color.fromRGBO(31, 30, 30, 1),
                      fontSize: 16.0,
                      height: mediaQuery.textScaleFactor * 1.50,
                      fontWeight: FontWeight.w500))),
          Tab(
              child: Text("Sign in",
                  style: TextStyle(
                      color: Color.fromRGBO(31, 30, 30, 1),
                      fontSize: 16.0,
                      height: mediaQuery.textScaleFactor * 1.50,
                      fontWeight: FontWeight.w500)))
        ]);
    return Stack(children: [
      Positioned.fill(
          child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(color: Color(0xFFE2EAF1), width: 2.0))))),
      TabBar(
          indicatorColor: Color.fromRGBO(125, 106, 244, 1),
          labelColor: Color(0xFF1F1E1E),
          unselectedLabelColor: Color.fromRGBO(226, 234, 241, 1),
          tabs: [
            Tab(
                child: Text("Create account",
                    style: TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.w500))),
            Tab(
                child: Text("Sign in",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500)))
          ])
    ]);
  }
}
