import 'package:flutter/material.dart';
import 'package:gini/app/config/constants.dart';
import 'package:gini/pages/home/home.dart';

class CartEmptyCart extends StatelessWidget {
  CartEmptyCart({@required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 96.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage("assets/cart/cart_empty.png"),
                  ),
                ),
              ),
              SizedBox(height: 32.0),
              Text("Shopping Cart is Empty",
                  style: TextStyle(
                      color: Color.fromRGBO(31, 30, 30, 1),
                      fontSize: 21.0,
                      fontWeight: FontWeight.w600)),
              SizedBox(height: 8.0),
              Text("Talk to GINI to order something new!",
                  style: TextStyle(
                      color: Color.fromRGBO(66, 74, 82, 1),
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                      height: mediaQuery.textScaleFactor * 1.50)),
              SizedBox(height: 40.0),
              Container(
                width: 250.0,
                height: 64.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    gradient: linearGradient,
                    borderRadius: BorderRadius.circular(50.0)),
                child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Center(
                        child: Text(
                          "Talk to GINI",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 18.0,
                              height: mediaQuery.textScaleFactor * 0.89),
                        ),
                      ),
                      onTap: () async {
                        try {
                          pageController.jumpToPage(0);
                        } catch (error) {
                          await Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => HomePage(initialPage: 0)),
                              (Route<dynamic> route) => false);
                        }
                      },
                    )),
              ),
            ],
          ),
        ),
      );
    });
  }
}
