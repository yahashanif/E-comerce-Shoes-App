class Address {
  String? id;
  String? idUser;
  String? idProvince;
  String? province;
  String? idCity;
  String? city;
  String? idSubdistrict;
  String? subdstrict;
  String? postalCode;
  String? detailAddress;

  Address(
      {this.id,
      this.idUser,
      this.idProvince,
      this.province,
      this.idCity,
      this.city,
      this.idSubdistrict,
      this.subdstrict,
      this.postalCode,
      this.detailAddress});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idUser = json['id_user'];
    idProvince = json['id_province'];
    province = json['province'];
    idCity = json['id_city'];
    city = json['city'];
    idSubdistrict = json['id_subdistrict'];
    subdstrict = json['subdstrict'];
    postalCode = json['postal_code'];
    detailAddress = json['detail_address'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['id_user'] = idUser;
    data['id_province'] = idProvince;
    data['province'] = province;
    data['id_city'] = idCity;
    data['city'] = city;
    data['id_subdistrict'] = idSubdistrict;
    data['subdstrict'] = subdstrict;
    data['postal_code'] = postalCode;
    data['detail_address'] = detailAddress;
    return data;
  }
}
