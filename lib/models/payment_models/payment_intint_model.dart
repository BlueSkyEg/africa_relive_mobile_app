// To parse this JSON data, do
//
//     final setupPaymentIntent = setupPaymentIntentFromJson(jsonString);

import 'dart:convert';

SetupPaymentIntent setupPaymentIntentFromJson(String str) => SetupPaymentIntent.fromJson(json.decode(str));

String setupPaymentIntentToJson(SetupPaymentIntent data) => json.encode(data.toJson());

class SetupPaymentIntent {
  bool? success;
  String? message;
  SetupPaymentIntentData? data;

  SetupPaymentIntent({
    this.success,
    this.message,
    this.data,
  });

  factory SetupPaymentIntent.fromJson(Map<String, dynamic> json) => SetupPaymentIntent(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : SetupPaymentIntentData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };
}

class SetupPaymentIntentData {
  String? clientSecret;

  SetupPaymentIntentData({
    this.clientSecret,
  });

  factory SetupPaymentIntentData.fromJson(Map<String, dynamic> json) => SetupPaymentIntentData(
    clientSecret: json["clientSecret"],
  );

  Map<String, dynamic> toJson() => {
    "clientSecret": clientSecret,
  };
}
