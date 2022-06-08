class Kota {
  String? cityId;
  String? provinceId;
  String? type;
  String? cityName;
  String? postalCode;

  Kota(
      {this.cityId,
      this.provinceId,
      this.type,
      this.cityName,
      this.postalCode});

  Kota.fromJson(Map<String, dynamic> json) {
    cityId = json['id_city'];
    provinceId = json['province_id'];
    type = json['type'];
    cityName = json['city_name'];
    postalCode = json['postal_code'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['city_id'] = cityId;
    data['province_id'] = provinceId;
    data['type'] = type;
    data['city_name'] = cityName;
    data['postal_code'] = postalCode;
    return data;
  }
}
