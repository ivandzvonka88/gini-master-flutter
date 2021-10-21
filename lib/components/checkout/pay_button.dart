import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gini/app/config/constants.dart';
import 'package:gini/models/cart/final_cart_model.dart';
import 'package:gini/models/checkout/checkout.dart';
import 'package:gini/models/payment/payment.dart';
import 'package:gini/models/payment/wallet.dart';
import 'package:gini/models/shipping/shipping.dart';
import 'package:gini/pages/checkout/success.dart';
import 'package:gini/pages/wallet/wallet/wallet.dart';
import 'package:stripe_payment/stripe_payment.dart';

FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
FirebaseAuth _auth = FirebaseAuth.instance;

class CheckoutPayButton extends StatefulWidget {
  CheckoutPayButton(
      {@required this.checkoutModel,
      @required this.subTotal,
      @required this.scaffoldKey,
      @required this.finalCartList});
  final CheckoutModel checkoutModel;
  final double subTotal;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final List<FinalCart> finalCartList;

  @override
  _CheckoutPayButtonState createState() => _CheckoutPayButtonState();
}

class _CheckoutPayButtonState extends State<CheckoutPayButton> {
  var isProcessing = false;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final checkoutModel = widget.checkoutModel;
    final bool isPaymentFilled = checkoutModel.paymentMethodModel != null ||
        checkoutModel.wallet != null;
    final bool isDeliveryTypeFilled = checkoutModel.deliveryMethod != null;
    final bool isShippingFilled = checkoutModel.shippingAddress != null ||
        checkoutModel.deliveryMethod == "In-Store Pick Up";
    final isDataFilled =
        isPaymentFilled && isDeliveryTypeFilled && isShippingFilled;
    final double salesTax = widget.subTotal / 8.0;
    checkoutModel.total =
        widget.subTotal + salesTax + checkoutModel.deliveryCharges;
    final double total = isDataFilled ? checkoutModel.total : widget.subTotal;
    final int cents = (total * 100).toInt();

    return Align(
      child: isProcessing
          ? CircularProgressIndicator()
          : Container(
              alignment: Alignment.center,
              height: 64.0,
              width: 250.0,
              decoration: BoxDecoration(
                  gradient: isDataFilled
                      ? linearGradient
                      : LinearGradient(colors: [
                          Color.fromRGBO(224, 223, 232, 1),
                          Color.fromRGBO(224, 223, 232, 1)
                        ]),
                  borderRadius: BorderRadius.circular(50.0)),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Center(
                    child: Text(
                      "Pay \$${total.toStringAsFixed(2)}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                          height: mediaQuery.textScaleFactor * 0.89),
                    ),
                  ),
                  onTap: isDataFilled
                      ? () async {
                          List<Map> products = [];
                          List<Map> cartProducts = [];
                          widget.finalCartList.forEach((element) {
                            products.add(element.product.toJson());
                            cartProducts.add(element.cartProduct.toJson());
                          });
                          try {
                            setState(() {
                              isProcessing = true;
                            });

                            if (checkoutModel.wallet != null) {
                              DocumentSnapshot documentSnapshot =
                                  await _firebaseFirestore
                                      .collection("usersData")
                                      .doc(_auth.currentUser.uid)
                                      .collection("wallet")
                                      .doc("wallet")
                                      .get();
                              Wallet wallet =
                                  Wallet.fromJson(documentSnapshot.data());
                              if (wallet.amount >= cents) {
                                await _firebaseFirestore
                                    .collection("usersData")
                                    .doc(_auth.currentUser.uid)
                                    .collection("wallet")
                                    .doc("wallet")
                                    .set({
                                  "amount": FieldValue.increment(-cents),
                                  "amountUpdate": FieldValue.serverTimestamp()
                                }, SetOptions(merge: true));
                                _addOrder(
                                    paymentType: "Wallet",
                                    checkoutModel: checkoutModel,
                                    products: products,
                                    cartProducts: cartProducts);
                              } else {
                                setState(() {
                                  isProcessing = false;
                                });
                                showDialog(
                                    context: context,
                                    builder: (context) => CupertinoAlertDialog(
                                          title: Text(
                                            "Low balance",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    31, 30, 30, 1),
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18.0,
                                                height:
                                                    mediaQuery.textScaleFactor *
                                                        1.33),
                                          ),
                                          content: Text(
                                            "Please add balance to your wallet account to buy this service. "
                                            "Available balance is \$${checkoutModel.wallet.amount / 100.0}",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    83, 91, 98, 1),
                                                fontSize: 14.0,
                                                height:
                                                    mediaQuery.textScaleFactor *
                                                        1.50),
                                          ),
                                          actions: [
                                            CupertinoDialogAction(
                                                child: Text(
                                                  "Cancel",
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          227, 24, 54, 1),
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: mediaQuery
                                                              .textScaleFactor *
                                                          0.87),
                                                ),
                                                isDestructiveAction: true,
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                }),
                                            CupertinoDialogAction(
                                                child: Text(
                                                  "Go to wallet",
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          125, 106, 244, 1),
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: mediaQuery
                                                              .textScaleFactor *
                                                          0.87),
                                                ),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              WalletPage(),
                                                          fullscreenDialog:
                                                              true));
                                                }),
                                          ],
                                        ));
                              }
                            } else {
                              DocumentReference documentReference =
                                  await _firebaseFirestore
                                      .collection("usersData")
                                      .doc(_auth.currentUser.uid)
                                      .collection("payments")
                                      .add({
                                "amount": cents,
                                "currency": "usd",
                                "payment_method":
                                    checkoutModel.paymentMethodModel.id
                              });
                              documentReference
                                  .snapshots()
                                  .listen((event) async {
                                try {
                                  Payment payment =
                                      Payment.fromJson(event.data());
                                  if (payment.status == "succeeded" &&
                                      payment.charges.data.first.paid) {
                                    _addOrder(
                                        paymentType: "card",
                                        checkoutModel: checkoutModel,
                                        products: products,
                                        cartProducts: cartProducts);
                                  } else {
                                    String error = event.data()['error'];
                                    if (error != null) {
                                      throw (error);
                                    }
                                  }
                                } catch (error) {
                                  String errorMessage = event.data()['error'];
                                  if (errorMessage != null) {
                                    widget.scaffoldKey.currentState
                                        .removeCurrentSnackBar();
                                    widget.scaffoldKey.currentState
                                        .showSnackBar(SnackBar(
                                            content: Text("$errorMessage")));
                                  }
                                }
                              });
                            }
                          } catch (error) {
                            setState(() {
                              isProcessing = false;
                            });
                            widget.scaffoldKey.currentState
                                .removeCurrentSnackBar();
                            widget.scaffoldKey.currentState.showSnackBar(
                                SnackBar(content: Text("$error")));
                            print(error);
                          }
                        }
                      : null,
                ),
              ),
            ),
    );
  }

  // Future<bool> chargeUser(
  //     DocumentReference documentReference) async {
  //   documentReference.snapshots().listen((event) async {
  //     if (event.data().isNotEmpty) {
  //       try {
  //         Payment payment = Payment.fromJson(event.data());
  //         if (payment.status == "succeeded" &&
  //             payment.charges.data.first.paid) {
  //           return true;
  //         } else {
  //           String error = event.data()['error'];
  //           if (error != null) {
  //             throw (error);
  //           }
  //         }
  //       } catch (error) {
  //         print(error);
  //         String errorMessage = event.data()['error'];
  //         if (errorMessage != null) {
  //           widget.scaffoldKey.currentState.removeCurrentSnackBar();
  //           widget.scaffoldKey.currentState
  //               .showSnackBar(SnackBar(content: Text("$errorMessage")));
  //           return false;
  //         }
  //       }
  //     }
  //   });
  // }

  void _addOrder(
      {@required String paymentType,
      @required CheckoutModel checkoutModel,
      @required List<Map> products,
      @required List<Map> cartProducts}) async {
    try {
      await _firebaseFirestore
          .collection("usersData")
          .doc(_auth.currentUser.uid)
          .collection("orders")
          .add({
        'timeStamp': FieldValue.serverTimestamp(),
        'status': "Waiting for pick up",
        'paymentType': paymentType,
        'paymentStatus': "yo",

        ///needs to be change
        'paymentMethod': checkoutModel.paymentMethodModel != null
            ? checkoutModel.paymentMethodModel.toJson()
            : PaymentMethod().toJson(),
        'deliveryMethod': checkoutModel.deliveryMethod,
        'shippingAddress': checkoutModel.shippingAddress != null
            ? checkoutModel.shippingAddress.toJson()
            : ShippingAddress().toJson(),
        'paid': {
          'delivery': checkoutModel.deliveryCharges,
          'subTotal': widget.subTotal,
          'total': checkoutModel.total,
        },
        'products': products,
        'carProduct': cartProducts
      });

      widget.finalCartList.forEach((element) async {
        await element.cartProduct.documentReference.delete();
      });
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => CheckoutOrderSuccessPage()),
          (Route<dynamic> route) => route.isFirst);
    } catch (error) {
      setState(() {
        isProcessing = false;
      });
    }
  }
}
