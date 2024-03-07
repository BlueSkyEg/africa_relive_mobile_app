// To parse this JSON data, do
//
//     final subscriptionModel = subscriptionModelFromJson(jsonString);

import 'dart:convert';

SubscriptionModel subscriptionModelFromJson(String str) => SubscriptionModel.fromJson(json.decode(str));

String subscriptionModelToJson(SubscriptionModel data) => json.encode(data.toJson());

class SubscriptionModel {
  bool? success;
  String? message;
  String? clientSecret;
  dynamic errors;

  SubscriptionModel({
    this.success,
    this.message,
    this.clientSecret,
    this.errors,
  });

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) => SubscriptionModel(
    success: json["success"],
    message: json["message"],
    clientSecret: json["clientSecret"],
    errors: json["errors"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "clientSecret": clientSecret,
    "errors": errors,
  };
}
