class Subdistrict {
  String? id;
  String? provinceId;
  String? cityId;
  String? subdistrictName;

  Subdistrict({this.id, this.provinceId, this.cityId, this.subdistrictName});

  Subdistrict.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    provinceId = json['province_id'];
    cityId = json['city_id'];
    subdistrictName = json['subdistrict_name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['province_id'] = provinceId;
    data['city_id'] = cityId;
    data['subdistrict_name'] = subdistrictName;
    return data;
  }
}
