import 'package:gini/models/payment/wallet.dart';
import 'package:gini/models/shipping/shipping.dart';
import 'package:stripe_payment/stripe_payment.dart';

class CheckoutModel {
  String deliveryMethod;
  ShippingAddress shippingAddress;
  PaymentMethod paymentMethodModel;
  double total;
  double deliveryCharges;
  int selectedPaymentMethod;
  Wallet wallet;
  CheckoutModel(
      {this.deliveryMethod,
      this.shippingAddress,
      this.paymentMethodModel,
      this.total,
      this.deliveryCharges = 0.00,
      this.selectedPaymentMethod});
}
