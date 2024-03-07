// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  bool? success;
  String? message;
  Data? data;
  dynamic errors;

  LoginModel({
    this.success,
    this.message,
    this.data,
    this.errors,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    errors: json["errors"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
    "errors": errors,
  };
}

class Data {
  User? user;
  String? accessToken;

  Data({
    this.user,
    this.accessToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    accessToken: json["accessToken"],
  );

  Map<String, dynamic> toJson() => {
    "user": user?.toJson(),
    "accessToken": accessToken,
  };
}

class User {
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  dynamic username;
  dynamic phone;
  dynamic img;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.username,
    this.phone,
    this.img,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    username: json["username"],
    phone: json["phone"],
    img: json["img"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "username": username,
    "phone": phone,
    "img": img,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
