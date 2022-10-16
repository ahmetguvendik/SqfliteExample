class UserModel {
  int? id;
  String? username;
  String? age;

  UserModel({this.id, this.username, this.age});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['age'] = this.age;
    return data;
  }
}