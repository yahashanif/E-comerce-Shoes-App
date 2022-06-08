import 'product_model.dart';

class Cart {
  String? idUser;
  ProductDetails? productDetail;
  Product? product;
  int? quantity;

  Cart({this.idUser, this.productDetail, this.product, this.quantity});

  Cart.fromJson(Map<String, dynamic> json) {
    idUser = json['id_user'];
    productDetail = json['product_detail'] != null
        ? new ProductDetails.fromJson(json['product_detail'])
        : null;
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_user'] = this.idUser;
    if (this.productDetail != null) {
      data['product_detail'] = this.productDetail!.toJson();
    }
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    data['quantity'] = this.quantity;
    return data;
  }
}




