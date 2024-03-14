// To parse this JSON data, do
//
//     final recurringModel = recurringModelFromJson(jsonString);

import 'dart:convert';

RecurringModel recurringModelFromJson(String str) => RecurringModel.fromJson(json.decode(str));

String recurringModelToJson(RecurringModel data) => json.encode(data.toJson());

class RecurringModel {
  bool? success;
  String? message;
  List<Datum>? data;
  dynamic errors;

  RecurringModel({
    this.success,
    this.message,
    this.data,
    this.errors,
  });

  factory RecurringModel.fromJson(Map<String, dynamic> json) => RecurringModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    errors: json["errors"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "errors": errors,
  };
}

class Datum {
  int? id;
  int? donorId;
  String? period;
  String? initialAmount;
  String? payment_amount;
  String? payment_currency;
  String? recurringAmount;
  String? stripeSubscriptionId;
  int? parentPaymentId;
  DateTime? createdAt;
  DateTime? completed_date;
  DateTime? expirationAt;
  String? status;
  dynamic notes;
  DonationForm? donationForm;

  Datum({
    this.id,
    this.donorId,
    this.period,
    this.initialAmount,
    this.payment_amount,
    this.payment_currency,
    this.recurringAmount,
    this.stripeSubscriptionId,
    this.parentPaymentId,
    this.createdAt,
    this.completed_date,
    this.expirationAt,
    this.status,
    this.notes,
    this.donationForm,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    donorId: json["donor_id"],
    period: json["period"],
    initialAmount: json["initial_amount"],
    payment_amount: json["payment_amount"],
    payment_currency: json["payment_currency"],
    recurringAmount: json["recurring_amount"],
    stripeSubscriptionId: json["stripe_subscription_id"],
    parentPaymentId: json["parent_payment_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    completed_date: json["completed_date"] == null ? null : DateTime.parse(json["completed_date"]),
    expirationAt: json["expiration_at"] == null ? null : DateTime.parse(json["expiration_at"]),
    status: json["status"],
    notes: json["notes"],
    donationForm: json["donation_form"] == null ? null : DonationForm.fromJson(json["donation_form"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "donor_id": donorId,
    "period": period,
    "initial_amount": initialAmount,
    "payment_amount": payment_amount,
    "payment_currency": payment_currency,
    "recurring_amount": recurringAmount,
    "stripe_subscription_id": stripeSubscriptionId,
    "parent_payment_id": parentPaymentId,
    "created_at": createdAt?.toIso8601String(),
    "completed_date": completed_date?.toIso8601String(),
    "expiration_at": expirationAt?.toIso8601String(),
    "status": status,
    "notes": notes,
    "donation_form": donationForm?.toJson(),
  };
}

class DonationForm {
  int? id;
  String? title;

  DonationForm({
    this.id,
    this.title,
  });

  factory DonationForm.fromJson(Map<String, dynamic> json) => DonationForm(
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
  };
}
