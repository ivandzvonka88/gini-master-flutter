import 'package:flutter/material.dart';
import 'package:gini/pages/assistant/assistant.dart';
import 'package:gini/pages/cart/cart.dart';
import 'package:gini/pages/profile/profile.dart';
import 'package:gini/pages/wallet/wallet/wallet.dart';

class HomePage extends StatefulWidget {
  HomePage({this.initialPage = 1});
  final int initialPage;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _pageController;
  @override
  void initState() {
    _pageController = PageController(initialPage: widget.initialPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
        controller: _pageController,
        children: [
          AssistantPage(pageController: _pageController),
          CartPage(pageController: _pageController),
          WalletPage(pageController: _pageController),
          ProfilePage(pageController: _pageController)
        ],
        physics: NeverScrollableScrollPhysics());
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
