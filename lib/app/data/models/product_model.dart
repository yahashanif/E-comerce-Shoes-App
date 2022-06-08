import 'package:e_comerce_shoes/app/data/models/categori_model_model.dart';

class Product {
  int? id;
  String? name;
  CategoriModel? category;
  String? merk;
  int? harga;
  String? description;
  List<ProductDetails>? productDetails;
  List<ProductImage>? productImage;

  Product(
      {this.id,
      this.name,
      this.category,
      this.merk,
      this.harga,
      this.description,
      this.productDetails,
      this.productImage});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'] != null
        ? new CategoriModel.fromJson(json['category'])
        : null;
    merk = json['merk'];
    harga = json['harga'];
    description = json['description'];
    if (json['product_details'] != null) {
      productDetails = <ProductDetails>[];
      json['product_details'].forEach((v) {
        productDetails!.add(new ProductDetails.fromJson(v));
      });
    }
    if (json['product_image'] != null) {
      productImage = <ProductImage>[];
      json['product_image'].forEach((v) {
        productImage!.add(new ProductImage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['merk'] = this.merk;
    data['harga'] = this.harga;
    data['description'] = this.description;
    if (this.productDetails != null) {
      data['product_details'] =
          this.productDetails!.map((v) => v.toJson()).toList();
    }
    if (this.productImage != null) {
      data['product_image'] =
          this.productImage!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



class ProductDetails {
  int? id;
  int? size;
  int? quantity;

  ProductDetails({this.id, this.size, this.quantity});

  ProductDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    size = json['size'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['size'] = this.size;
    data['quantity'] = this.quantity;
    return data;
  }
}

class ProductImage {
  String? urlImage;

  ProductImage({this.urlImage});

  ProductImage.fromJson(Map<String, dynamic> json) {
    urlImage = json['url_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url_image'] = this.urlImage;
    return data;
  }
}