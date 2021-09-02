import 'dart:convert';

// ignore: non_constant_identifier_names
ProductSold ProductSoldFromJson(String str) =>
    ProductSold.fromjson(json.decode(str));

// ignore: non_constant_identifier_names
String ProductToJson(ProductSold data) => json.encode(data.toJson());

class ProductSold {
  ProductSold({
    this.products,
  });

  List<Product> products;

  factory ProductSold.fromjson(Map<String, dynamic> json) => ProductSold(
      products:
          List<Product>.from(json["product"].map((x) => Product.fromJson(x))));

  Map<String, dynamic> toJson() => {
        "product": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    this.classification,
    this.transaction,
  });

  String classification;
  int transaction;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        classification: json["classification"],
        transaction: json["transaction"],
      );
  Map<String, dynamic> toJson() => {
        "classification": classification,
        "transaction": transaction,
      };
}
