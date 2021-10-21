// import 'package:flutter/material.dart';
// import 'package:gini/Models/checkout/checkout_form.dart';
// import 'package:gini/components/checkout/whitelabel/card_number.dart';
// import 'package:gini/components/checkout/whitelabel/city.dart';
// import 'package:gini/components/checkout/whitelabel/cvv.dart';
// import 'package:gini/components/checkout/whitelabel/expiry.dart';
// import 'package:gini/components/checkout/whitelabel/name_on_card.dart';
// import 'package:gini/components/checkout/whitelabel/paypal_button.dart';
// import 'package:gini/components/checkout/whitelabel/place_order_button.dart';
// import 'package:gini/components/checkout/whitelabel/state.dart';
// import 'package:gini/components/checkout/whitelabel/street_address.dart';
// import 'package:gini/components/checkout/whitelabel/sub_total.dart';
// import 'package:gini/components/checkout/whitelabel/total.dart';
// import 'package:gini/components/checkout/whitelabel/zip.dart';
// import 'package:gini/components/custom/custom_app_bar.dart';
//
// class CheckoutPageWhiteLabel extends StatefulWidget {
//   @override
//   _CheckoutPageWhiteLabelState createState() => _CheckoutPageWhiteLabelState();
// }
//
// class _CheckoutPageWhiteLabelState extends State<CheckoutPageWhiteLabel> {
//   final _formKey = GlobalKey<FormState>();
//   final model = CheckoutFormModel();
//   final _scaffoldKey = GlobalKey<ScaffoldState>();
//   @override
//   Widget build(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context);
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: CustomAppBar(
//         elevation: 0.0,
//         title: Text(
//           "Shipping Details",
//           style: TextStyle(
//               color: Color.fromRGBO(31, 30, 30, 1),
//               fontSize: 24.0,
//               fontWeight: FontWeight.w600),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.only(
//             left: mediaQuery.padding.left,
//             right: mediaQuery.padding.right,
//             bottom: mediaQuery.padding.bottom),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                     vertical: 12.0, horizontal: 16.0),
//                 child: NameOnCard(
//                   model: model,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                     vertical: 12.0, horizontal: 16.0),
//                 child: CardNumber(
//                   model: model,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                     vertical: 12.0, horizontal: 16.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Flexible(
//                         flex: 54,
//                         child: CardExpiry(
//                           model: model,
//                         )),
//                     Spacer(
//                       flex: 6,
//                     ),
//                     Flexible(
//                         flex: 40,
//                         child: CardCvv(
//                           model: model,
//                         ))
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                     vertical: 12.0, horizontal: 16.0),
//                 child: CheckoutStreetAddress(
//                   model: model,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                     vertical: 12.0, horizontal: 16.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Flexible(
//                         flex: 53,
//                         child: CheckoutCity(
//                           model: model,
//                         )),
//                     Flexible(
//                         flex: 20,
//                         child: CheckoutState(
//                           model: model,
//                         )),
//                     Flexible(
//                         flex: 27,
//                         child: CheckoutZip(
//                           model: model,
//                         ))
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                     vertical: 12.0, horizontal: 16.0),
//                 child: PayPalButton(),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                     vertical: 12.0, horizontal: 16.0),
//                 child: CheckoutSubTotal(),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(
//                     top: 4.0, left: 16.0, right: 16.0, bottom: 36.0),
//                 child: CheckoutTotal(),
//               ),
//               PlaceOrderButton(
//                 form: _formKey,
//                 model: model,
//                 scaffoldKey: _scaffoldKey,
//               ),
//               SizedBox(
//                 height: 50.0,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
