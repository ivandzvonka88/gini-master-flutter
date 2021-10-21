import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gini/models/payment/wallet.dart';

class CheckoutPaymentWalletMethod extends StatelessWidget {
  CheckoutPaymentWalletMethod(
      {@required this.isSelected,
      @required this.onTap,
      @required this.walletSnapshot});
  final bool isSelected;
  final Function onTap;
  final DocumentSnapshot walletSnapshot;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    try {
      Wallet wallet = Wallet.fromJson(walletSnapshot.data());
      double amount = wallet.amount / 100.0;
      return InkWell(
        child: Container(
          height: 72.0,
          child: Center(
            child: Row(
              children: [
                SizedBox(width: 16.0),
                Container(
                    width: 32.0,
                    height: 22.0,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(122, 110, 249, 1),
                        borderRadius: BorderRadius.circular(4.0)),
                    child: Align(
                      child: SvgPicture.asset("assets/checkout/wallet.svg",
                          color: Colors.white, width: 12.0),
                    )),
                SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Wallet",
                        style: TextStyle(
                            color: Color.fromRGBO(83, 91, 98, 1),
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                            height: mediaQuery.textScaleFactor * 1.07),
                      ),
                      Text(
                        "Available Balance \$${amount.toStringAsFixed(2)}",
                        style: TextStyle(
                            color: Color.fromRGBO(152, 157, 168, 1),
                            fontSize: 14.0,
                            height: mediaQuery.textScaleFactor * 1.14),
                      ),
                    ],
                  ),
                ),
                isSelected
                    ? SvgPicture.asset("assets/checkout/check_mark.svg",
                        height: 20.0)
                    : SizedBox(width: 20.0),
                SizedBox(width: 16.0),
              ],
            ),
          ),
        ),
        onTap: onTap,
      );
    } catch (error) {
      print(error);
      return SizedBox.shrink();
    }
  }
}
