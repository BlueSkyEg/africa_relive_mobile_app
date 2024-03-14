// To parse this JSON data, do
//
//     final singlePayment = singlePaymentFromJson(jsonString);

import 'dart:convert';

SinglePayment singlePaymentFromJson(String str) => SinglePayment.fromJson(json.decode(str));

String singlePaymentToJson(SinglePayment data) => json.encode(data.toJson());

class SinglePayment {
  bool? success;
  String? message;
  Data? data;
  Errors? errors;

  SinglePayment({
    this.success,
    this.message,
    this.data,
    this.errors,
  });

  factory SinglePayment.fromJson(Map<String, dynamic> json) => SinglePayment(
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
  String? object;
  int? amount;
  int? amountCapturable;
  AmountDetails? amountDetails;
  int? amountReceived;
  String? captureMethod;
  bool? requiresAction;
  String? clientSecret;
  String? confirmationMethod;
  int? created;
  String? currency;
  Customer? customer;
  String? description;
  String? latestCharge;
  bool? livemode;
  List<dynamic>? metadata;
  PaymentMethod? paymentMethod;
  PaymentMethodOptions? paymentMethodOptions;
  List<String>? paymentMethodTypes;
  String? statementDescriptor;
  String? status;

  Data({
    this.id,
    this.object,
    this.amount,
    this.amountCapturable,
    this.amountDetails,
    this.amountReceived,
    this.captureMethod,
    this.requiresAction,
    this.clientSecret,
    this.confirmationMethod,
    this.created,
    this.currency,
    this.customer,
    this.description,
    this.latestCharge,
    this.livemode,
    this.metadata,
    this.paymentMethod,
    this.paymentMethodOptions,
    this.paymentMethodTypes,
    this.statementDescriptor,
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
    requiresAction: json["requiresAction"],
    clientSecret: json["clientSecret"],
    confirmationMethod: json["confirmation_method"],
    created: json["created"],
    currency: json["currency"],
    customer: json["customer"] == null ? null : Customer.fromJson(json["customer"]),
    description: json["description"],
    latestCharge: json["latest_charge"],
    livemode: json["livemode"],
    metadata: json["metadata"] == null ? [] : List<dynamic>.from(json["metadata"]!.map((x) => x)),
    paymentMethod: json["payment_method"] == null ? null : PaymentMethod.fromJson(json["payment_method"]),
    paymentMethodOptions: json["payment_method_options"] == null ? null : PaymentMethodOptions.fromJson(json["payment_method_options"]),
    paymentMethodTypes: json["payment_method_types"] == null ? [] : List<String>.from(json["payment_method_types"]!.map((x) => x)),
    statementDescriptor: json["statement_descriptor"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "object": object,
    "amount": amount,
    "amount_capturable": amountCapturable,
    "amount_details": amountDetails?.toJson(),
    "amount_received": amountReceived,
    "capture_method": captureMethod,
    "requiresAction": requiresAction,
    "clientSecret": clientSecret,
    "confirmation_method": confirmationMethod,
    "created": created,
    "currency": currency,
    "customer": customer?.toJson(),
    "description": description,
    "latest_charge": latestCharge,
    "livemode": livemode,
    "metadata": metadata == null ? [] : List<dynamic>.from(metadata!.map((x) => x)),
    "payment_method": paymentMethod?.toJson(),
    "payment_method_options": paymentMethodOptions?.toJson(),
    "payment_method_types": paymentMethodTypes == null ? [] : List<dynamic>.from(paymentMethodTypes!.map((x) => x)),
    "statement_descriptor": statementDescriptor,
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

class Customer {
  String? id;
  String? object;
  int? balance;
  int? created;
  bool? delinquent;
  String? email;
  String? invoicePrefix;
  bool? livemode;
  List<dynamic>? metadata;
  String? name;
  int? nextInvoiceSequence;
  List<dynamic>? preferredLocales;
  String? taxExempt;

  Customer({
    this.id,
    this.object,
    this.balance,
    this.created,
    this.delinquent,
    this.email,
    this.invoicePrefix,
    this.livemode,
    this.metadata,
    this.name,
    this.nextInvoiceSequence,
    this.preferredLocales,
    this.taxExempt,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    id: json["id"],
    object: json["object"],
    balance: json["balance"],
    created: json["created"],
    delinquent: json["delinquent"],
    email: json["email"],
    invoicePrefix: json["invoice_prefix"],
    livemode: json["livemode"],
    metadata: json["metadata"] == null ? [] : List<dynamic>.from(json["metadata"]!.map((x) => x)),
    name: json["name"],
    nextInvoiceSequence: json["next_invoice_sequence"],
    preferredLocales: json["preferred_locales"] == null ? [] : List<dynamic>.from(json["preferred_locales"]!.map((x) => x)),
    taxExempt: json["tax_exempt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "object": object,
    "balance": balance,
    "created": created,
    "delinquent": delinquent,
    "email": email,
    "invoice_prefix": invoicePrefix,
    "livemode": livemode,
    "metadata": metadata == null ? [] : List<dynamic>.from(metadata!.map((x) => x)),
    "name": name,
    "next_invoice_sequence": nextInvoiceSequence,
    "preferred_locales": preferredLocales == null ? [] : List<dynamic>.from(preferredLocales!.map((x) => x)),
    "tax_exempt": taxExempt,
  };
}

class PaymentMethod {
  String? id;
  String? object;
  BillingDetails? billingDetails;
  PaymentMethodCard? card;
  int? created;
  bool? livemode;
  List<dynamic>? metadata;
  String? type;

  PaymentMethod({
    this.id,
    this.object,
    this.billingDetails,
    this.card,
    this.created,
    this.livemode,
    this.metadata,
    this.type,
  });

  factory PaymentMethod.fromJson(Map<String, dynamic> json) => PaymentMethod(
    id: json["id"],
    object: json["object"],
    billingDetails: json["billing_details"] == null ? null : BillingDetails.fromJson(json["billing_details"]),
    card: json["card"] == null ? null : PaymentMethodCard.fromJson(json["card"]),
    created: json["created"],
    livemode: json["livemode"],
    metadata: json["metadata"] == null ? [] : List<dynamic>.from(json["metadata"]!.map((x) => x)),
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "object": object,
    "billing_details": billingDetails?.toJson(),
    "card": card?.toJson(),
    "created": created,
    "livemode": livemode,
    "metadata": metadata == null ? [] : List<dynamic>.from(metadata!.map((x) => x)),
    "type": type,
  };
}

class BillingDetails {
  Address? address;
  String? email;
  String? name;

  BillingDetails({
    this.address,
    this.email,
    this.name,
  });

  factory BillingDetails.fromJson(Map<String, dynamic> json) => BillingDetails(
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
    email: json["email"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "address": address?.toJson(),
    "email": email,
    "name": name,
  };
}

class Address {
  String? city;
  String? country;
  String? line1;
  String? postalCode;
  String? state;

  Address({
    this.city,
    this.country,
    this.line1,
    this.postalCode,
    this.state,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    city: json["city"],
    country: json["country"],
    line1: json["line1"],
    postalCode: json["postal_code"],
    state: json["state"],
  );

  Map<String, dynamic> toJson() => {
    "city": city,
    "country": country,
    "line1": line1,
    "postal_code": postalCode,
    "state": state,
  };
}

class PaymentMethodCard {
  String? brand;
  Checks? checks;
  String? country;
  String? displayBrand;
  int? expMonth;
  int? expYear;
  String? fingerprint;
  String? funding;
  String? last4;
  Networks? networks;
  ThreeDSecureUsage? threeDSecureUsage;

  PaymentMethodCard({
    this.brand,
    this.checks,
    this.country,
    this.displayBrand,
    this.expMonth,
    this.expYear,
    this.fingerprint,
    this.funding,
    this.last4,
    this.networks,
    this.threeDSecureUsage,
  });

  factory PaymentMethodCard.fromJson(Map<String, dynamic> json) => PaymentMethodCard(
    brand: json["brand"],
    checks: json["checks"] == null ? null : Checks.fromJson(json["checks"]),
    country: json["country"],
    displayBrand: json["display_brand"],
    expMonth: json["exp_month"],
    expYear: json["exp_year"],
    fingerprint: json["fingerprint"],
    funding: json["funding"],
    last4: json["last4"],
    networks: json["networks"] == null ? null : Networks.fromJson(json["networks"]),
    threeDSecureUsage: json["three_d_secure_usage"] == null ? null : ThreeDSecureUsage.fromJson(json["three_d_secure_usage"]),
  );

  Map<String, dynamic> toJson() => {
    "brand": brand,
    "checks": checks?.toJson(),
    "country": country,
    "display_brand": displayBrand,
    "exp_month": expMonth,
    "exp_year": expYear,
    "fingerprint": fingerprint,
    "funding": funding,
    "last4": last4,
    "networks": networks?.toJson(),
    "three_d_secure_usage": threeDSecureUsage?.toJson(),
  };
}

class Checks {
  String? addressLine1Check;
  String? addressPostalCodeCheck;
  String? cvcCheck;

  Checks({
    this.addressLine1Check,
    this.addressPostalCodeCheck,
    this.cvcCheck,
  });

  factory Checks.fromJson(Map<String, dynamic> json) => Checks(
    addressLine1Check: json["address_line1_check"],
    addressPostalCodeCheck: json["address_postal_code_check"],
    cvcCheck: json["cvc_check"],
  );

  Map<String, dynamic> toJson() => {
    "address_line1_check": addressLine1Check,
    "address_postal_code_check": addressPostalCodeCheck,
    "cvc_check": cvcCheck,
  };
}

class Networks {
  List<String>? available;

  Networks({
    this.available,
  });

  factory Networks.fromJson(Map<String, dynamic> json) => Networks(
    available: json["available"] == null ? [] : List<String>.from(json["available"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "available": available == null ? [] : List<dynamic>.from(available!.map((x) => x)),
  };
}

class ThreeDSecureUsage {
  bool? supported;

  ThreeDSecureUsage({
    this.supported,
  });

  factory ThreeDSecureUsage.fromJson(Map<String, dynamic> json) => ThreeDSecureUsage(
    supported: json["supported"],
  );

  Map<String, dynamic> toJson() => {
    "supported": supported,
  };
}

class PaymentMethodOptions {
  PaymentMethodOptionsCard? card;

  PaymentMethodOptions({
    this.card,
  });

  factory PaymentMethodOptions.fromJson(Map<String, dynamic> json) => PaymentMethodOptions(
    card: json["card"] == null ? null : PaymentMethodOptionsCard.fromJson(json["card"]),
  );

  Map<String, dynamic> toJson() => {
    "card": card?.toJson(),
  };
}

class PaymentMethodOptionsCard {
  String? requestThreeDSecure;

  PaymentMethodOptionsCard({
    this.requestThreeDSecure,
  });

  factory PaymentMethodOptionsCard.fromJson(Map<String, dynamic> json) => PaymentMethodOptionsCard(
    requestThreeDSecure: json["request_three_d_secure"],
  );

  Map<String, dynamic> toJson() => {
    "request_three_d_secure": requestThreeDSecure,
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
