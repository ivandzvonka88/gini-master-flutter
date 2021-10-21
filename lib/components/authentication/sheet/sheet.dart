import 'package:flutter/material.dart';
import 'package:gini/components/authentication/login/login.dart';
import 'package:gini/components/authentication/register/register.dart';
import 'package:gini/components/authentication/sheet/tab_bar.dart';

class AuthSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      height: 617.0,
      margin: mediaQuery.padding,
      child: DefaultTabController(
          initialIndex: 1,
          length: 2,
          child: Column(children: [
            AuthSheetTabBar(),
            Expanded(
                child: TabBarView(
                    children: [AuthRegisterTabView(), AuthLoginTabView()]))
          ])),
    );
  }
}
