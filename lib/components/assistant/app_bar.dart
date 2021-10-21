import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gini/components/assistant/network_status.dart';
import 'package:gini/models/cart/cart.dart';

FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
FirebaseAuth _auth = FirebaseAuth.instance;

class AssistantAppBar extends StatelessWidget implements PreferredSizeWidget {
  AssistantAppBar({@required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;
    return AppBar(
      elevation: 1.0,
      shadowColor: Color(0xFFE2EAF1),
      titleSpacing: 0.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: isPortrait ? size.width * 0.085333 : size.height * 0.085333,
            height: isPortrait ? size.width * 0.085333 : size.height * 0.085333,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage("assets/chatbot/angelina.png"),
              ),
            ),
            child: Align(
              alignment: Alignment.bottomRight,
              child: NetworkStatus(),
            ),
          ),
          SizedBox(
            width: size.width * 0.042666,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Angelina",
                style: TextStyle(
                    fontSize:
                        isPortrait ? size.width * 0.048 : size.height * 0.048,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1F1E1E)),
              ),
              Text(
                "Ready to help",
                style: TextStyle(
                    fontSize: isPortrait
                        ? size.width * 0.034666
                        : size.height * 0.034666,
                    color: Color(0xFF727C85)),
              ),
            ],
          )
        ],
      ),
      actions: [
        IconButton(
            icon: StreamBuilder<QuerySnapshot>(
                stream: _firebaseFirestore
                    .collection("usersData")
                    .doc(_auth.currentUser.uid)
                    .collection("cart")
                    .snapshots(),
                builder: (context, snapshot) {
                  int length = 0;
                  if (snapshot.connectionState == ConnectionState.active &&
                      snapshot.hasData &&
                      snapshot.data.docs.isNotEmpty) {
                    try {
                      snapshot.data.docs.forEach((element) {
                        CartProduct cart = CartProduct.fromJson(element.data());
                        length = cart.preferredQuantity + length;
                      });
                    } catch (error) {
                      print(error);
                    }
                  }
                  return Stack(
                    children: [
                      SvgPicture.asset(
                        "assets/ui/cart_two.svg",
                        height: 20.0,
                        color: Color.fromRGBO(31, 30, 30, 1),
                      ),
                      length > 0
                          ? Align(
                              child: Container(
                                alignment: Alignment.center,
                                width: 10.0,
                                height: 10.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.0)),
                                child: AutoSizeText(
                                  "$length",
                                  style: TextStyle(
                                      color: Color.fromRGBO(31, 30, 30, 1)),
                                  maxLines: 1,
                                  minFontSize: 1,
                                ),
                              ),
                              alignment: Alignment.topRight,
                            )
                          : SizedBox.shrink()
                    ],
                    alignment: Alignment.center,
                  );
                }),
            onPressed: () async {
              pageController.jumpToPage(1);
            }),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
