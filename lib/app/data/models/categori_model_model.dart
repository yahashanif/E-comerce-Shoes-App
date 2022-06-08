class CategoriModel {
  int? id;
  String? category;
  String? urlPhoto;

  CategoriModel({this.id, this.category, this.urlPhoto});

  CategoriModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    urlPhoto = json['url_photo'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['category'] = category;
    data['url_photo'] = urlPhoto;
    return data;
  }
}
