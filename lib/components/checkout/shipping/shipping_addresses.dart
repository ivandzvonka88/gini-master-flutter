import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gini/models/checkout/checkout.dart';
import 'package:gini/models/shipping/shipping.dart';
import 'package:gini/pages/shipping/shipping.dart';

class CheckoutShippingAddresses extends StatefulWidget {
  CheckoutShippingAddresses(
      {@required this.checkoutModel, @required this.docs});
  final CheckoutModel checkoutModel;
  final List<QueryDocumentSnapshot> docs;
  @override
  _CheckoutDeliveryMethodsState createState() =>
      _CheckoutDeliveryMethodsState();
}

class _CheckoutDeliveryMethodsState extends State<CheckoutShippingAddresses> {
  int currentValue;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Align(
          child: RaisedButton(
              child: Text("aDD NEW shipping (Dummy)"),
              onPressed: () async {
                await Navigator.push(context,
                    MaterialPageRoute(builder: (_) => ShippingFormPage()));
              }),
        ),
        widget.docs.length > 0
            ? ListView.separated(
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index) {
                  ShippingAddress shippingAddress =
                      ShippingAddress.fromJson(widget.docs[index].data());
                  return RadioListTile(
                      value: index,
                      title: Text("${shippingAddress.firstName} "
                          "${shippingAddress.lastName}\n "
                          "${shippingAddress.streetAddress} "
                          "${shippingAddress.city} "
                          "${shippingAddress.state}"),
                      groupValue: currentValue,
                      onChanged: (value) {
                        setState(() {
                          widget.checkoutModel.shippingAddress =
                              shippingAddress;
                          currentValue = value;
                        });
                      });
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: widget.docs.length)
            : Align(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 100.0),
                  child: Text("Empty"),
                ),
              ),
      ],
    );
  }
}
