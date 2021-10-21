import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gini/components/products/chat/indicator.dart';
import 'package:gini/components/products/chat/listview.dart';
import 'package:gini/components/products/chat/progress.dart';
import 'package:gini/components/products/chat/unavailable.dart';

FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

class InChatProducts extends StatelessWidget {
  InChatProducts({@required this.collectionReference});
  final String collectionReference;
  final _indicatorKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firebaseFirestore
          .collection(collectionReference)
          .orderBy('priority')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasError) {
            return SizedBox.shrink();
          } else if (snapshot.hasData && snapshot.data.docs.isNotEmpty) {
            activeIndex = 0;
            return Column(
              children: [
                SizedBox(height: 24.0),
                InChatProductsListView(
                  docs: snapshot.data.docs,
                  onItemChanged: (int) {
                    activeIndex = int;
                    _indicatorKey.currentState.setState(() {});
                  },
                ),
                SizedBox(height: 24.0),
                InChatProductsIndicator(
                  length: snapshot.data.docs.length.clamp(0, 4),
                  key: _indicatorKey,
                )
              ],
            );
          } else {
            return InChatProductsUnavailable();
          }
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}

int activeIndex = 0;
