// class OrderModel {
//   List<Products> products;
//   Shipping shipping;
//   bool billingAsShipping;
//
//   OrderModel({this.products, this.shipping, this.billingAsShipping});
//
//   OrderModel.fromJson(Map<String, dynamic> json) {
//     if (json['products'] != null) {
//       products = new List<Products>();
//       json['products'].forEach((v) {
//         products.add(new Products.fromJson(v));
//       });
//     }
//     shipping = json['shipping'] != null
//         ? new Shipping.fromJson(json['shipping'])
//         : null;
//     billingAsShipping = json['billingAsShipping'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.products != null) {
//       data['products'] = this.products.map((v) => v.toJson()).toList();
//     }
//     if (this.shipping != null) {
//       data['shipping'] = this.shipping.toJson();
//     }
//     data['billingAsShipping'] = this.billingAsShipping;
//     return data;
//   }
// }
//
// class Products {
//   int size;
//   String title;
//   String price;
//   String description;
//   int color;
//
//   Products({this.size, this.title, this.price, this.description, this.color});
//
//   Products.fromJson(Map<String, dynamic> json) {
//     size = json['size'];
//     title = json['title'];
//     price = json['price'];
//     description = json['description'];
//     color = json['color'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['size'] = this.size;
//     data['title'] = this.title;
//     data['price'] = this.price;
//     data['description'] = this.description;
//     data['color'] = this.color;
//     return data;
//   }
// }
//
// class Shipping {
//   String city;
//   String fullName;
//   String phoneNo;
//   String zip;
//   String streetAddress;
//   String state;
//   String apartmentUnit;
//
//   Shipping(
//       {this.city,
//       this.fullName,
//       this.phoneNo,
//       this.zip,
//       this.streetAddress,
//       this.state,
//       this.apartmentUnit});
//
//   Shipping.fromJson(Map<String, dynamic> json) {
//     city = json['city'];
//     fullName = json['fullName'];
//     phoneNo = json['phoneNo'];
//     zip = json['zip'];
//     streetAddress = json['streetAddress'];
//     state = json['state'];
//     apartmentUnit = json['apartmentUnit'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['city'] = this.city;
//     data['fullName'] = this.fullName;
//     data['phoneNo'] = this.phoneNo;
//     data['zip'] = this.zip;
//     data['streetAddress'] = this.streetAddress;
//     data['state'] = this.state;
//     data['apartmentUnit'] = this.apartmentUnit;
//     return data;
//   }
// }
