import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:gini/models/promotion/promotion.dart';

FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
FirebaseAuth _auth = FirebaseAuth.instance;

class PromoCode extends StatefulWidget {
  PromoCode({@required this.sheetContext});
  final BuildContext sheetContext;
  @override
  _PromoCodeState createState() => _PromoCodeState();
}

class _PromoCodeState extends State<PromoCode> {
  final _formKey = GlobalKey<FormState>();
  List<QueryDocumentSnapshot> docs = [];
  final _promoEditorController = TextEditingController();
  bool showPromoError = false;
  String errorMessage = "Your entered promo code is invalid";

  @override
  void initState() {
    _firebaseFirestore.collection("promotions").snapshots().listen((event) {
      docs = event.docs;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    return Container(
      padding: mediaQuery.padding.add(mediaQuery.viewInsets),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  controller: _promoEditorController,
                  autofocus: true,
                  onChanged: (value) {
                    if (showPromoError) {
                      setState(() {
                        showPromoError = false;
                        errorMessage = "Your entered promo code is invalid";
                      });
                    }
                  },
                  validator: MultiValidator([
                    RequiredValidator(errorText: "A promo code is required")
                  ]),
                  decoration: showPromoError
                      ? InputDecoration(
                          labelText: "Promo code",
                          errorText: errorMessage,
                          isDense: true,
                          isCollapsed: true,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            borderSide: BorderSide(color: Color(0xFFDBE2E9)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            borderSide: BorderSide(color: theme.primaryColor),
                          ),
                        )
                      : InputDecoration(
                          labelText: "Promo code",
                          isDense: true,
                          isCollapsed: true,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            borderSide: BorderSide(color: Color(0xFFDBE2E9)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            borderSide: BorderSide(color: theme.primaryColor),
                          ),
                        ),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(right: 16.0, top: 24.0, bottom: 24.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(50.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Color.fromRGBO(125, 106, 244, 1)),
                    borderRadius: BorderRadius.circular(50)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 28.0),
                  child: Text(
                    "Apply",
                    style: TextStyle(
                        color: Color.fromRGBO(125, 106, 244, 1),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              onTap: () async {
                if (_formKey.currentState.validate()) {
                  if (docs != null) {
                    Promotion promotion;
                    docs.forEach((element) {
                      Promotion promo = Promotion.fromJson(element.data());
                      if (promo.code == _promoEditorController.text) {
                        promotion = promo;
                      }
                    });

                    if (promotion != null) {
                      await _firebaseFirestore
                          .collection("usersData")
                          .doc(_auth.currentUser.uid)
                          .collection("usedPromotions")
                          .where('code', isEqualTo: promotion.code)
                          .get()
                          .then((snapshot) {
                        if (snapshot.docs.isEmpty) {
                          Navigator.pop(widget.sheetContext, promotion);
                        } else {
                          setState(() {
                            errorMessage = "You already used that promo code!";
                            showPromoError = true;
                          });
                        }
                      }).catchError((onError) {
                        setState(() {
                          errorMessage = onError.code;
                          showPromoError = true;
                        });
                      });
                    } else {
                      setState(() {
                        errorMessage = "Your entered promo code is invalid";
                        showPromoError = true;
                      });
                    }
                  } else {
                      setState(() {
                        errorMessage = "Try again later";
                        showPromoError = true;
                      });

                  }
                }
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _promoEditorController.dispose();
    super.dispose();
  }
}
