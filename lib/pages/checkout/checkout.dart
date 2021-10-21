import 'package:flutter/material.dart';
import 'package:gini/components/checkout/app_bar.dart';
import 'package:gini/components/checkout/balance.dart';
import 'package:gini/components/checkout/pay_button.dart';
import 'package:gini/components/checkout/payment_method_selection.dart';
import 'package:gini/components/checkout/payment_word.dart';
import 'package:gini/components/checkout/products_list_view.dart';
import 'package:gini/components/checkout/products_word.dart';
import 'package:gini/components/checkout/shipping_address_selection.dart';
import 'package:gini/components/checkout/shipping_method_selection.dart';
import 'package:gini/components/checkout/shipping_word.dart';
import 'package:gini/components/checkout/sub_total.dart';
import 'package:gini/models/cart/final_cart_model.dart';
import 'package:gini/models/checkout/checkout.dart';

class CheckoutPage extends StatefulWidget {
  CheckoutPage({@required this.finalCartList, @required this.subTotal});
  final List<FinalCart> finalCartList;
  final double subTotal;

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final CheckoutModel checkoutModel = CheckoutModel();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: CheckoutAppBar(),
      body: SingleChildScrollView(
        padding: mediaQuery.padding,
        child: Column(
          children: [
            CheckoutProductsWord(),
            SizedBox(height: 24.0),
            Container(height: 1.0, color: Color.fromRGBO(226, 234, 241, 1)),
            CheckoutProductsListView(finalCartList: widget.finalCartList),
            Container(height: 1.0, color: Color.fromRGBO(226, 234, 241, 1)),
            SizedBox(height: 24.0),
            CheckoutShippingWord(),
            SizedBox(height: 24.0),
            Container(height: 1.0, color: Color.fromRGBO(226, 234, 241, 1)),
            CheckoutShippingMethodSelectionRow(
              checkoutModel: checkoutModel,
              refresh: () => setState(() {}),
            ),
            Container(height: 1.0, color: Color.fromRGBO(226, 234, 241, 1)),
            Container(height: 1.0, color: Color.fromRGBO(226, 234, 241, 1)),
            CheckoutShippingSelectionRow(
              checkoutModel: checkoutModel,
              scaffoldKey: _scaffoldKey,
              refresh: () => setState(() {}),
            ),
            Container(height: 1.0, color: Color.fromRGBO(226, 234, 241, 1)),
            SizedBox(height: 24.0),
            CheckoutPaymentWord(),
            SizedBox(height: 24.0),
            Container(height: 1.0, color: Color.fromRGBO(226, 234, 241, 1)),
            SizedBox(height: 20.0),
            CheckoutPaymentSelectionRow(
              checkoutModel: checkoutModel,
              refresh: () => setState(() {}),
            ),
            SizedBox(height: 20.0),
            Container(height: 1.0, color: Color.fromRGBO(226, 234, 241, 1)),
            SizedBox(height: 24.0),
            CheckoutSubTotal(subTotal: widget.subTotal),
            CheckoutBalance(
                checkoutModel: checkoutModel, subTotal: widget.subTotal),
            SizedBox(height: 64.0),
            CheckoutPayButton(
              checkoutModel: checkoutModel,
              subTotal: widget.subTotal,
              finalCartList: widget.finalCartList,
              scaffoldKey: _scaffoldKey,
            ),
            SizedBox(height: mediaQuery.padding.bottom + 50.0),
          ],
        ),
      ),
    );
  }
}
