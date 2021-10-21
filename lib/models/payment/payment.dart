// To parse this JSON data, do
//
//     final payment = paymentFromJson(jsonString);

import 'dart:convert';

Payment paymentFromJson(String str) => Payment.fromJson(json.decode(str));

String paymentToJson(Payment data) => json.encode(data.toJson());

class Payment {
  Payment({
    this.livemode,
    this.shipping,
    this.amountCapturable,
    this.object,
    this.cancellationReason,
    this.currency,
    this.nextAction,
    this.amountReceived,
    this.id,
    this.statementDescriptorSuffix,
    this.paymentMethodTypes,
    this.created,
    this.charges,
    this.paymentMethodOptions,
    this.description,
    this.metadata,
    this.transferGroup,
    this.confirmationMethod,
    this.clientSecret,
    this.statementDescriptor,
    this.receiptEmail,
    this.canceledAt,
    this.paymentMethod,
    this.source,
    this.application,
    this.status,
    this.transferData,
    this.onBehalfOf,
    this.captureMethod,
    this.review,
    this.lastPaymentError,
    this.invoice,
    this.applicationFeeAmount,
    this.setupFutureUsage,
    this.customer,
    this.amount,
  });

  bool livemode;
  dynamic shipping;
  int amountCapturable;
  String object;
  dynamic cancellationReason;
  String currency;
  dynamic nextAction;
  int amountReceived;
  String id;
  dynamic statementDescriptorSuffix;
  List<String> paymentMethodTypes;
  int created;
  Charges charges;
  PaymentMethodOptions paymentMethodOptions;
  dynamic description;
  Metadata metadata;
  dynamic transferGroup;
  String confirmationMethod;
  String clientSecret;
  dynamic statementDescriptor;
  dynamic receiptEmail;
  dynamic canceledAt;
  String paymentMethod;
  dynamic source;
  dynamic application;
  String status;
  dynamic transferData;
  dynamic onBehalfOf;
  String captureMethod;
  dynamic review;
  dynamic lastPaymentError;
  dynamic invoice;
  dynamic applicationFeeAmount;
  dynamic setupFutureUsage;
  String customer;
  int amount;

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        livemode: json["livemode"],
        shipping: json["shipping"],
        amountCapturable: json["amount_capturable"],
        object: json["object"],
        cancellationReason: json["cancellation_reason"],
        currency: json["currency"],
        nextAction: json["next_action"],
        amountReceived: json["amount_received"],
        id: json["id"],
        statementDescriptorSuffix: json["statement_descriptor_suffix"],
        paymentMethodTypes:
            List<String>.from(json["payment_method_types"].map((x) => x)),
        created: json["created"],
        charges: Charges.fromJson(json["charges"]),
        paymentMethodOptions:
            PaymentMethodOptions.fromJson(json["payment_method_options"]),
        description: json["description"],
        metadata: Metadata.fromJson(json["metadata"]),
        transferGroup: json["transfer_group"],
        confirmationMethod: json["confirmation_method"],
        clientSecret: json["client_secret"],
        statementDescriptor: json["statement_descriptor"],
        receiptEmail: json["receipt_email"],
        canceledAt: json["canceled_at"],
        paymentMethod: json["payment_method"],
        source: json["source"],
        application: json["application"],
        status: json["status"],
        transferData: json["transfer_data"],
        onBehalfOf: json["on_behalf_of"],
        captureMethod: json["capture_method"],
        review: json["review"],
        lastPaymentError: json["last_payment_error"],
        invoice: json["invoice"],
        applicationFeeAmount: json["application_fee_amount"],
        setupFutureUsage: json["setup_future_usage"],
        customer: json["customer"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "livemode": livemode,
        "shipping": shipping,
        "amount_capturable": amountCapturable,
        "object": object,
        "cancellation_reason": cancellationReason,
        "currency": currency,
        "next_action": nextAction,
        "amount_received": amountReceived,
        "id": id,
        "statement_descriptor_suffix": statementDescriptorSuffix,
        "payment_method_types":
            List<dynamic>.from(paymentMethodTypes.map((x) => x)),
        "created": created,
        "charges": charges.toJson(),
        "payment_method_options": paymentMethodOptions.toJson(),
        "description": description,
        "metadata": metadata.toJson(),
        "transfer_group": transferGroup,
        "confirmation_method": confirmationMethod,
        "client_secret": clientSecret,
        "statement_descriptor": statementDescriptor,
        "receipt_email": receiptEmail,
        "canceled_at": canceledAt,
        "payment_method": paymentMethod,
        "source": source,
        "application": application,
        "status": status,
        "transfer_data": transferData,
        "on_behalf_of": onBehalfOf,
        "capture_method": captureMethod,
        "review": review,
        "last_payment_error": lastPaymentError,
        "invoice": invoice,
        "application_fee_amount": applicationFeeAmount,
        "setup_future_usage": setupFutureUsage,
        "customer": customer,
        "amount": amount,
      };
}

class Datum {
  Datum({
    this.livemode,
    this.shipping,
    this.object,
    this.id,
    this.refunded,
    this.currency,
    this.receiptUrl,
    this.refunds,
    this.statementDescriptorSuffix,
    this.created,
    this.disputed,
    this.description,
    this.failureMessage,
    this.metadata,
    this.destination,
    this.calculatedStatementDescriptor,
    this.transferGroup,
    this.dispute,
    this.receiptEmail,
    this.receiptNumber,
    this.paymentIntent,
    this.captured,
    this.balanceTransaction,
    this.amountRefunded,
    this.fraudDetails,
    this.paymentMethodDetails,
    this.application,
    this.paymentMethod,
    this.paid,
    this.source,
    this.statementDescriptor,
    this.status,
    this.transferData,
    this.order,
    this.onBehalfOf,
    this.review,
    this.amountCaptured,
    this.outcome,
    this.billingDetails,
    this.invoice,
    this.customer,
    this.applicationFeeAmount,
    this.applicationFee,
    this.sourceTransfer,
    this.failureCode,
    this.amount,
  });

  bool livemode;
  dynamic shipping;
  String object;
  String id;
  bool refunded;
  String currency;
  String receiptUrl;
  Charges refunds;
  dynamic statementDescriptorSuffix;
  int created;
  bool disputed;
  dynamic description;
  dynamic failureMessage;
  Metadata metadata;
  dynamic destination;
  String calculatedStatementDescriptor;
  dynamic transferGroup;
  dynamic dispute;
  dynamic receiptEmail;
  dynamic receiptNumber;
  String paymentIntent;
  bool captured;
  String balanceTransaction;
  int amountRefunded;
  Metadata fraudDetails;
  PaymentMethodDetails paymentMethodDetails;
  dynamic application;
  String paymentMethod;
  bool paid;
  dynamic source;
  dynamic statementDescriptor;
  String status;
  dynamic transferData;
  dynamic order;
  dynamic onBehalfOf;
  dynamic review;
  int amountCaptured;
  Outcome outcome;
  BillingDetails billingDetails;
  dynamic invoice;
  String customer;
  dynamic applicationFeeAmount;
  dynamic applicationFee;
  dynamic sourceTransfer;
  dynamic failureCode;
  int amount;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        livemode: json["livemode"],
        shipping: json["shipping"],
        object: json["object"],
        id: json["id"],
        refunded: json["refunded"],
        currency: json["currency"],
        receiptUrl: json["receipt_url"],
        refunds: Charges.fromJson(json["refunds"]),
        statementDescriptorSuffix: json["statement_descriptor_suffix"],
        created: json["created"],
        disputed: json["disputed"],
        description: json["description"],
        failureMessage: json["failure_message"],
        metadata: Metadata.fromJson(json["metadata"]),
        destination: json["destination"],
        calculatedStatementDescriptor: json["calculated_statement_descriptor"],
        transferGroup: json["transfer_group"],
        dispute: json["dispute"],
        receiptEmail: json["receipt_email"],
        receiptNumber: json["receipt_number"],
        paymentIntent: json["payment_intent"],
        captured: json["captured"],
        balanceTransaction: json["balance_transaction"],
        amountRefunded: json["amount_refunded"],
        fraudDetails: Metadata.fromJson(json["fraud_details"]),
        paymentMethodDetails:
            PaymentMethodDetails.fromJson(json["payment_method_details"]),
        application: json["application"],
        paymentMethod: json["payment_method"],
        paid: json["paid"],
        source: json["source"],
        statementDescriptor: json["statement_descriptor"],
        status: json["status"],
        transferData: json["transfer_data"],
        order: json["order"],
        onBehalfOf: json["on_behalf_of"],
        review: json["review"],
        amountCaptured: json["amount_captured"],
        outcome: Outcome.fromJson(json["outcome"]),
        billingDetails: BillingDetails.fromJson(json["billing_details"]),
        invoice: json["invoice"],
        customer: json["customer"],
        applicationFeeAmount: json["application_fee_amount"],
        applicationFee: json["application_fee"],
        sourceTransfer: json["source_transfer"],
        failureCode: json["failure_code"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "livemode": livemode,
        "shipping": shipping,
        "object": object,
        "id": id,
        "refunded": refunded,
        "currency": currency,
        "receipt_url": receiptUrl,
        "refunds": refunds.toJson(),
        "statement_descriptor_suffix": statementDescriptorSuffix,
        "created": created,
        "disputed": disputed,
        "description": description,
        "failure_message": failureMessage,
        "metadata": metadata.toJson(),
        "destination": destination,
        "calculated_statement_descriptor": calculatedStatementDescriptor,
        "transfer_group": transferGroup,
        "dispute": dispute,
        "receipt_email": receiptEmail,
        "receipt_number": receiptNumber,
        "payment_intent": paymentIntent,
        "captured": captured,
        "balance_transaction": balanceTransaction,
        "amount_refunded": amountRefunded,
        "fraud_details": fraudDetails.toJson(),
        "payment_method_details": paymentMethodDetails.toJson(),
        "application": application,
        "payment_method": paymentMethod,
        "paid": paid,
        "source": source,
        "statement_descriptor": statementDescriptor,
        "status": status,
        "transfer_data": transferData,
        "order": order,
        "on_behalf_of": onBehalfOf,
        "review": review,
        "amount_captured": amountCaptured,
        "outcome": outcome.toJson(),
        "billing_details": billingDetails.toJson(),
        "invoice": invoice,
        "customer": customer,
        "application_fee_amount": applicationFeeAmount,
        "application_fee": applicationFee,
        "source_transfer": sourceTransfer,
        "failure_code": failureCode,
        "amount": amount,
      };
}

class Charges {
  Charges({
    this.hasMore,
    this.data,
    this.object,
    this.totalCount,
    this.url,
  });

  bool hasMore;
  List<Datum> data;
  String object;
  int totalCount;
  String url;

  factory Charges.fromJson(Map<String, dynamic> json) => Charges(
        hasMore: json["has_more"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        object: json["object"],
        totalCount: json["total_count"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "has_more": hasMore,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "object": object,
        "total_count": totalCount,
        "url": url,
      };
}

class BillingDetails {
  BillingDetails({
    this.email,
    this.phone,
    this.name,
    this.address,
  });

  dynamic email;
  dynamic phone;
  String name;
  Address address;

  factory BillingDetails.fromJson(Map<String, dynamic> json) => BillingDetails(
        email: json["email"],
        phone: json["phone"],
        name: json["name"],
        address: Address.fromJson(json["address"]),
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "phone": phone,
        "name": name,
        "address": address.toJson(),
      };
}

class Address {
  Address({
    this.state,
    this.country,
    this.line2,
    this.city,
    this.line1,
    this.postalCode,
  });

  String state;
  String country;
  String line2;
  String city;
  String line1;
  String postalCode;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        state: json["state"],
        country: json["country"],
        line2: json["line2"],
        city: json["city"],
        line1: json["line1"],
        postalCode: json["postal_code"],
      );

  Map<String, dynamic> toJson() => {
        "state": state,
        "country": country,
        "line2": line2,
        "city": city,
        "line1": line1,
        "postal_code": postalCode,
      };
}

class Metadata {
  Metadata();

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata();

  Map<String, dynamic> toJson() => {};
}

class Outcome {
  Outcome({
    this.type,
    this.networkStatus,
    this.reason,
    this.riskScore,
    this.riskLevel,
    this.sellerMessage,
  });

  String type;
  String networkStatus;
  dynamic reason;
  int riskScore;
  String riskLevel;
  String sellerMessage;

  factory Outcome.fromJson(Map<String, dynamic> json) => Outcome(
        type: json["type"],
        networkStatus: json["network_status"],
        reason: json["reason"],
        riskScore: json["risk_score"],
        riskLevel: json["risk_level"],
        sellerMessage: json["seller_message"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "network_status": networkStatus,
        "reason": reason,
        "risk_score": riskScore,
        "risk_level": riskLevel,
        "seller_message": sellerMessage,
      };
}

class PaymentMethodDetails {
  PaymentMethodDetails({
    this.type,
    this.card,
  });

  String type;
  PaymentMethodDetailsCard card;

  factory PaymentMethodDetails.fromJson(Map<String, dynamic> json) =>
      PaymentMethodDetails(
        type: json["type"],
        card: PaymentMethodDetailsCard.fromJson(json["card"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "card": card.toJson(),
      };
}

class PaymentMethodDetailsCard {
  PaymentMethodDetailsCard({
    this.fingerprint,
    this.last4,
    this.funding,
    this.wallet,
    this.checks,
    this.brand,
    this.expMonth,
    this.expYear,
    this.installments,
    this.network,
    this.country,
    this.threeDSecure,
  });

  String fingerprint;
  String last4;
  String funding;
  dynamic wallet;
  Checks checks;
  String brand;
  int expMonth;
  int expYear;
  dynamic installments;
  String network;
  String country;
  dynamic threeDSecure;

  factory PaymentMethodDetailsCard.fromJson(Map<String, dynamic> json) =>
      PaymentMethodDetailsCard(
        fingerprint: json["fingerprint"],
        last4: json["last4"],
        funding: json["funding"],
        wallet: json["wallet"],
        checks: Checks.fromJson(json["checks"]),
        brand: json["brand"],
        expMonth: json["exp_month"],
        expYear: json["exp_year"],
        installments: json["installments"],
        network: json["network"],
        country: json["country"],
        threeDSecure: json["three_d_secure"],
      );

  Map<String, dynamic> toJson() => {
        "fingerprint": fingerprint,
        "last4": last4,
        "funding": funding,
        "wallet": wallet,
        "checks": checks.toJson(),
        "brand": brand,
        "exp_month": expMonth,
        "exp_year": expYear,
        "installments": installments,
        "network": network,
        "country": country,
        "three_d_secure": threeDSecure,
      };
}

class Checks {
  Checks({
    this.addressPostalCodeCheck,
    this.cvcCheck,
    this.addressLine1Check,
  });

  String addressPostalCodeCheck;
  dynamic cvcCheck;
  String addressLine1Check;

  factory Checks.fromJson(Map<String, dynamic> json) => Checks(
        addressPostalCodeCheck: json["address_postal_code_check"],
        cvcCheck: json["cvc_check"],
        addressLine1Check: json["address_line1_check"],
      );

  Map<String, dynamic> toJson() => {
        "address_postal_code_check": addressPostalCodeCheck,
        "cvc_check": cvcCheck,
        "address_line1_check": addressLine1Check,
      };
}

class PaymentMethodOptions {
  PaymentMethodOptions({
    this.card,
  });

  PaymentMethodOptionsCard card;

  factory PaymentMethodOptions.fromJson(Map<String, dynamic> json) =>
      PaymentMethodOptions(
        card: PaymentMethodOptionsCard.fromJson(json["card"]),
      );

  Map<String, dynamic> toJson() => {
        "card": card.toJson(),
      };
}

class PaymentMethodOptionsCard {
  PaymentMethodOptionsCard({
    this.installments,
    this.network,
    this.requestThreeDSecure,
  });

  dynamic installments;
  dynamic network;
  String requestThreeDSecure;

  factory PaymentMethodOptionsCard.fromJson(Map<String, dynamic> json) =>
      PaymentMethodOptionsCard(
        installments: json["installments"],
        network: json["network"],
        requestThreeDSecure: json["request_three_d_secure"],
      );

  Map<String, dynamic> toJson() => {
        "installments": installments,
        "network": network,
        "request_three_d_secure": requestThreeDSecure,
      };
}
