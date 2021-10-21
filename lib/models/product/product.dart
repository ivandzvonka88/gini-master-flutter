class Product {
  List<String> images;
  List<ProductColors> productColors;
  String content;
  double price;
  String title;
  String image;
  List<String> sizes;
  String priority;
  String productReference;

  Product(
      {this.images,
      this.productColors,
      this.content,
      this.price,
      this.title,
      this.image,
      this.sizes,
      this.priority});

  Product.fromJson(Map<String, dynamic> json, [String ref]) {
    images = json['images'].cast<String>();
    if (json['productColors'] != null) {
      productColors = new List<ProductColors>();
      json['productColors'].forEach((v) {
        productColors.add(new ProductColors.fromJson(v));
      });
    }
    content = json['content'];
    price = json['price'].toDouble();
    title = json['title'];
    image = json['image'];
    sizes = json['sizes'].cast<String>();
    priority = json['priority'];
    productReference = ref;
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
  String color;
  String image;

  ProductColors({this.color, this.image});

  ProductColors.fromJson(Map<String, dynamic> json) {
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
