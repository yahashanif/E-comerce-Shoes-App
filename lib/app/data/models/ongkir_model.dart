class Ongkir {
  String? code;
  List<Costs>? costs;
  String? name;

  Ongkir({this.code, this.costs, this.name});

  Ongkir.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['costs'] != null) {
      costs = <Costs>[];
      json['costs'].forEach((v) {
        costs!.add(new Costs.fromJson(v));
      });
    }
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.costs != null) {
      data['costs'] = this.costs!.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    return data;
  }
}

class Costs {
  List<Cost>? cost;
  String? description;
  String? service;

  Costs({this.cost, this.description, this.service});

  Costs.fromJson(Map<String, dynamic> json) {
    if (json['cost'] != null) {
      cost = <Cost>[];
      json['cost'].forEach((v) {
        cost!.add(new Cost.fromJson(v));
      });
    }
    description = json['description'];
    service = json['service'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cost != null) {
      data['cost'] = this.cost!.map((v) => v.toJson()).toList();
    }
    data['description'] = this.description;
    data['service'] = this.service;
    return data;
  }
}

class Cost {
  String? etd;
  String? note;
  int? value;

  Cost({this.etd, this.note, this.value});

  Cost.fromJson(Map<String, dynamic> json) {
    etd = json['etd'];
    note = json['note'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['etd'] = this.etd;
    data['note'] = this.note;
    data['value'] = this.value;
    return data;
  }
}