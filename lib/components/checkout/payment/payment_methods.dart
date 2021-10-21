import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gini/components/checkout/payment/add_method.dart';
import 'package:gini/components/checkout/payment/add_wallet.dart';
import 'package:gini/components/checkout/payment/checkout_payment_method_word.dart';
import 'package:gini/components/checkout/payment/wallet.dart';
import 'package:gini/models/checkout/checkout.dart';
import 'package:gini/models/checkout/payment.dart';
import 'package:gini/models/payment/wallet.dart';
import 'package:stripe_payment/stripe_payment.dart';
import 'package:gini/components/checkout/payment/item.dart';

class CheckoutPaymentMethods extends StatefulWidget {
  CheckoutPaymentMethods(
      {@required this.checkoutModel,
      @required this.finalCheckoutPaymentMethods});
  final CheckoutModel checkoutModel;
  final FinalCheckoutPaymentMethods finalCheckoutPaymentMethods;
  @override
  _CheckoutDeliveryMethodsState createState() =>
      _CheckoutDeliveryMethodsState();
}

class _CheckoutDeliveryMethodsState extends State<CheckoutPaymentMethods> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    List<QueryDocumentSnapshot> docs;
    Wallet wallet;
    try {
      docs = widget.finalCheckoutPaymentMethods.paymentMethodSnapshot.docs;
      wallet = Wallet.fromJson(
          widget.finalCheckoutPaymentMethods.walletSnapshot.data());
    } catch (error) {
      print(error);
    }
    return ListView(
      padding: mediaQuery.padding,
      children: [
        SizedBox(height: 24.0),
        CheckoutPaymentMethodWord(),
        SizedBox(height: 24.0),
        Container(height: 1.0, color: Color.fromRGBO(226, 234, 241, 1)),
        CheckoutPaymentWalletMethod(
            isSelected: widget.checkoutModel.wallet != null,
            onTap: () {
              setState(() {
                widget.checkoutModel.wallet = wallet;
                widget.checkoutModel.paymentMethodModel = null;
                widget.checkoutModel.selectedPaymentMethod = -1;
              });
            },
            walletSnapshot: widget.finalCheckoutPaymentMethods.walletSnapshot),
        Container(height: 1.0, color: Color.fromRGBO(226, 234, 241, 1)),
        docs != null
            ? ListView.separated(
                primary: false,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  PaymentMethod paymentMethod =
                      PaymentMethod.fromJson(docs[index].data());
                  return CheckoutPaymentMethodItem(
                    isSelected:
                        widget.checkoutModel.selectedPaymentMethod == index,
                    paymentMethod: paymentMethod,
                    onTap: () {
                      setState(() {
                        widget.checkoutModel.paymentMethodModel = paymentMethod;
                        widget.checkoutModel.selectedPaymentMethod = index;
                        widget.checkoutModel.wallet = null;
                      });
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.0),
                      height: 1.0,
                      color: Color.fromRGBO(226, 234, 241, 1));
                },
                itemCount: docs.length)
            : SizedBox.shrink(),
        Container(height: 1.0, color: Color.fromRGBO(226, 234, 241, 1)),
        CheckoutAddPaymentMethod(checkoutModel: widget.checkoutModel),
        CheckoutAddWalletBalance(
          checkoutModel: widget.checkoutModel,
          voidCallback: () {
            setState(() {});
          },
        ),
        Container(height: 1.0, color: Color.fromRGBO(226, 234, 241, 1)),
      ],
    );
  }
}
