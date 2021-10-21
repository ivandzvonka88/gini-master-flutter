import 'package:flutter/material.dart';
import 'package:gini/components/orders/details/about.dart';
import 'package:gini/components/orders/details/address.dart';
import 'package:gini/components/orders/details/app_bar.dart';
import 'package:gini/components/orders/details/payment_method.dart';
import 'package:gini/components/orders/details/payment_method_value.dart';
import 'package:gini/components/orders/details/products_list.dart';
import 'package:gini/components/orders/details/products_size.dart';
import 'package:gini/components/orders/details/shipping_address.dart';
import 'package:gini/components/orders/details/shipping_method_word.dart';
import 'package:gini/components/orders/details/shipping_price.dart';
import 'package:gini/components/orders/details/sub_total.dart';
import 'package:gini/components/orders/details/tax.dart';
import 'package:gini/components/orders/details/total.dart';
import 'package:gini/models/order/order_model.dart' as orderModel;

class OrderDetailsPage extends StatelessWidget {
  OrderDetailsPage({@required this.order, @required this.orderNo});
  final orderModel.Order order;
  final int orderNo;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: OrderDetailsAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
            left: mediaQuery.padding.left,
            right: mediaQuery.padding.right,
            bottom: mediaQuery.padding.bottom),
        child: Column(
          children: [
            SizedBox(height: 24.0),
            OrderDetailsAbout(order: order, orderNo: orderNo),
            SizedBox(height: 24.0),
            Container(height: 1.0, color: Color.fromRGBO(226, 234, 241, 1)),
            SizedBox(height: 16.0),
            DetailsOrderProductSizeWord(),
            SizedBox(height: 16.0),
            Container(height: 1.0, color: Color.fromRGBO(226, 234, 241, 1)),
            DetailsOrderProductList(order: order),
            Container(height: 1.0, color: Color.fromRGBO(226, 234, 241, 1)),
            SizedBox(height: 16.0),
            DetailsOrderShippingMethodWord(),
            SizedBox(height: 16.0),
            Container(height: 1.0, color: Color.fromRGBO(226, 234, 241, 1)),
            SizedBox(height: 24.0),
            DetailsOrderShippingAddressWord(),
            SizedBox(height: 8.0),
            DetailsOrderAddress(order: order),
            SizedBox(height: 24.0),
            Container(height: 1.0, color: Color.fromRGBO(226, 234, 241, 1)),
            SizedBox(height: 16.0),
            DetailsOrderPaymentMethodWord(),
            SizedBox(height: 16.0),
            Container(height: 1.0, color: Color.fromRGBO(226, 234, 241, 1)),
            SizedBox(height: 24.0),
            DetailsOrderPaymentMethodValue(order: order),
            SizedBox(height: 24.0),
            Container(height: 1.0, color: Color.fromRGBO(226, 234, 241, 1)),
            SizedBox(height: 24.0),
            DetailsOrderSubTotal(order: order),
            SizedBox(height: 16.0),
            DetailsOrderTax(order: order),
            SizedBox(height: 16.0),
            DetailsOrderShipping(order: order),
            SizedBox(height: 16.0),
            DetailsOrderTotal(order: order),
            SizedBox(height: 50.0 + mediaQuery.padding.bottom)
          ],
        ),
      ),
    );
  }
}
