class Province {
  String? provinceId;
  String? province;

  Province({this.provinceId, this.province});

  Province.fromJson(Map<String, dynamic> json) {
    provinceId = json['id_province'];
    province = json['province'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id_province'] = provinceId;
    data['province'] = province;
    return data;
  }
}
