import 'package:e_comerce_shoes/app/data/models/product_model.dart';

class Transaction {
  String? id;
  String? tgl;
  String? jam;
  String? total;
  String? item;
  String? status;
  String? shipping;
  String? urlPay;
  List<DetailTransaction>? detailTransaction;

  Transaction(
      {this.id,
      this.tgl,
      this.jam,
      this.total,
      this.item,
      this.status,
      this.shipping,
      this.urlPay,
      this.detailTransaction});

  Transaction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tgl = json['tgl'];
    jam = json['jam'];
    total = json['total'];
    item = json['item'];
    status = json['status'];
    shipping = json['shipping'];
    urlPay = json['url_pay'];
    if (json['detail_transaction'] != null) {
      detailTransaction = <DetailTransaction>[];
      json['detail_transaction'].forEach((v) {
        detailTransaction!.add(new DetailTransaction.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tgl'] = this.tgl;
    data['jam'] = this.jam;
    data['total'] = this.total;
    data['item'] = this.item;
    data['status'] = this.status;
    data['shipping'] = this.shipping;
    data['url_pay'] = this.urlPay;
    if (this.detailTransaction != null) {
      data['detail_transaction'] =
          this.detailTransaction!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DetailTransaction {
  List<ProductDetails>? productDetail;
  Product? product;
  int? quantity;
  int? subTotal;

  DetailTransaction(
      {this.productDetail, this.product, this.quantity, this.subTotal});

  DetailTransaction.fromJson(Map<String, dynamic> json) {
    if (json['product_detail'] != null) {
      productDetail = <ProductDetails>[];
      json['product_detail'].forEach((v) {
        productDetail!.add(new ProductDetails.fromJson(v));
      });
    }
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
    quantity = json['quantity'];
    subTotal = json['sub_total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productDetail != null) {
      data['product_detail'] =
          this.productDetail!.map((v) => v.toJson()).toList();
    }
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    data['quantity'] = this.quantity;
    data['sub_total'] = this.subTotal;
    return data;
  }
}
