// import 'package:flutter/material.dart';
// import 'package:gini/components/assistant/app_bar.dart';
// import 'package:gini/components/cart/app_bar.dart';
// import 'package:gini/components/custom/custom_app_bar.dart';
// import 'package:gini/components/payment/wallet/app_bar.dart';
// import 'package:gini/components/profile/app_bar.dart';
//
// class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
//   HomeAppBar({@required this.pageController});
//   final PageController pageController;
//   @override
//   _HomeAppBarState createState() => _HomeAppBarState();
//
//   @override
//   Size get preferredSize => Size.fromHeight(kToolbarHeight);
// }
//
// class _HomeAppBarState extends State<HomeAppBar> {
//   var currentPage = 0;
//
//   @override
//   void initState() {
//     currentPage = widget.pageController.initialPage;
//     widget.pageController.addListener(() {
//       int page = widget.pageController.page.toInt();
//       if (currentPage != page) {
//         setState(() {
//           currentPage = page;
//         });
//       }
//     });
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var appBars = [
//       AssistantAppBar(pageController: widget.pageController),
//       CartAppBar(),
//       WalletAppBar(),
//       ProfileAppBar()
//     ];
//     return appBars[currentPage];
//   }
// }
