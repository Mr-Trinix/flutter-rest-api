// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    required this.id,
    required this.title,
    required this.shortDesc,
    required this.image,
    required this.star,
    required this.body,
  });

  int id;
  String title;
  String shortDesc;
  String image;
  String star;
  String body;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        title: json['title'],
        shortDesc: json['short_desc'],
        image: json['image'],
        star: json['star'],
        body: json['body'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "shortDesc": shortDesc,
        "image": image,
        "star": star,
        "body": body,
      };

  @override
  String toString() {
    return 'Product {id: $id, image: $image, shorDesc: $shortDesc, star: $star, body: $body}';
  }
}
