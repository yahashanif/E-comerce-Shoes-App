class User {
  int? id;
  String? username;
  String? level;
  String? fullName;
  String? email;
  String? urlPhoto;

  User(
      {this.id,
      this.username,
      this.level,
      this.fullName,
      this.email,
      this.urlPhoto});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    level = json['level'];
    fullName = json['full_name'];
    email = json['Email'];
    urlPhoto = json['url_photo'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['level'] = level;
    data['full_name'] = fullName;
    data['Email'] = email;
    data['url_photo'] = urlPhoto;
    return data;
  }
}
