// To parse this JSON data, do
//
//     final subscriptionModel = subscriptionModelFromJson(jsonString);

import 'dart:convert';

SubscriptionModel subscriptionModelFromJson(String str) => SubscriptionModel.fromJson(json.decode(str));

String subscriptionModelToJson(SubscriptionModel data) => json.encode(data.toJson());

class SubscriptionModel {
  bool? success;
  String? message;
  Data? data;
  Errors? errors;

  SubscriptionModel({
    this.success,
    this.message,
    this.data,
    this.errors,
  });

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) => SubscriptionModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    errors: json["errors"] == null ? null : Errors.fromJson(json["errors"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
    "errors": errors?.toJson(),
  };
}

class Data {
  String? id;
  bool? requiresAction;
  String? object;
  int? amount;
  int? amountCapturable;
  AmountDetails? amountDetails;
  int? amountReceived;
  String? captureMethod;
  String? clientSecret;
  String? confirmationMethod;
  int? created;
  String? currency;
  String? customer;
  String? description;
  String? invoice;
  String? latestCharge;
  bool? livemode;
  List<dynamic>? metadata;
  String? paymentMethod;
  PaymentMethodOptions? paymentMethodOptions;
  List<String>? paymentMethodTypes;
  String? setupFutureUsage;
  String? status;

  Data({
    this.id,
    this.requiresAction,
    this.object,
    this.amount,
    this.amountCapturable,
    this.amountDetails,
    this.amountReceived,
    this.captureMethod,
    this.clientSecret,
    this.confirmationMethod,
    this.created,
    this.currency,
    this.customer,
    this.description,
    this.invoice,
    this.latestCharge,
    this.livemode,
    this.metadata,
    this.paymentMethod,
    this.paymentMethodOptions,
    this.paymentMethodTypes,
    this.setupFutureUsage,
    this.status,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    object: json["object"],
    amount: json["amount"],
    amountCapturable: json["amount_capturable"],
    amountDetails: json["amount_details"] == null ? null : AmountDetails.fromJson(json["amount_details"]),
    amountReceived: json["amount_received"],
    captureMethod: json["capture_method"],
    clientSecret: json["clientSecret"],
    requiresAction: json["requiresAction"],
    confirmationMethod: json["confirmation_method"],
    created: json["created"],
    currency: json["currency"],
    customer: json["customer"],
    description: json["description"],
    invoice: json["invoice"],
    latestCharge: json["latest_charge"],
    livemode: json["livemode"],
    metadata: json["metadata"] == null ? [] : List<dynamic>.from(json["metadata"]!.map((x) => x)),
    paymentMethod: json["payment_method"],
    paymentMethodOptions: json["payment_method_options"] == null ? null : PaymentMethodOptions.fromJson(json["payment_method_options"]),
    paymentMethodTypes: json["payment_method_types"] == null ? [] : List<String>.from(json["payment_method_types"]!.map((x) => x)),
    setupFutureUsage: json["setup_future_usage"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "object": object,
    "amount": amount,
    "requiresAction": requiresAction,
    "amount_capturable": amountCapturable,
    "amount_details": amountDetails?.toJson(),
    "amount_received": amountReceived,
    "capture_method": captureMethod,
    "client_secret": clientSecret,
    "confirmation_method": confirmationMethod,
    "created": created,
    "currency": currency,
    "customer": customer,
    "description": description,
    "invoice": invoice,
    "latest_charge": latestCharge,
    "livemode": livemode,
    "metadata": metadata == null ? [] : List<dynamic>.from(metadata!.map((x) => x)),
    "payment_method": paymentMethod,
    "payment_method_options": paymentMethodOptions?.toJson(),
    "payment_method_types": paymentMethodTypes == null ? [] : List<dynamic>.from(paymentMethodTypes!.map((x) => x)),
    "setup_future_usage": setupFutureUsage,
    "status": status,
  };
}

class AmountDetails {
  List<dynamic>? tip;

  AmountDetails({
    this.tip,
  });

  factory AmountDetails.fromJson(Map<String, dynamic> json) => AmountDetails(
    tip: json["tip"] == null ? [] : List<dynamic>.from(json["tip"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "tip": tip == null ? [] : List<dynamic>.from(tip!.map((x) => x)),
  };
}

class PaymentMethodOptions {
  Card? card;
  List<dynamic>? cashapp;
  Link? link;
  UsBankAccount? usBankAccount;

  PaymentMethodOptions({
    this.card,
    this.cashapp,
    this.link,
    this.usBankAccount,
  });

  factory PaymentMethodOptions.fromJson(Map<String, dynamic> json) => PaymentMethodOptions(
    card: json["card"] == null ? null : Card.fromJson(json["card"]),
    cashapp: json["cashapp"] == null ? [] : List<dynamic>.from(json["cashapp"]!.map((x) => x)),
    link: json["link"] == null ? null : Link.fromJson(json["link"]),
    usBankAccount: json["us_bank_account"] == null ? null : UsBankAccount.fromJson(json["us_bank_account"]),
  );

  Map<String, dynamic> toJson() => {
    "card": card?.toJson(),
    "cashapp": cashapp == null ? [] : List<dynamic>.from(cashapp!.map((x) => x)),
    "link": link?.toJson(),
    "us_bank_account": usBankAccount?.toJson(),
  };
}

class Card {
  String? requestThreeDSecure;

  Card({
    this.requestThreeDSecure,
  });

  factory Card.fromJson(Map<String, dynamic> json) => Card(
    requestThreeDSecure: json["request_three_d_secure"],
  );

  Map<String, dynamic> toJson() => {
    "request_three_d_secure": requestThreeDSecure,
  };
}

class Link {
  Link();

  factory Link.fromJson(Map<String, dynamic> json) => Link(
  );

  Map<String, dynamic> toJson() => {
  };
}
class Errors {
  List<String>? paymentMethodId;
  List<String>? amount;
  List<String>? recurringPeriod;
  List<String>? subscriptionName;
  List<String>? name;
  List<String>? email;
  List<String>? donationFormId;
  List<String>? donorBillingComment;
  List<String>? anonymousDonation;
  List<String>? savePaymentMethod;

  Errors({
    this.paymentMethodId,
    this.amount,
    this.recurringPeriod,
    this.subscriptionName,
    this.name,
    this.email,
    this.donationFormId,
    this.donorBillingComment,
    this.anonymousDonation,
    this.savePaymentMethod,
  });

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
    paymentMethodId: json["paymentMethodId"] == null ? [] : List<String>.from(json["paymentMethodId"]!.map((x) => x)),
    amount: json["amount"] == null ? [] : List<String>.from(json["amount"]!.map((x) => x)),
    recurringPeriod: json["recurringPeriod"] == null ? [] : List<String>.from(json["recurringPeriod"]!.map((x) => x)),
    subscriptionName: json["subscriptionName"] == null ? [] : List<String>.from(json["subscriptionName"]!.map((x) => x)),
    name: json["name"] == null ? [] : List<String>.from(json["name"]!.map((x) => x)),
    email: json["email"] == null ? [] : List<String>.from(json["email"]!.map((x) => x)),
    donationFormId: json["donationFormId"] == null ? [] : List<String>.from(json["donationFormId"]!.map((x) => x)),
    donorBillingComment: json["donorBillingComment"] == null ? [] : List<String>.from(json["donorBillingComment"]!.map((x) => x)),
    anonymousDonation: json["anonymousDonation"] == null ? [] : List<String>.from(json["anonymousDonation"]!.map((x) => x)),
    savePaymentMethod: json["savePaymentMethod"] == null ? [] : List<String>.from(json["savePaymentMethod"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "paymentMethodId": paymentMethodId == null ? [] : List<dynamic>.from(paymentMethodId!.map((x) => x)),
    "amount": amount == null ? [] : List<dynamic>.from(amount!.map((x) => x)),
    "recurringPeriod": recurringPeriod == null ? [] : List<dynamic>.from(recurringPeriod!.map((x) => x)),
    "subscriptionName": subscriptionName == null ? [] : List<dynamic>.from(subscriptionName!.map((x) => x)),
    "name": name == null ? [] : List<dynamic>.from(name!.map((x) => x)),
    "email": email == null ? [] : List<dynamic>.from(email!.map((x) => x)),
    "donationFormId": donationFormId == null ? [] : List<dynamic>.from(donationFormId!.map((x) => x)),
    "donorBillingComment": donorBillingComment == null ? [] : List<dynamic>.from(donorBillingComment!.map((x) => x)),
    "anonymousDonation": anonymousDonation == null ? [] : List<dynamic>.from(anonymousDonation!.map((x) => x)),
    "savePaymentMethod": savePaymentMethod == null ? [] : List<dynamic>.from(savePaymentMethod!.map((x) => x)),
  };
}


class UsBankAccount {
  List<dynamic>? mandateOptions;
  String? verificationMethod;

  UsBankAccount({
    this.mandateOptions,
    this.verificationMethod,
  });

  factory UsBankAccount.fromJson(Map<String, dynamic> json) => UsBankAccount(
    mandateOptions: json["mandate_options"] == null ? [] : List<dynamic>.from(json["mandate_options"]!.map((x) => x)),
    verificationMethod: json["verification_method"],
  );

  Map<String, dynamic> toJson() => {
    "mandate_options": mandateOptions == null ? [] : List<dynamic>.from(mandateOptions!.map((x) => x)),
    "verification_method": verificationMethod,
  };
}
