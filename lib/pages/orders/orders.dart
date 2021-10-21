import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gini/components/orders/orders/app_bar.dart';
import 'package:gini/components/orders/orders/orders_item.dart';
import 'package:gini/models/order/order_model.dart';

FirebaseFirestore _firestore = FirebaseFirestore.instance;
FirebaseAuth _auth = FirebaseAuth.instance;

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: OrdersAppBar(),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore
            .collection("usersData")
            .doc(_auth.currentUser.uid)
            .collection("orders")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              if (snapshot.data.docs.isNotEmpty) {
                var docs = snapshot.data.docs;
                return ListView.builder(
                    padding: EdgeInsets.only(
                        left: mediaQuery.padding.left,
                        right: mediaQuery.padding.right,
                        bottom: mediaQuery.padding.bottom),
                    itemBuilder: (context, index) {
                      // print(json.encode(docs[1].data()));
                      Order order = Order.fromJson(docs[index].data());
                      return OrderItem(index: index, order: order);
                    },
                    itemCount: docs.length);
              } else {
                return Center(
                  child: Text("Empty orders"),
                );
              }
            } else {
              return Center(
                child: Text("Something went wrong"),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
