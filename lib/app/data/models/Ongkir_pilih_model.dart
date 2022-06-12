import 'package:e_comerce_shoes/app/data/models/ongkir_model.dart';

class OngkirPilih {
  String? code;
  Costs? cost;
  String? name;

  OngkirPilih({this.code, this.cost, this.name});

  OngkirPilih.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    cost = json['cost'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['costs'] = this.cost;
    data['name'] = this.name;
    return data;
  }
}
