import 'package:cloud_firestore/cloud_firestore.dart';

class Order {
  List<CarProduct> carProduct;
  String status;
  List<Products> products;
  ShippingAddress shippingAddress;
  String paymentType;
  dynamic paymentStatus;
  PaymentMethod paymentMethod;
  String deliveryMethod;
  Paid paid;
  Timestamp timeStamp;

  Order(
      {this.carProduct,
      this.status,
      this.products,
      this.shippingAddress,
      this.paymentType,
      this.paymentStatus,
      this.paymentMethod,
      this.deliveryMethod,
      this.paid,
      this.timeStamp});

  Order.fromJson(Map<String, dynamic> json) {
    if (json['carProduct'] != null) {
      carProduct = new List<CarProduct>();
      json['carProduct'].forEach((v) {
        carProduct.add(new CarProduct.fromJson(v));
      });
    }
    status = json['status'];
    timeStamp = json['timeStamp'];
    if (json['products'] != null) {
      products = new List<Products>();
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
    shippingAddress = json['shippingAddress'] != null
        ? new ShippingAddress.fromJson(json['shippingAddress'])
        : null;
    paymentType = json['paymentType'];
    paymentStatus = json['paymentStatus'];
    paymentMethod = json['paymentMethod'] != null
        ? new PaymentMethod.fromJson(json['paymentMethod'])
        : null;
    deliveryMethod = json['deliveryMethod'];
    paid = json['paid'] != null ? new Paid.fromJson(json['paid']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.carProduct != null) {
      data['carProduct'] = this.carProduct.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['timeStamp'] = this.timeStamp;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    if (this.shippingAddress != null) {
      data['shippingAddress'] = this.shippingAddress.toJson();
    }
    data['paymentType'] = this.paymentType;
    data['paymentStatus'] = this.paymentStatus;
    if (this.paymentMethod != null) {
      data['paymentMethod'] = this.paymentMethod.toJson();
    }
    data['deliveryMethod'] = this.deliveryMethod;
    if (this.paid != null) {
      data['paid'] = this.paid.toJson();
    }
    return data;
  }
}

class CarProduct {
  String preferredSize;
  String productReference;
  PreferredColor preferredColor;
  int preferredQuantity;

  CarProduct(
      {this.preferredSize,
      this.productReference,
      this.preferredColor,
      this.preferredQuantity});

  CarProduct.fromJson(Map<String, dynamic> json) {
    preferredSize = json['preferredSize:'];
    productReference = json['productReference'];
    preferredColor = json['preferredColor'] != null
        ? new PreferredColor.fromJson(json['preferredColor'])
        : null;
    preferredQuantity = json['preferredQuantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['preferredSize:'] = this.preferredSize;
    data['productReference'] = this.productReference;
    if (this.preferredColor != null) {
      data['preferredColor'] = this.preferredColor.toJson();
    }
    data['preferredQuantity'] = this.preferredQuantity;
    return data;
  }
}

class PreferredColor {
  String color;
  String image;

  PreferredColor({this.color, this.image});

  PreferredColor.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color'] = this.color;
    data['image'] = this.image;
    return data;
  }
}

class Products {
  List<String> images;
  List<ProductColors> productColors;
  String content;
  double price;
  String title;
  String image;
  List<String> sizes;
  String priority;

  Products(
      {this.images,
      this.productColors,
      this.content,
      this.price,
      this.title,
      this.image,
      this.sizes,
      this.priority});

  Products.fromJson(Map<String, dynamic> json) {
    images = json['images'].cast<String>();
    if (json['productColors'] != null) {
      productColors = new List<ProductColors>();
      json['productColors'].forEach((v) {
        productColors.add(new ProductColors.fromJson(v));
      });
    }
    content = json['content'];
    price = json['price'];
    title = json['title'];
    image = json['image'];
    sizes = json['sizes'].cast<String>();
    priority = json['priority'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['images'] = this.images;
    if (this.productColors != null) {
      data['productColors'] =
          this.productColors.map((v) => v.toJson()).toList();
    }
    data['content'] = this.content;
    data['price'] = this.price;
    data['title'] = this.title;
    data['image'] = this.image;
    data['sizes'] = this.sizes;
    data['priority'] = this.priority;
    return data;
  }
}

class ProductColors {
  List<ProductColors> productColors;

  ProductColors({this.productColors});

  ProductColors.fromJson(Map<String, dynamic> json) {
    if (json['productColors'] != null) {
      productColors = new List<ProductColors>();
      json['productColors'].forEach((v) {
        productColors.add(new ProductColors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productColors != null) {
      data['productColors'] =
          this.productColors.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ShippingAddress {
  String phone;
  String city;
  String firstName;
  String country;
  String apartment;
  String zip;
  String streetAddress;
  String state;
  String lastName;

  ShippingAddress(
      {this.phone,
      this.city,
      this.firstName,
      this.country,
      this.apartment,
      this.zip,
      this.streetAddress,
      this.state,
      this.lastName});

  ShippingAddress.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    city = json['city'];
    firstName = json['firstName'];
    country = json['country'];
    apartment = json['apartment'];
    zip = json['zip'];
    streetAddress = json['streetAddress'];
    state = json['state'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['city'] = this.city;
    data['firstName'] = this.firstName;
    data['country'] = this.country;
    data['apartment'] = this.apartment;
    data['zip'] = this.zip;
    data['streetAddress'] = this.streetAddress;
    data['state'] = this.state;
    data['lastName'] = this.lastName;
    return data;
  }
}

class PaymentMethod {
  bool livemode;
  dynamic created;
  String id;
  Card card;
  BillingDetails billingDetails;
  String type;

  PaymentMethod(
      {this.livemode,
      this.created,
      this.id,
      this.card,
      this.billingDetails,
      this.type});

  PaymentMethod.fromJson(Map<String, dynamic> json) {
    livemode = json['livemode'];
    created = json['created'];
    id = json['id'];
    card = json['card'] != null ? new Card.fromJson(json['card']) : null;
    billingDetails = json['billingDetails'] != null
        ? new BillingDetails.fromJson(json['billingDetails'])
        : null;
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['livemode'] = this.livemode;
    data['created'] = this.created;
    data['id'] = this.id;
    if (this.card != null) {
      data['card'] = this.card.toJson();
    }
    if (this.billingDetails != null) {
      data['billingDetails'] = this.billingDetails.toJson();
    }
    data['type'] = this.type;
    return data;
  }
}

class Card {
  String funding;
  String country;
  dynamic addressLine1;
  int expMonth;
  String brand;
  dynamic addressLine2;
  int expYear;
  String last4;

  Card(
      {this.funding,
      this.country,
      this.addressLine1,
      this.expMonth,
      this.brand,
      this.addressLine2,
      this.expYear,
      this.last4});

  Card.fromJson(Map<String, dynamic> json) {
    funding = json['funding'];
    country = json['country'];
    addressLine1 = json['addressLine1'];
    expMonth = json['expMonth'];
    brand = json['brand'];
    addressLine2 = json['addressLine2'];
    expYear = json['expYear'];
    last4 = json['last4'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['funding'] = this.funding;
    data['country'] = this.country;
    data['addressLine1'] = this.addressLine1;
    data['expMonth'] = this.expMonth;
    data['brand'] = this.brand;
    data['addressLine2'] = this.addressLine2;
    data['expYear'] = this.expYear;
    data['last4'] = this.last4;
    return data;
  }
}

class BillingDetails {
  Address address;
  String name;

  BillingDetails({this.address, this.name});

  BillingDetails.fromJson(Map<String, dynamic> json) {
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    data['name'] = this.name;
    return data;
  }
}

class Address {
  String state;
  String country;
  String line2;
  String city;
  String line1;
  String postalCode;

  Address(
      {this.state,
      this.country,
      this.line2,
      this.city,
      this.line1,
      this.postalCode});

  Address.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    country = json['country'];
    line2 = json['line2'];
    city = json['city'];
    line1 = json['line1'];
    postalCode = json['postalCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['country'] = this.country;
    data['line2'] = this.line2;
    data['city'] = this.city;
    data['line1'] = this.line1;
    data['postalCode'] = this.postalCode;
    return data;
  }
}

class Paid {
  double subTotal;
  double total;
  double delivery;

  Paid({this.subTotal, this.total, this.delivery});

  Paid.fromJson(Map<String, dynamic> json) {
    subTotal = json['subTotal'];
    total = json['total'];
    delivery = json['delivery'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subTotal'] = this.subTotal;
    data['total'] = this.total;
    data['delivery'] = this.delivery;
    return data;
  }
}

// import 'dart:convert';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// Order orderFromJson(String str) => Order.fromJson(json.decode(str));
//
// String orderToJson(Order data) => json.encode(data.toJson());
//
// class Order {
//   Order(
//       {this.carProduct,
//       this.status,
//       this.products,
//       this.shippingAddress,
//       this.paymentType,
//       this.paymentStatus,
//       this.paymentMethod,
//       this.deliveryMethod,
//       this.paid,
//       this.timeStamp});
//
//   List<CarProduct> carProduct;
//   String status;
//   List<Product> products;
//   ShippingAddress shippingAddress;
//   String paymentType;
//   Timestamp timeStamp;
//   dynamic paymentStatus;
//   PaymentMethod paymentMethod;
//   String deliveryMethod;
//   Paid paid;
//
//   factory Order.fromJson(Map<String, dynamic> json) => Order(
//         carProduct: List<CarProduct>.from(
//             json["carProduct"].map((x) => CarProduct.fromJson(x))),
//         status: json["status"],
//         timeStamp: json["timeStamp"],
//         products: List<Product>.from(
//             json["products"].map((x) => Product.fromJson(x))),
//         shippingAddress: ShippingAddress.fromJson(json["shippingAddress"]),
//         paymentType: json["paymentType"],
//         paymentStatus: json["paymentStatus"],
//         paymentMethod: PaymentMethod.fromJson(json["paymentMethod"]),
//         deliveryMethod: json["deliveryMethod"],
//         paid: Paid.fromJson(json["paid"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "carProduct": List<dynamic>.from(carProduct.map((x) => x.toJson())),
//         "status": status,
//         "timeStamp": FieldValue.serverTimestamp(),
//         "products": List<dynamic>.from(products.map((x) => x.toJson())),
//         "shippingAddress": shippingAddress.toJson(),
//         "paymentType": paymentType,
//         "paymentStatus": paymentStatus,
//         "paymentMethod": paymentMethod.toJson(),
//         "deliveryMethod": deliveryMethod,
//         "paid": paid.toJson(),
//       };
// }
//
// class CarProduct {
//   CarProduct({
//     this.preferredSize,
//     this.productReference,
//     this.preferredColor,
//     this.preferredQuantity,
//   });
//
//   String preferredSize;
//   String productReference;
//   Color preferredColor;
//   int preferredQuantity;
//
//   factory CarProduct.fromJson(Map<String, dynamic> json) => CarProduct(
//         preferredSize: json["preferredSize:"],
//         productReference: json["productReference"],
//         preferredColor: Color.fromJson(json["preferredColor"]),
//         preferredQuantity: json["preferredQuantity"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "preferredSize:": preferredSize,
//         "productReference": productReference,
//         "preferredColor": preferredColor.toJson(),
//         "preferredQuantity": preferredQuantity,
//       };
// }
//
// class Color {
//   Color({
//     this.color,
//     this.image,
//   });
//
//   String color;
//   String image;
//
//   factory Color.fromJson(Map<String, dynamic> json) => Color(
//         color: json["color"],
//         image: json["image"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "color": color,
//         "image": image,
//       };
// }
//
// class Paid {
//   Paid({
//     this.subTotal,
//     this.total,
//     this.delivery,
//   });
//
//   double subTotal;
//   double total;
//   int delivery;
//
//   factory Paid.fromJson(Map<String, dynamic> json) => Paid(
//         subTotal: json["subTotal"].toDouble(),
//         total: json["total"].toDouble(),
//         delivery: json["delivery"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "subTotal": subTotal,
//         "total": total,
//         "delivery": delivery,
//       };
// }
//
// class PaymentMethod {
//   PaymentMethod({
//     this.livemode,
//     this.created,
//     this.id,
//     this.card,
//     this.billingDetails,
//     this.type,
//   });
//
//   bool livemode;
//   int created;
//   String id;
//   Card card;
//   BillingDetails billingDetails;
//   String type;
//
//   factory PaymentMethod.fromJson(Map<String, dynamic> json) => PaymentMethod(
//         livemode: json["livemode"],
//         created: json["created"],
//         id: json["id"],
//         card: Card.fromJson(json["card"]),
//         billingDetails: BillingDetails.fromJson(json["billingDetails"]),
//         type: json["type"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "livemode": livemode,
//         "created": created,
//         "id": id,
//         "card": card.toJson(),
//         "billingDetails": billingDetails.toJson(),
//         "type": type,
//       };
// }
//
// class BillingDetails {
//   BillingDetails({
//     this.address,
//     this.name,
//   });
//
//   Address address;
//   String name;
//
//   factory BillingDetails.fromJson(Map<String, dynamic> json) => BillingDetails(
//         address: Address.fromJson(json["address"]),
//         name: json["name"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "address": address.toJson(),
//         "name": name,
//       };
// }
//
// class Address {
//   Address({
//     this.state,
//     this.country,
//     this.line2,
//     this.city,
//     this.line1,
//     this.postalCode,
//   });
//
//   String state;
//   String country;
//   String line2;
//   String city;
//   String line1;
//   String postalCode;
//
//   factory Address.fromJson(Map<String, dynamic> json) => Address(
//         state: json["state"],
//         country: json["country"],
//         line2: json["line2"],
//         city: json["city"],
//         line1: json["line1"],
//         postalCode: json["postalCode"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "state": state,
//         "country": country,
//         "line2": line2,
//         "city": city,
//         "line1": line1,
//         "postalCode": postalCode,
//       };
// }
//
// class Card {
//   Card({
//     this.funding,
//     this.country,
//     this.addressLine1,
//     this.expMonth,
//     this.brand,
//     this.addressLine2,
//     this.expYear,
//     this.last4,
//   });
//
//   String funding;
//   String country;
//   dynamic addressLine1;
//   int expMonth;
//   String brand;
//   dynamic addressLine2;
//   int expYear;
//   String last4;
//
//   factory Card.fromJson(Map<String, dynamic> json) => Card(
//         funding: json["funding"],
//         country: json["country"],
//         addressLine1: json["addressLine1"],
//         expMonth: json["expMonth"],
//         brand: json["brand"],
//         addressLine2: json["addressLine2"],
//         expYear: json["expYear"],
//         last4: json["last4"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "funding": funding,
//         "country": country,
//         "addressLine1": addressLine1,
//         "expMonth": expMonth,
//         "brand": brand,
//         "addressLine2": addressLine2,
//         "expYear": expYear,
//         "last4": last4,
//       };
// }
//
// class Product {
//   Product({
//     this.images,
//     this.productColors,
//     this.content,
//     this.price,
//     this.title,
//     this.image,
//     this.sizes,
//     this.priority,
//   });
//
//   List<String> images;
//   List<Color> productColors;
//   String content;
//   double price;
//   String title;
//   String image;
//   List<String> sizes;
//   String priority;
//
//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//         images: List<String>.from(json["images"].map((x) => x)),
//         productColors: List<Color>.from(
//             json["productColors"].map((x) => Color.fromJson(x))),
//         content: json["content"],
//         price: json["price"].toDouble(),
//         title: json["title"],
//         image: json["image"],
//         sizes: List<String>.from(json["sizes"].map((x) => x)),
//         priority: json["priority"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "images": List<dynamic>.from(images.map((x) => x)),
//         "productColors":
//             List<dynamic>.from(productColors.map((x) => x.toJson())),
//         "content": content,
//         "price": price,
//         "title": title,
//         "image": image,
//         "sizes": List<dynamic>.from(sizes.map((x) => x)),
//         "priority": priority,
//       };
// }
//
// class ShippingAddress {
//   ShippingAddress({
//     this.phone,
//     this.city,
//     this.firstName,
//     this.country,
//     this.apartment,
//     this.zip,
//     this.streetAddress,
//     this.state,
//     this.lastName,
//   });
//
//   String phone;
//   String city;
//   String firstName;
//   String country;
//   String apartment;
//   String zip;
//   String streetAddress;
//   String state;
//   String lastName;
//
//   factory ShippingAddress.fromJson(Map<String, dynamic> json) =>
//       ShippingAddress(
//         phone: json["phone"],
//         city: json["city"],
//         firstName: json["firstName"],
//         country: json["country"],
//         apartment: json["apartment"],
//         zip: json["zip"],
//         streetAddress: json["streetAddress"],
//         state: json["state"],
//         lastName: json["lastName"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "phone": phone,
//         "city": city,
//         "firstName": firstName,
//         "country": country,
//         "apartment": apartment,
//         "zip": zip,
//         "streetAddress": streetAddress,
//         "state": state,
//         "lastName": lastName,
//       };
// }

// // To parse this JSON data, do
// //
// //     final order = orderFromJson(jsonString);
//
// import 'dart:convert';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// Order orderFromJson(String str) => Order.fromJson(json.decode(str));
//
// String orderToJson(Order data) => json.encode(data.toJson());
//
// class Order {
//   Order({
//     this.carProduct,
//     this.status,
//     this.timeStamp,
//     this.products,
//     this.shippingAddress,
//     this.paymentType,
//     this.paymentStatus,
//     this.paymentMethod,
//     this.deliveryMethod,
//     this.paid,
//   });
//
//   List<CarProduct> carProduct;
//   String status;
//   Timestamp timeStamp;
//   List<Product> products;
//   ShippingAddress shippingAddress;
//   String paymentType;
//   dynamic paymentStatus;
//   PaymentMethod paymentMethod;
//   String deliveryMethod;
//   Paid paid;
//
//   factory Order.fromJson(Map<String, dynamic> json) => Order(
//         carProduct: List<CarProduct>.from(
//             json["carProduct"].map((x) => CarProduct.fromJson(x))),
//         status: json["status"],
//         timeStamp: json["timeStamp"],
//         products: List<Product>.from(
//             json["products"].map((x) => Product.fromJson(x))),
//         shippingAddress: ShippingAddress.fromJson(json["shippingAddress"]),
//         paymentType: json["paymentType"],
//         paymentStatus: json["paymentStatus"],
//         paymentMethod: PaymentMethod.fromJson(json["paymentMethod"]),
//         deliveryMethod: json["deliveryMethod"],
//         paid: Paid.fromJson(json["paid"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "carProduct": List<dynamic>.from(carProduct.map((x) => x.toJson())),
//         "status": status,
//         "timeStamp": timeStamp,
//         "products": List<dynamic>.from(products.map((x) => x.toJson())),
//         "shippingAddress": shippingAddress.toJson(),
//         "paymentType": paymentType,
//         "paymentStatus": paymentStatus,
//         "paymentMethod": paymentMethod.toJson(),
//         "deliveryMethod": deliveryMethod,
//         "paid": paid.toJson(),
//       };
// }
//
// class CarProduct {
//   CarProduct({
//     this.preferredSize,
//     this.productReference,
//     this.preferredColor,
//     this.preferredQuantity,
//   });
//
//   String preferredSize;
//   String productReference;
//   Color preferredColor;
//   int preferredQuantity;
//
//   factory CarProduct.fromJson(Map<String, dynamic> json) => CarProduct(
//         preferredSize: json["preferredSize:"],
//         productReference: json["productReference"],
//         preferredColor: Color.fromJson(json["preferredColor"]),
//         preferredQuantity: json["preferredQuantity"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "preferredSize:": preferredSize,
//         "productReference": productReference,
//         "preferredColor": preferredColor.toJson(),
//         "preferredQuantity": preferredQuantity,
//       };
// }
//
// class Color {
//   Color({
//     this.color,
//     this.image,
//   });
//
//   String color;
//   String image;
//
//   factory Color.fromJson(Map<String, dynamic> json) => Color(
//         color: json["color"],
//         image: json["image"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "color": color,
//         "image": image,
//       };
// }
//
// class Paid {
//   Paid({
//     this.subTotal,
//     this.total,
//     this.delivery,
//   });
//
//   double subTotal;
//   double total;
//   double delivery;
//
//   factory Paid.fromJson(Map<String, dynamic> json) => Paid(
//         subTotal: json["subTotal"].toDouble(),
//         total: json["total"].toDouble(),
//         delivery: json["delivery"].toDouble(),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "subTotal": subTotal,
//         "total": total,
//         "delivery": delivery,
//       };
// }
//
// class PaymentMethod {
//   PaymentMethod();
//
//   factory PaymentMethod.fromJson(Map<String, dynamic> json) => PaymentMethod();
//
//   Map<String, dynamic> toJson() => {};
// }
//
// class Product {
//   Product({
//     this.images,
//     this.productColors,
//     this.content,
//     this.price,
//     this.title,
//     this.image,
//     this.sizes,
//     this.priority,
//   });
//
//   List<String> images;
//   List<Color> productColors;
//   String content;
//   double price;
//   String title;
//   String image;
//   List<String> sizes;
//   String priority;
//
//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//         images: List<String>.from(json["images"].map((x) => x)),
//         productColors: List<Color>.from(
//             json["productColors"].map((x) => Color.fromJson(x))),
//         content: json["content"],
//         price: json["price"].toDouble(),
//         title: json["title"],
//         image: json["image"],
//         sizes: List<String>.from(json["sizes"].map((x) => x)),
//         priority: json["priority"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "images": List<dynamic>.from(images.map((x) => x)),
//         "productColors":
//             List<dynamic>.from(productColors.map((x) => x.toJson())),
//         "content": content,
//         "price": price,
//         "title": title,
//         "image": image,
//         "sizes": List<dynamic>.from(sizes.map((x) => x)),
//         "priority": priority,
//       };
// }
//
// class ShippingAddress {
//   ShippingAddress({
//     this.phone,
//     this.city,
//     this.firstName,
//     this.country,
//     this.apartment,
//     this.zip,
//     this.streetAddress,
//     this.state,
//     this.lastName,
//   });
//
//   dynamic phone;
//   dynamic city;
//   dynamic firstName;
//   dynamic country;
//   dynamic apartment;
//   dynamic zip;
//   dynamic streetAddress;
//   dynamic state;
//   dynamic lastName;
//
//   factory ShippingAddress.fromJson(Map<String, dynamic> json) =>
//       ShippingAddress(
//         phone: json["phone"],
//         city: json["city"],
//         firstName: json["firstName"],
//         country: json["country"],
//         apartment: json["apartment"],
//         zip: json["zip"],
//         streetAddress: json["streetAddress"],
//         state: json["state"],
//         lastName: json["lastName"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "phone": phone,
//         "city": city,
//         "firstName": firstName,
//         "country": country,
//         "apartment": apartment,
//         "zip": zip,
//         "streetAddress": streetAddress,
//         "state": state,
//         "lastName": lastName,
//       };
// }
//
// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);
