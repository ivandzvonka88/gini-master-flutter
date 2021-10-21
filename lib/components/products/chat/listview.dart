import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gini/components/products/chat/error.dart';
import 'package:gini/components/products/chat/item/see_more.dart';
import 'package:gini/components/products/chat/item/share.dart';
import 'package:gini/components/products/chat/product_item.dart';
import 'package:gini/components/products/chat/snapping_list_view.dart';
import 'package:gini/models/product/product.dart';

class InChatProductsListView extends StatelessWidget {
  InChatProductsListView({@required this.docs, @required this.onItemChanged});
  final List<QueryDocumentSnapshot> docs;
  final Function(int) onItemChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SnappingListView.builder(
        itemExtent: 192.0,
        padding: EdgeInsets.only(left: 72.0),
        scrollDirection: Axis.horizontal,
        itemCount: docs.length,
        onItemChanged: onItemChanged,
        itemBuilder: (_, index) {
          Product product;
          try {
            product = Product.fromJson(
                docs[index].data(), docs[index].reference.path);
          } catch (error) {
            return InChatProductsError();
          }
          return InChatProductsListItem(
            product: product,
          );
        },
      ),
    );

    /// TODO: CAN BE IMPROVED BY ADDING SEE MORE
    final int maxLength = docs.length.clamp(0, 4);
    return SizedBox(
      height: 300,
      child: SnappingListView.builder(
        itemExtent: 192.0,
        padding: EdgeInsets.only(left: 72.0),
        scrollDirection: Axis.horizontal,
        itemCount: maxLength + 1,
        onItemChanged: onItemChanged,
        itemBuilder: (_, index) {
          if (index == maxLength) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InChatProductItemShare(),
                SizedBox(height: 32.0),
                InChatProductItemSeeMore(length: 5)
              ],
            );
          }
          Product product;
          try {
            product = Product.fromJson(
                docs[index].data(), docs[index].reference.path);
          } catch (error) {
            return InChatProductsError();
          }
          return InChatProductsListItem(
            product: product,
          );
        },
      ),
    );
  }
}
