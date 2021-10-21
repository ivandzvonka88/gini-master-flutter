import 'package:flutter/material.dart';
import 'package:gini/app/config/constants.dart';
import 'package:gini/pages/home/home.dart';
import 'package:gini/pages/orders/orders.dart';

class CheckoutOrderSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          padding: mediaQuery.padding,
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 120.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage("assets/checkout/glossy.png"),
                    ),
                  ),
                ),
                SizedBox(height: 32.0),
                Text("Order Confirmation",
                    style: TextStyle(
                        color: Color.fromRGBO(31, 30, 30, 1),
                        fontSize: 21.0,
                        fontWeight: FontWeight.w600)),
                SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                      "We received your order and we'll "
                      "let you know when we ship it out.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(66, 74, 82, 1),
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                          height: mediaQuery.textScaleFactor * 1.50)),
                ),
                SizedBox(height: 50.0),
                Container(
                  width: 245.0,
                  height: 64.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      border: Border.all(
                        color: Color.fromRGBO(125, 106, 244, 1),
                      )),
                  child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(50.0),
                        child: Center(
                          child: Text(
                            "My Orders",
                            style: TextStyle(
                                color: Color.fromRGBO(125, 106, 244, 1),
                                fontWeight: FontWeight.w700,
                                fontSize: 18.0,
                                height: mediaQuery.textScaleFactor * 0.89),
                          ),
                        ),
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      OrdersPage()),
                              (Route<dynamic> route) => route.isFirst);
                        },
                      )),
                ),
                SizedBox(height: 16.0),
                Container(
                  width: 245.0,
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
                            "Done",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 18.0,
                                height: mediaQuery.textScaleFactor * 0.89),
                          ),
                        ),
                        onTap: () async {
                          await Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      HomePage(initialPage: 0)),
                              (Route<dynamic> route) => false);
                        },
                      )),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
