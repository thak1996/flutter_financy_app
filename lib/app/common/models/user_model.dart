import 'dart:convert';

class UserModel {
  UserModel({
    this.id,
    this.name,
    this.email,
    this.password,
  });

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] != null ? map['email'] as String : null,
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
    );
  }

  final String? email;
  final String? id;
  final String? name;
  final String? password;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'id': id,
      'name': name,
      'password': password,
    };
  }

  String toJson() => json.encode(toMap());
}
