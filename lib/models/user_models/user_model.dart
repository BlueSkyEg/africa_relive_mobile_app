// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  String? status;
  String? message;
  Data? data;

  ProfileModel({
    this.status,
    this.message,
    this.data,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  int? id;
  String? name;
  dynamic img;
  String? email;
  dynamic phone;
  dynamic address;
  List<dynamic>? donations;
  List<dynamic>? subscriptions;

  Data({
    this.id,
    this.name,
    this.img,
    this.email,
    this.phone,
    this.address,
    this.donations,
    this.subscriptions,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
