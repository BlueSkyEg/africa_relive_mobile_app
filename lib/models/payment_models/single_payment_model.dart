// To parse this JSON data, do
//
//     final singlePayment = singlePaymentFromJson(jsonString);

import 'dart:convert';

SinglePayment singlePaymentFromJson(String str) => SinglePayment.fromJson(json.decode(str));

String singlePaymentToJson(SinglePayment data) => json.encode(data.toJson());

class SinglePayment {
  bool? success;
  String? message;
  SinglePaymentData? data;

  SinglePayment({
    this.success,
    this.message,
    this.data,
  });

  factory SinglePayment.fromJson(Map<String, dynamic> json) => SinglePayment(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : SinglePaymentData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };
}

class SinglePaymentData {
  bool? requiresAction;
  String? clientSecret;

  SinglePaymentData({
    this.requiresAction,
    this.clientSecret,
  });

  factory SinglePaymentData.fromJson(Map<String, dynamic> json) => SinglePaymentData(
    requiresAction: json["requiresAction"],
    clientSecret: json["clientSecret"],
  );

  Map<String, dynamic> toJson() => {
    "requiresAction": requiresAction,
    "clientSecret": clientSecret,
  };
}
