// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  bool? success;
  String? message;
  Data? data;

  RegisterModel({
    this.success,
    this.message,
    this.data,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  User? user;

  Data({
    this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "user": user?.toJson(),
  };
}

class User {
  int? id;
  String? name;
  dynamic img;
  String? email;
  dynamic phone;
  dynamic address;
  List<dynamic>? donations;
  List<dynamic>? subscriptions;

  User({
    this.id,
    this.name,
    this.img,
    this.email,
    this.phone,
    this.address,
    this.donations,
    this.subscriptions,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    img: json["img"],
    email: json["email"],
    phone: json["phone"],
    address: json["address"],
    donations: json["donations"] == null ? [] : List<dynamic>.from(json["donations"]!.map((x) => x)),
    subscriptions: json["subscriptions"] == null ? [] : List<dynamic>.from(json["subscriptions"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "img": img,
    "email": email,
    "phone": phone,
    "address": address,
    "donations": donations == null ? [] : List<dynamic>.from(donations!.map((x) => x)),
    "subscriptions": subscriptions == null ? [] : List<dynamic>.from(subscriptions!.map((x) => x)),
  };
}
