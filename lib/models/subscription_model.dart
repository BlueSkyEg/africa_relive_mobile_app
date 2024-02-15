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

  SubscriptionModel({
    this.success,
    this.message,
    this.data,
  });

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) => SubscriptionModel(
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
  Subscription? subscription;
  String? clientSecret;

  Data({
    this.subscription,
    this.clientSecret
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    subscription: json["subscription"] == null ? null : Subscription.fromJson(json["subscription"]),
    clientSecret: json["clientSecret"],

  );

  Map<String, dynamic> toJson() => {
    "subscription": subscription?.toJson(),
    "clientSecret": clientSecret,
  };
}

class Subscription {
  String? id;
  String? object;
  dynamic application;
  dynamic applicationFeePercent;
  SubscriptionAutomaticTax? automaticTax;
  int? billingCycleAnchor;
  dynamic billingCycleAnchorConfig;
  dynamic billingThresholds;
  dynamic cancelAt;
  bool? cancelAtPeriodEnd;
  dynamic canceledAt;
  CancellationDetails? cancellationDetails;
  String? collectionMethod;
  int? created;
  String? currency;
  int? currentPeriodEnd;
  int? currentPeriodStart;
  String? customer;
  dynamic daysUntilDue;
  String? defaultPaymentMethod;
  dynamic defaultSource;
  List<dynamic>? defaultTaxRates;
  dynamic description;
  dynamic discount;
  dynamic endedAt;
  InvoiceSettings? invoiceSettings;
  Items? items;
  LatestInvoice? latestInvoice;
  bool? livemode;
  List<dynamic>? metadata;
  dynamic nextPendingInvoiceItemInvoice;
  dynamic onBehalfOf;
  dynamic pauseCollection;
  SubscriptionPaymentSettings? paymentSettings;
  dynamic pendingInvoiceItemInterval;
  dynamic pendingSetupIntent;
  dynamic pendingUpdate;
  Plan? plan;
  int? quantity;
  dynamic schedule;
  int? startDate;
  String? status;
  dynamic testClock;
  dynamic transferData;
  dynamic trialEnd;
  TrialSettings? trialSettings;
  dynamic trialStart;

  Subscription({
    this.id,
    this.object,
    this.application,
    this.applicationFeePercent,
    this.automaticTax,
    this.billingCycleAnchor,
    this.billingCycleAnchorConfig,
    this.billingThresholds,
    this.cancelAt,
    this.cancelAtPeriodEnd,
    this.canceledAt,
    this.cancellationDetails,
    this.collectionMethod,
    this.created,
    this.currency,
    this.currentPeriodEnd,
    this.currentPeriodStart,
    this.customer,
    this.daysUntilDue,
    this.defaultPaymentMethod,
    this.defaultSource,
    this.defaultTaxRates,
    this.description,
    this.discount,
    this.endedAt,
    this.invoiceSettings,
    this.items,
    this.latestInvoice,
    this.livemode,
    this.metadata,
    this.nextPendingInvoiceItemInvoice,
    this.onBehalfOf,
    this.pauseCollection,
    this.paymentSettings,
    this.pendingInvoiceItemInterval,
    this.pendingSetupIntent,
    this.pendingUpdate,
    this.plan,
    this.quantity,
    this.schedule,
    this.startDate,
    this.status,
    this.testClock,
    this.transferData,
    this.trialEnd,
    this.trialSettings,
    this.trialStart,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
    id: json["id"],
    object: json["object"],
    application: json["application"],
    applicationFeePercent: json["application_fee_percent"],
    automaticTax: json["automatic_tax"] == null ? null : SubscriptionAutomaticTax.fromJson(json["automatic_tax"]),
    billingCycleAnchor: json["billing_cycle_anchor"],
    billingCycleAnchorConfig: json["billing_cycle_anchor_config"],
    billingThresholds: json["billing_thresholds"],
    cancelAt: json["cancel_at"],
    cancelAtPeriodEnd: json["cancel_at_period_end"],
    canceledAt: json["canceled_at"],
    cancellationDetails: json["cancellation_details"] == null ? null : CancellationDetails.fromJson(json["cancellation_details"]),
    collectionMethod: json["collection_method"],
    created: json["created"],
    currency: json["currency"],
    currentPeriodEnd: json["current_period_end"],
    currentPeriodStart: json["current_period_start"],
    customer: json["customer"],
    daysUntilDue: json["days_until_due"],
    defaultPaymentMethod: json["default_payment_method"],
    defaultSource: json["default_source"],
    defaultTaxRates: json["default_tax_rates"] == null ? [] : List<dynamic>.from(json["default_tax_rates"]!.map((x) => x)),
    description: json["description"],
    discount: json["discount"],
    endedAt: json["ended_at"],
    invoiceSettings: json["invoice_settings"] == null ? null : InvoiceSettings.fromJson(json["invoice_settings"]),
    items: json["items"] == null ? null : Items.fromJson(json["items"]),
    latestInvoice: json["latest_invoice"] == null ? null : LatestInvoice.fromJson(json["latest_invoice"]),
    livemode: json["livemode"],
    metadata: json["metadata"] == null ? [] : List<dynamic>.from(json["metadata"]!.map((x) => x)),
    nextPendingInvoiceItemInvoice: json["next_pending_invoice_item_invoice"],
    onBehalfOf: json["on_behalf_of"],
    pauseCollection: json["pause_collection"],
    paymentSettings: json["payment_settings"] == null ? null : SubscriptionPaymentSettings.fromJson(json["payment_settings"]),
    pendingInvoiceItemInterval: json["pending_invoice_item_interval"],
    pendingSetupIntent: json["pending_setup_intent"],
    pendingUpdate: json["pending_update"],
    plan: json["plan"] == null ? null : Plan.fromJson(json["plan"]),
    quantity: json["quantity"],
    schedule: json["schedule"],
    startDate: json["start_date"],
    status: json["status"],
    testClock: json["test_clock"],
    transferData: json["transfer_data"],
    trialEnd: json["trial_end"],
    trialSettings: json["trial_settings"] == null ? null : TrialSettings.fromJson(json["trial_settings"]),
    trialStart: json["trial_start"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "object": object,
    "application": application,
    "application_fee_percent": applicationFeePercent,
    "automatic_tax": automaticTax?.toJson(),
    "billing_cycle_anchor": billingCycleAnchor,
    "billing_cycle_anchor_config": billingCycleAnchorConfig,
    "billing_thresholds": billingThresholds,
    "cancel_at": cancelAt,
    "cancel_at_period_end": cancelAtPeriodEnd,
    "canceled_at": canceledAt,
    "cancellation_details": cancellationDetails?.toJson(),
    "collection_method": collectionMethod,
    "created": created,
    "currency": currency,
    "current_period_end": currentPeriodEnd,
    "current_period_start": currentPeriodStart,
    "customer": customer,
    "days_until_due": daysUntilDue,
    "default_payment_method": defaultPaymentMethod,
    "default_source": defaultSource,
    "default_tax_rates": defaultTaxRates == null ? [] : List<dynamic>.from(defaultTaxRates!.map((x) => x)),
    "description": description,
    "discount": discount,
    "ended_at": endedAt,
    "invoice_settings": invoiceSettings?.toJson(),
    "items": items?.toJson(),
    "latest_invoice": latestInvoice?.toJson(),
    "livemode": livemode,
    "metadata": metadata == null ? [] : List<dynamic>.from(metadata!.map((x) => x)),
    "next_pending_invoice_item_invoice": nextPendingInvoiceItemInvoice,
    "on_behalf_of": onBehalfOf,
    "pause_collection": pauseCollection,
    "payment_settings": paymentSettings?.toJson(),
    "pending_invoice_item_interval": pendingInvoiceItemInterval,
    "pending_setup_intent": pendingSetupIntent,
    "pending_update": pendingUpdate,
    "plan": plan?.toJson(),
    "quantity": quantity,
    "schedule": schedule,
    "start_date": startDate,
    "status": status,
    "test_clock": testClock,
    "transfer_data": transferData,
    "trial_end": trialEnd,
    "trial_settings": trialSettings?.toJson(),
    "trial_start": trialStart,
  };
}

class SubscriptionAutomaticTax {
  bool? enabled;
  dynamic liability;

  SubscriptionAutomaticTax({
    this.enabled,
    this.liability,
  });

  factory SubscriptionAutomaticTax.fromJson(Map<String, dynamic> json) => SubscriptionAutomaticTax(
    enabled: json["enabled"],
    liability: json["liability"],
  );

  Map<String, dynamic> toJson() => {
    "enabled": enabled,
    "liability": liability,
  };
}

class CancellationDetails {
  dynamic comment;
  dynamic feedback;
  dynamic reason;

  CancellationDetails({
    this.comment,
    this.feedback,
    this.reason,
  });

  factory CancellationDetails.fromJson(Map<String, dynamic> json) => CancellationDetails(
    comment: json["comment"],
    feedback: json["feedback"],
    reason: json["reason"],
  );

  Map<String, dynamic> toJson() => {
    "comment": comment,
    "feedback": feedback,
    "reason": reason,
  };
}

class InvoiceSettings {
  dynamic accountTaxIds;
  Issuer? issuer;

  InvoiceSettings({
    this.accountTaxIds,
    this.issuer,
  });

  factory InvoiceSettings.fromJson(Map<String, dynamic> json) => InvoiceSettings(
    accountTaxIds: json["account_tax_ids"],
    issuer: json["issuer"] == null ? null : Issuer.fromJson(json["issuer"]),
  );

  Map<String, dynamic> toJson() => {
    "account_tax_ids": accountTaxIds,
    "issuer": issuer?.toJson(),
  };
}

class Issuer {
  String? type;

  Issuer({
    this.type,
  });

  factory Issuer.fromJson(Map<String, dynamic> json) => Issuer(
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
  };
}

class Items {
  String? object;
  List<ItemsDatum>? data;
  bool? hasMore;
  int? totalCount;
  String? url;

  Items({
    this.object,
    this.data,
    this.hasMore,
    this.totalCount,
    this.url,
  });

  factory Items.fromJson(Map<String, dynamic> json) => Items(
    object: json["object"],
    data: json["data"] == null ? [] : List<ItemsDatum>.from(json["data"]!.map((x) => ItemsDatum.fromJson(x))),
    hasMore: json["has_more"],
    totalCount: json["total_count"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "object": object,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "has_more": hasMore,
    "total_count": totalCount,
    "url": url,
  };
}

class ItemsDatum {
  String? id;
  String? object;
  dynamic billingThresholds;
  int? created;
  List<dynamic>? metadata;
  Plan? plan;
  Price? price;
  int? quantity;
  String? subscription;
  List<dynamic>? taxRates;

  ItemsDatum({
    this.id,
    this.object,
    this.billingThresholds,
    this.created,
    this.metadata,
    this.plan,
    this.price,
    this.quantity,
    this.subscription,
    this.taxRates,
  });

  factory ItemsDatum.fromJson(Map<String, dynamic> json) => ItemsDatum(
    id: json["id"],
    object: json["object"],
    billingThresholds: json["billing_thresholds"],
    created: json["created"],
    metadata: json["metadata"] == null ? [] : List<dynamic>.from(json["metadata"]!.map((x) => x)),
    plan: json["plan"] == null ? null : Plan.fromJson(json["plan"]),
    price: json["price"] == null ? null : Price.fromJson(json["price"]),
    quantity: json["quantity"],
    subscription: json["subscription"],
    taxRates: json["tax_rates"] == null ? [] : List<dynamic>.from(json["tax_rates"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "object": object,
    "billing_thresholds": billingThresholds,
    "created": created,
    "metadata": metadata == null ? [] : List<dynamic>.from(metadata!.map((x) => x)),
    "plan": plan?.toJson(),
    "price": price?.toJson(),
    "quantity": quantity,
    "subscription": subscription,
    "tax_rates": taxRates == null ? [] : List<dynamic>.from(taxRates!.map((x) => x)),
  };
}

class Plan {
  String? id;
  String? object;
  bool? active;
  dynamic aggregateUsage;
  int? amount;
  String? amountDecimal;
  String? billingScheme;
  int? created;
  String? currency;
  String? interval;
  int? intervalCount;
  bool? livemode;
  List<dynamic>? metadata;
  dynamic nickname;
  String? product;
  dynamic tiersMode;
  dynamic transformUsage;
  dynamic trialPeriodDays;
  String? usageType;

  Plan({
    this.id,
    this.object,
    this.active,
    this.aggregateUsage,
    this.amount,
    this.amountDecimal,
    this.billingScheme,
    this.created,
    this.currency,
    this.interval,
    this.intervalCount,
    this.livemode,
    this.metadata,
    this.nickname,
    this.product,
    this.tiersMode,
    this.transformUsage,
    this.trialPeriodDays,
    this.usageType,
  });

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
    id: json["id"],
    object: json["object"],
    active: json["active"],
    aggregateUsage: json["aggregate_usage"],
    amount: json["amount"],
    amountDecimal: json["amount_decimal"],
    billingScheme: json["billing_scheme"],
    created: json["created"],
    currency: json["currency"],
    interval: json["interval"],
    intervalCount: json["interval_count"],
    livemode: json["livemode"],
    metadata: json["metadata"] == null ? [] : List<dynamic>.from(json["metadata"]!.map((x) => x)),
    nickname: json["nickname"],
    product: json["product"],
    tiersMode: json["tiers_mode"],
    transformUsage: json["transform_usage"],
    trialPeriodDays: json["trial_period_days"],
    usageType: json["usage_type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "object": object,
    "active": active,
    "aggregate_usage": aggregateUsage,
    "amount": amount,
    "amount_decimal": amountDecimal,
    "billing_scheme": billingScheme,
    "created": created,
    "currency": currency,
    "interval": interval,
    "interval_count": intervalCount,
    "livemode": livemode,
    "metadata": metadata == null ? [] : List<dynamic>.from(metadata!.map((x) => x)),
    "nickname": nickname,
    "product": product,
    "tiers_mode": tiersMode,
    "transform_usage": transformUsage,
    "trial_period_days": trialPeriodDays,
    "usage_type": usageType,
  };
}

class Price {
  String? id;
  String? object;
  bool? active;
  String? billingScheme;
  int? created;
  String? currency;
  dynamic customUnitAmount;
  bool? livemode;
  dynamic lookupKey;
  List<dynamic>? metadata;
  dynamic nickname;
  String? product;
  Recurring? recurring;
  String? taxBehavior;
  dynamic tiersMode;
  dynamic transformQuantity;
  String? type;
  int? unitAmount;
  String? unitAmountDecimal;

  Price({
    this.id,
    this.object,
    this.active,
    this.billingScheme,
    this.created,
    this.currency,
    this.customUnitAmount,
    this.livemode,
    this.lookupKey,
    this.metadata,
    this.nickname,
    this.product,
    this.recurring,
    this.taxBehavior,
    this.tiersMode,
    this.transformQuantity,
    this.type,
    this.unitAmount,
    this.unitAmountDecimal,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    id: json["id"],
    object: json["object"],
    active: json["active"],
    billingScheme: json["billing_scheme"],
    created: json["created"],
    currency: json["currency"],
    customUnitAmount: json["custom_unit_amount"],
    livemode: json["livemode"],
    lookupKey: json["lookup_key"],
    metadata: json["metadata"] == null ? [] : List<dynamic>.from(json["metadata"]!.map((x) => x)),
    nickname: json["nickname"],
    product: json["product"],
    recurring: json["recurring"] == null ? null : Recurring.fromJson(json["recurring"]),
    taxBehavior: json["tax_behavior"],
    tiersMode: json["tiers_mode"],
    transformQuantity: json["transform_quantity"],
    type: json["type"],
    unitAmount: json["unit_amount"],
    unitAmountDecimal: json["unit_amount_decimal"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "object": object,
    "active": active,
    "billing_scheme": billingScheme,
    "created": created,
    "currency": currency,
    "custom_unit_amount": customUnitAmount,
    "livemode": livemode,
    "lookup_key": lookupKey,
    "metadata": metadata == null ? [] : List<dynamic>.from(metadata!.map((x) => x)),
    "nickname": nickname,
    "product": product,
    "recurring": recurring?.toJson(),
    "tax_behavior": taxBehavior,
    "tiers_mode": tiersMode,
    "transform_quantity": transformQuantity,
    "type": type,
    "unit_amount": unitAmount,
    "unit_amount_decimal": unitAmountDecimal,
  };
}

class Recurring {
  dynamic aggregateUsage;
  String? interval;
  int? intervalCount;
  dynamic trialPeriodDays;
  String? usageType;

  Recurring({
    this.aggregateUsage,
    this.interval,
    this.intervalCount,
    this.trialPeriodDays,
    this.usageType,
  });

  factory Recurring.fromJson(Map<String, dynamic> json) => Recurring(
    aggregateUsage: json["aggregate_usage"],
    interval: json["interval"],
    intervalCount: json["interval_count"],
    trialPeriodDays: json["trial_period_days"],
    usageType: json["usage_type"],
  );

  Map<String, dynamic> toJson() => {
    "aggregate_usage": aggregateUsage,
    "interval": interval,
    "interval_count": intervalCount,
    "trial_period_days": trialPeriodDays,
    "usage_type": usageType,
  };
}

class LatestInvoice {
  String? id;
  String? object;
  String? accountCountry;
  dynamic accountName;
  dynamic accountTaxIds;
  int? amountDue;
  int? amountPaid;
  int? amountRemaining;
  int? amountShipping;
  dynamic application;
  dynamic applicationFeeAmount;
  int? attemptCount;
  bool? attempted;
  bool? autoAdvance;
  LatestInvoiceAutomaticTax? automaticTax;
  String? billingReason;
  dynamic charge;
  String? collectionMethod;
  int? created;
  String? currency;
  dynamic customFields;
  String? customer;
  dynamic customerAddress;
  String? customerEmail;
  String? customerName;
  dynamic customerPhone;
  dynamic customerShipping;
  String? customerTaxExempt;
  List<dynamic>? customerTaxIds;
  dynamic defaultPaymentMethod;
  dynamic defaultSource;
  List<dynamic>? defaultTaxRates;
  dynamic description;
  dynamic discount;
  List<dynamic>? discounts;
  dynamic dueDate;
  int? effectiveAt;
  int? endingBalance;
  dynamic footer;
  dynamic fromInvoice;
  String? hostedInvoiceUrl;
  String? invoicePdf;
  Issuer? issuer;
  dynamic lastFinalizationError;
  dynamic latestRevision;
  Lines? lines;
  bool? livemode;
  List<dynamic>? metadata;
  dynamic nextPaymentAttempt;
  String? number;
  dynamic onBehalfOf;
  bool? paid;
  bool? paidOutOfBand;
  PaymentIntent? paymentIntent;
  LatestInvoicePaymentSettings? paymentSettings;
  int? periodEnd;
  int? periodStart;
  int? postPaymentCreditNotesAmount;
  int? prePaymentCreditNotesAmount;
  dynamic quote;
  dynamic receiptNumber;
  dynamic rendering;
  dynamic renderingOptions;
  dynamic shippingCost;
  dynamic shippingDetails;
  int? startingBalance;
  dynamic statementDescriptor;
  String? status;
  StatusTransitions? statusTransitions;
  String? subscription;
  SubscriptionDetails? subscriptionDetails;
  int? subtotal;
  int? subtotalExcludingTax;
  dynamic tax;
  dynamic testClock;
  int? total;
  List<dynamic>? totalDiscountAmounts;
  int? totalExcludingTax;
  List<dynamic>? totalTaxAmounts;
  dynamic transferData;
  int? webhooksDeliveredAt;

  LatestInvoice({
    this.id,
    this.object,
    this.accountCountry,
    this.accountName,
    this.accountTaxIds,
    this.amountDue,
    this.amountPaid,
    this.amountRemaining,
    this.amountShipping,
    this.application,
    this.applicationFeeAmount,
    this.attemptCount,
    this.attempted,
    this.autoAdvance,
    this.automaticTax,
    this.billingReason,
    this.charge,
    this.collectionMethod,
    this.created,
    this.currency,
    this.customFields,
    this.customer,
    this.customerAddress,
    this.customerEmail,
    this.customerName,
    this.customerPhone,
    this.customerShipping,
    this.customerTaxExempt,
    this.customerTaxIds,
    this.defaultPaymentMethod,
    this.defaultSource,
    this.defaultTaxRates,
    this.description,
    this.discount,
    this.discounts,
    this.dueDate,
    this.effectiveAt,
    this.endingBalance,
    this.footer,
    this.fromInvoice,
    this.hostedInvoiceUrl,
    this.invoicePdf,
    this.issuer,
    this.lastFinalizationError,
    this.latestRevision,
    this.lines,
    this.livemode,
    this.metadata,
    this.nextPaymentAttempt,
    this.number,
    this.onBehalfOf,
    this.paid,
    this.paidOutOfBand,
    this.paymentIntent,
    this.paymentSettings,
    this.periodEnd,
    this.periodStart,
    this.postPaymentCreditNotesAmount,
    this.prePaymentCreditNotesAmount,
    this.quote,
    this.receiptNumber,
    this.rendering,
    this.renderingOptions,
    this.shippingCost,
    this.shippingDetails,
    this.startingBalance,
    this.statementDescriptor,
    this.status,
    this.statusTransitions,
    this.subscription,
    this.subscriptionDetails,
    this.subtotal,
    this.subtotalExcludingTax,
    this.tax,
    this.testClock,
    this.total,
    this.totalDiscountAmounts,
    this.totalExcludingTax,
    this.totalTaxAmounts,
    this.transferData,
    this.webhooksDeliveredAt,
  });

  factory LatestInvoice.fromJson(Map<String, dynamic> json) => LatestInvoice(
    id: json["id"],
    object: json["object"],
    accountCountry: json["account_country"],
    accountName: json["account_name"],
    accountTaxIds: json["account_tax_ids"],
    amountDue: json["amount_due"],
    amountPaid: json["amount_paid"],
    amountRemaining: json["amount_remaining"],
    amountShipping: json["amount_shipping"],
    application: json["application"],
    applicationFeeAmount: json["application_fee_amount"],
    attemptCount: json["attempt_count"],
    attempted: json["attempted"],
    autoAdvance: json["auto_advance"],
    automaticTax: json["automatic_tax"] == null ? null : LatestInvoiceAutomaticTax.fromJson(json["automatic_tax"]),
    billingReason: json["billing_reason"],
    charge: json["charge"],
    collectionMethod: json["collection_method"],
    created: json["created"],
    currency: json["currency"],
    customFields: json["custom_fields"],
    customer: json["customer"],
    customerAddress: json["customer_address"],
    customerEmail: json["customer_email"],
    customerName: json["customer_name"],
    customerPhone: json["customer_phone"],
    customerShipping: json["customer_shipping"],
    customerTaxExempt: json["customer_tax_exempt"],
    customerTaxIds: json["customer_tax_ids"] == null ? [] : List<dynamic>.from(json["customer_tax_ids"]!.map((x) => x)),
    defaultPaymentMethod: json["default_payment_method"],
    defaultSource: json["default_source"],
    defaultTaxRates: json["default_tax_rates"] == null ? [] : List<dynamic>.from(json["default_tax_rates"]!.map((x) => x)),
    description: json["description"],
    discount: json["discount"],
    discounts: json["discounts"] == null ? [] : List<dynamic>.from(json["discounts"]!.map((x) => x)),
    dueDate: json["due_date"],
    effectiveAt: json["effective_at"],
    endingBalance: json["ending_balance"],
    footer: json["footer"],
    fromInvoice: json["from_invoice"],
    hostedInvoiceUrl: json["hosted_invoice_url"],
    invoicePdf: json["invoice_pdf"],
    issuer: json["issuer"] == null ? null : Issuer.fromJson(json["issuer"]),
    lastFinalizationError: json["last_finalization_error"],
    latestRevision: json["latest_revision"],
    lines: json["lines"] == null ? null : Lines.fromJson(json["lines"]),
    livemode: json["livemode"],
    metadata: json["metadata"] == null ? [] : List<dynamic>.from(json["metadata"]!.map((x) => x)),
    nextPaymentAttempt: json["next_payment_attempt"],
    number: json["number"],
    onBehalfOf: json["on_behalf_of"],
    paid: json["paid"],
    paidOutOfBand: json["paid_out_of_band"],
    paymentIntent: json["payment_intent"] == null ? null : PaymentIntent.fromJson(json["payment_intent"]),
    paymentSettings: json["payment_settings"] == null ? null : LatestInvoicePaymentSettings.fromJson(json["payment_settings"]),
    periodEnd: json["period_end"],
    periodStart: json["period_start"],
    postPaymentCreditNotesAmount: json["post_payment_credit_notes_amount"],
    prePaymentCreditNotesAmount: json["pre_payment_credit_notes_amount"],
    quote: json["quote"],
    receiptNumber: json["receipt_number"],
    rendering: json["rendering"],
    renderingOptions: json["rendering_options"],
    shippingCost: json["shipping_cost"],
    shippingDetails: json["shipping_details"],
    startingBalance: json["starting_balance"],
    statementDescriptor: json["statement_descriptor"],
    status: json["status"],
    statusTransitions: json["status_transitions"] == null ? null : StatusTransitions.fromJson(json["status_transitions"]),
    subscription: json["subscription"],
    subscriptionDetails: json["subscription_details"] == null ? null : SubscriptionDetails.fromJson(json["subscription_details"]),
    subtotal: json["subtotal"],
    subtotalExcludingTax: json["subtotal_excluding_tax"],
    tax: json["tax"],
    testClock: json["test_clock"],
    total: json["total"],
    totalDiscountAmounts: json["total_discount_amounts"] == null ? [] : List<dynamic>.from(json["total_discount_amounts"]!.map((x) => x)),
    totalExcludingTax: json["total_excluding_tax"],
    totalTaxAmounts: json["total_tax_amounts"] == null ? [] : List<dynamic>.from(json["total_tax_amounts"]!.map((x) => x)),
    transferData: json["transfer_data"],
    webhooksDeliveredAt: json["webhooks_delivered_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "object": object,
    "account_country": accountCountry,
    "account_name": accountName,
    "account_tax_ids": accountTaxIds,
    "amount_due": amountDue,
    "amount_paid": amountPaid,
    "amount_remaining": amountRemaining,
    "amount_shipping": amountShipping,
    "application": application,
    "application_fee_amount": applicationFeeAmount,
    "attempt_count": attemptCount,
    "attempted": attempted,
    "auto_advance": autoAdvance,
    "automatic_tax": automaticTax?.toJson(),
    "billing_reason": billingReason,
    "charge": charge,
    "collection_method": collectionMethod,
    "created": created,
    "currency": currency,
    "custom_fields": customFields,
    "customer": customer,
    "customer_address": customerAddress,
    "customer_email": customerEmail,
    "customer_name": customerName,
    "customer_phone": customerPhone,
    "customer_shipping": customerShipping,
    "customer_tax_exempt": customerTaxExempt,
    "customer_tax_ids": customerTaxIds == null ? [] : List<dynamic>.from(customerTaxIds!.map((x) => x)),
    "default_payment_method": defaultPaymentMethod,
    "default_source": defaultSource,
    "default_tax_rates": defaultTaxRates == null ? [] : List<dynamic>.from(defaultTaxRates!.map((x) => x)),
    "description": description,
    "discount": discount,
    "discounts": discounts == null ? [] : List<dynamic>.from(discounts!.map((x) => x)),
    "due_date": dueDate,
    "effective_at": effectiveAt,
    "ending_balance": endingBalance,
    "footer": footer,
    "from_invoice": fromInvoice,
    "hosted_invoice_url": hostedInvoiceUrl,
    "invoice_pdf": invoicePdf,
    "issuer": issuer?.toJson(),
    "last_finalization_error": lastFinalizationError,
    "latest_revision": latestRevision,
    "lines": lines?.toJson(),
    "livemode": livemode,
    "metadata": metadata == null ? [] : List<dynamic>.from(metadata!.map((x) => x)),
    "next_payment_attempt": nextPaymentAttempt,
    "number": number,
    "on_behalf_of": onBehalfOf,
    "paid": paid,
    "paid_out_of_band": paidOutOfBand,
    "payment_intent": paymentIntent?.toJson(),
    "payment_settings": paymentSettings?.toJson(),
    "period_end": periodEnd,
    "period_start": periodStart,
    "post_payment_credit_notes_amount": postPaymentCreditNotesAmount,
    "pre_payment_credit_notes_amount": prePaymentCreditNotesAmount,
    "quote": quote,
    "receipt_number": receiptNumber,
    "rendering": rendering,
    "rendering_options": renderingOptions,
    "shipping_cost": shippingCost,
    "shipping_details": shippingDetails,
    "starting_balance": startingBalance,
    "statement_descriptor": statementDescriptor,
    "status": status,
    "status_transitions": statusTransitions?.toJson(),
    "subscription": subscription,
    "subscription_details": subscriptionDetails?.toJson(),
    "subtotal": subtotal,
    "subtotal_excluding_tax": subtotalExcludingTax,
    "tax": tax,
    "test_clock": testClock,
    "total": total,
    "total_discount_amounts": totalDiscountAmounts == null ? [] : List<dynamic>.from(totalDiscountAmounts!.map((x) => x)),
    "total_excluding_tax": totalExcludingTax,
    "total_tax_amounts": totalTaxAmounts == null ? [] : List<dynamic>.from(totalTaxAmounts!.map((x) => x)),
    "transfer_data": transferData,
    "webhooks_delivered_at": webhooksDeliveredAt,
  };
}

class LatestInvoiceAutomaticTax {
  bool? enabled;
  dynamic liability;
  dynamic status;

  LatestInvoiceAutomaticTax({
    this.enabled,
    this.liability,
    this.status,
  });

  factory LatestInvoiceAutomaticTax.fromJson(Map<String, dynamic> json) => LatestInvoiceAutomaticTax(
    enabled: json["enabled"],
    liability: json["liability"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "enabled": enabled,
    "liability": liability,
    "status": status,
  };
}

class Lines {
  String? object;
  List<LinesDatum>? data;
  bool? hasMore;
  int? totalCount;
  String? url;

  Lines({
    this.object,
    this.data,
    this.hasMore,
    this.totalCount,
    this.url,
  });

  factory Lines.fromJson(Map<String, dynamic> json) => Lines(
    object: json["object"],
    data: json["data"] == null ? [] : List<LinesDatum>.from(json["data"]!.map((x) => LinesDatum.fromJson(x))),
    hasMore: json["has_more"],
    totalCount: json["total_count"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "object": object,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "has_more": hasMore,
    "total_count": totalCount,
    "url": url,
  };
}

class LinesDatum {
  String? id;
  String? object;
  int? amount;
  int? amountExcludingTax;
  String? currency;
  String? description;
  List<dynamic>? discountAmounts;
  bool? discountable;
  List<dynamic>? discounts;
  bool? livemode;
  List<dynamic>? metadata;
  Period? period;
  Plan? plan;
  Price? price;
  bool? proration;
  ProrationDetails? prorationDetails;
  int? quantity;
  String? subscription;
  String? subscriptionItem;
  List<dynamic>? taxAmounts;
  List<dynamic>? taxRates;
  String? type;
  String? unitAmountExcludingTax;

  LinesDatum({
    this.id,
    this.object,
    this.amount,
    this.amountExcludingTax,
    this.currency,
    this.description,
    this.discountAmounts,
    this.discountable,
    this.discounts,
    this.livemode,
    this.metadata,
    this.period,
    this.plan,
    this.price,
    this.proration,
    this.prorationDetails,
    this.quantity,
    this.subscription,
    this.subscriptionItem,
    this.taxAmounts,
    this.taxRates,
    this.type,
    this.unitAmountExcludingTax,
  });

  factory LinesDatum.fromJson(Map<String, dynamic> json) => LinesDatum(
    id: json["id"],
    object: json["object"],
    amount: json["amount"],
    amountExcludingTax: json["amount_excluding_tax"],
    currency: json["currency"],
    description: json["description"],
    discountAmounts: json["discount_amounts"] == null ? [] : List<dynamic>.from(json["discount_amounts"]!.map((x) => x)),
    discountable: json["discountable"],
    discounts: json["discounts"] == null ? [] : List<dynamic>.from(json["discounts"]!.map((x) => x)),
    livemode: json["livemode"],
    metadata: json["metadata"] == null ? [] : List<dynamic>.from(json["metadata"]!.map((x) => x)),
    period: json["period"] == null ? null : Period.fromJson(json["period"]),
    plan: json["plan"] == null ? null : Plan.fromJson(json["plan"]),
    price: json["price"] == null ? null : Price.fromJson(json["price"]),
    proration: json["proration"],
    prorationDetails: json["proration_details"] == null ? null : ProrationDetails.fromJson(json["proration_details"]),
    quantity: json["quantity"],
    subscription: json["subscription"],
    subscriptionItem: json["subscription_item"],
    taxAmounts: json["tax_amounts"] == null ? [] : List<dynamic>.from(json["tax_amounts"]!.map((x) => x)),
    taxRates: json["tax_rates"] == null ? [] : List<dynamic>.from(json["tax_rates"]!.map((x) => x)),
    type: json["type"],
    unitAmountExcludingTax: json["unit_amount_excluding_tax"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "object": object,
    "amount": amount,
    "amount_excluding_tax": amountExcludingTax,
    "currency": currency,
    "description": description,
    "discount_amounts": discountAmounts == null ? [] : List<dynamic>.from(discountAmounts!.map((x) => x)),
    "discountable": discountable,
    "discounts": discounts == null ? [] : List<dynamic>.from(discounts!.map((x) => x)),
    "livemode": livemode,
    "metadata": metadata == null ? [] : List<dynamic>.from(metadata!.map((x) => x)),
    "period": period?.toJson(),
    "plan": plan?.toJson(),
    "price": price?.toJson(),
    "proration": proration,
    "proration_details": prorationDetails?.toJson(),
    "quantity": quantity,
    "subscription": subscription,
    "subscription_item": subscriptionItem,
    "tax_amounts": taxAmounts == null ? [] : List<dynamic>.from(taxAmounts!.map((x) => x)),
    "tax_rates": taxRates == null ? [] : List<dynamic>.from(taxRates!.map((x) => x)),
    "type": type,
    "unit_amount_excluding_tax": unitAmountExcludingTax,
  };
}

class Period {
  int? end;
  int? start;

  Period({
    this.end,
    this.start,
  });

  factory Period.fromJson(Map<String, dynamic> json) => Period(
    end: json["end"],
    start: json["start"],
  );

  Map<String, dynamic> toJson() => {
    "end": end,
    "start": start,
  };
}

class ProrationDetails {
  dynamic creditedItems;

  ProrationDetails({
    this.creditedItems,
  });

  factory ProrationDetails.fromJson(Map<String, dynamic> json) => ProrationDetails(
    creditedItems: json["credited_items"],
  );

  Map<String, dynamic> toJson() => {
    "credited_items": creditedItems,
  };
}

class PaymentIntent {
  String? id;
  String? object;
  int? amount;
  int? amountCapturable;
  AmountDetails? amountDetails;
  int? amountReceived;
  dynamic application;
  dynamic applicationFeeAmount;
  dynamic automaticPaymentMethods;
  dynamic canceledAt;
  dynamic cancellationReason;
  String? captureMethod;
  String? clientSecret;
  String? confirmationMethod;
  int? created;
  String? currency;
  String? customer;
  String? description;
  String? invoice;
  dynamic lastPaymentError;
  dynamic latestCharge;
  bool? livemode;
  List<dynamic>? metadata;
  dynamic nextAction;
  dynamic onBehalfOf;
  String? paymentMethod;
  dynamic paymentMethodConfigurationDetails;
  PaymentMethodOptions? paymentMethodOptions;
  List<String>? paymentMethodTypes;
  dynamic processing;
  dynamic receiptEmail;
  dynamic review;
  String? setupFutureUsage;
  dynamic shipping;
  dynamic source;
  dynamic statementDescriptor;
  dynamic statementDescriptorSuffix;
  String? status;
  dynamic transferData;
  dynamic transferGroup;

  PaymentIntent({
    this.id,
    this.object,
    this.amount,
    this.amountCapturable,
    this.amountDetails,
    this.amountReceived,
    this.application,
    this.applicationFeeAmount,
    this.automaticPaymentMethods,
    this.canceledAt,
    this.cancellationReason,
    this.captureMethod,
    this.clientSecret,
    this.confirmationMethod,
    this.created,
    this.currency,
    this.customer,
    this.description,
    this.invoice,
    this.lastPaymentError,
    this.latestCharge,
    this.livemode,
    this.metadata,
    this.nextAction,
    this.onBehalfOf,
    this.paymentMethod,
    this.paymentMethodConfigurationDetails,
    this.paymentMethodOptions,
    this.paymentMethodTypes,
    this.processing,
    this.receiptEmail,
    this.review,
    this.setupFutureUsage,
    this.shipping,
    this.source,
    this.statementDescriptor,
    this.statementDescriptorSuffix,
    this.status,
    this.transferData,
    this.transferGroup,
  });

  factory PaymentIntent.fromJson(Map<String, dynamic> json) => PaymentIntent(
    id: json["id"],
    object: json["object"],
    amount: json["amount"],
    amountCapturable: json["amount_capturable"],
    amountDetails: json["amount_details"] == null ? null : AmountDetails.fromJson(json["amount_details"]),
    amountReceived: json["amount_received"],
    application: json["application"],
    applicationFeeAmount: json["application_fee_amount"],
    automaticPaymentMethods: json["automatic_payment_methods"],
    canceledAt: json["canceled_at"],
    cancellationReason: json["cancellation_reason"],
    captureMethod: json["capture_method"],
    clientSecret: json["client_secret"],
    confirmationMethod: json["confirmation_method"],
    created: json["created"],
    currency: json["currency"],
    customer: json["customer"],
    description: json["description"],
    invoice: json["invoice"],
    lastPaymentError: json["last_payment_error"],
    latestCharge: json["latest_charge"],
    livemode: json["livemode"],
    metadata: json["metadata"] == null ? [] : List<dynamic>.from(json["metadata"]!.map((x) => x)),
    nextAction: json["next_action"],
    onBehalfOf: json["on_behalf_of"],
    paymentMethod: json["payment_method"],
    paymentMethodConfigurationDetails: json["payment_method_configuration_details"],
    paymentMethodOptions: json["payment_method_options"] == null ? null : PaymentMethodOptions.fromJson(json["payment_method_options"]),
    paymentMethodTypes: json["payment_method_types"] == null ? [] : List<String>.from(json["payment_method_types"]!.map((x) => x)),
    processing: json["processing"],
    receiptEmail: json["receipt_email"],
    review: json["review"],
    setupFutureUsage: json["setup_future_usage"],
    shipping: json["shipping"],
    source: json["source"],
    statementDescriptor: json["statement_descriptor"],
    statementDescriptorSuffix: json["statement_descriptor_suffix"],
    status: json["status"],
    transferData: json["transfer_data"],
    transferGroup: json["transfer_group"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "object": object,
    "amount": amount,
    "amount_capturable": amountCapturable,
    "amount_details": amountDetails?.toJson(),
    "amount_received": amountReceived,
    "application": application,
    "application_fee_amount": applicationFeeAmount,
    "automatic_payment_methods": automaticPaymentMethods,
    "canceled_at": canceledAt,
    "cancellation_reason": cancellationReason,
    "capture_method": captureMethod,
    "client_secret": clientSecret,
    "confirmation_method": confirmationMethod,
    "created": created,
    "currency": currency,
    "customer": customer,
    "description": description,
    "invoice": invoice,
    "last_payment_error": lastPaymentError,
    "latest_charge": latestCharge,
    "livemode": livemode,
    "metadata": metadata == null ? [] : List<dynamic>.from(metadata!.map((x) => x)),
    "next_action": nextAction,
    "on_behalf_of": onBehalfOf,
    "payment_method": paymentMethod,
    "payment_method_configuration_details": paymentMethodConfigurationDetails,
    "payment_method_options": paymentMethodOptions?.toJson(),
    "payment_method_types": paymentMethodTypes == null ? [] : List<dynamic>.from(paymentMethodTypes!.map((x) => x)),
    "processing": processing,
    "receipt_email": receiptEmail,
    "review": review,
    "setup_future_usage": setupFutureUsage,
    "shipping": shipping,
    "source": source,
    "statement_descriptor": statementDescriptor,
    "statement_descriptor_suffix": statementDescriptorSuffix,
    "status": status,
    "transfer_data": transferData,
    "transfer_group": transferGroup,
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
  dynamic installments;
  dynamic mandateOptions;
  dynamic network;
  String? requestThreeDSecure;

  Card({
    this.installments,
    this.mandateOptions,
    this.network,
    this.requestThreeDSecure,
  });

  factory Card.fromJson(Map<String, dynamic> json) => Card(
    installments: json["installments"],
    mandateOptions: json["mandate_options"],
    network: json["network"],
    requestThreeDSecure: json["request_three_d_secure"],
  );

  Map<String, dynamic> toJson() => {
    "installments": installments,
    "mandate_options": mandateOptions,
    "network": network,
    "request_three_d_secure": requestThreeDSecure,
  };
}

class Link {
  dynamic persistentToken;

  Link({
    this.persistentToken,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    persistentToken: json["persistent_token"],
  );

  Map<String, dynamic> toJson() => {
    "persistent_token": persistentToken,
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

class LatestInvoicePaymentSettings {
  dynamic defaultMandate;
  dynamic paymentMethodOptions;
  dynamic paymentMethodTypes;

  LatestInvoicePaymentSettings({
    this.defaultMandate,
    this.paymentMethodOptions,
    this.paymentMethodTypes,
  });

  factory LatestInvoicePaymentSettings.fromJson(Map<String, dynamic> json) => LatestInvoicePaymentSettings(
    defaultMandate: json["default_mandate"],
    paymentMethodOptions: json["payment_method_options"],
    paymentMethodTypes: json["payment_method_types"],
  );

  Map<String, dynamic> toJson() => {
    "default_mandate": defaultMandate,
    "payment_method_options": paymentMethodOptions,
    "payment_method_types": paymentMethodTypes,
  };
}

class StatusTransitions {
  int? finalizedAt;
  dynamic markedUncollectibleAt;
  dynamic paidAt;
  dynamic voidedAt;

  StatusTransitions({
    this.finalizedAt,
    this.markedUncollectibleAt,
    this.paidAt,
    this.voidedAt,
  });

  factory StatusTransitions.fromJson(Map<String, dynamic> json) => StatusTransitions(
    finalizedAt: json["finalized_at"],
    markedUncollectibleAt: json["marked_uncollectible_at"],
    paidAt: json["paid_at"],
    voidedAt: json["voided_at"],
  );

  Map<String, dynamic> toJson() => {
    "finalized_at": finalizedAt,
    "marked_uncollectible_at": markedUncollectibleAt,
    "paid_at": paidAt,
    "voided_at": voidedAt,
  };
}

class SubscriptionDetails {
  List<dynamic>? metadata;

  SubscriptionDetails({
    this.metadata,
  });

  factory SubscriptionDetails.fromJson(Map<String, dynamic> json) => SubscriptionDetails(
    metadata: json["metadata"] == null ? [] : List<dynamic>.from(json["metadata"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "metadata": metadata == null ? [] : List<dynamic>.from(metadata!.map((x) => x)),
  };
}

class SubscriptionPaymentSettings {
  dynamic paymentMethodOptions;
  dynamic paymentMethodTypes;
  String? saveDefaultPaymentMethod;

  SubscriptionPaymentSettings({
    this.paymentMethodOptions,
    this.paymentMethodTypes,
    this.saveDefaultPaymentMethod,
  });

  factory SubscriptionPaymentSettings.fromJson(Map<String, dynamic> json) => SubscriptionPaymentSettings(
    paymentMethodOptions: json["payment_method_options"],
    paymentMethodTypes: json["payment_method_types"],
    saveDefaultPaymentMethod: json["save_default_payment_method"],
  );

  Map<String, dynamic> toJson() => {
    "payment_method_options": paymentMethodOptions,
    "payment_method_types": paymentMethodTypes,
    "save_default_payment_method": saveDefaultPaymentMethod,
  };
}

class TrialSettings {
  EndBehavior? endBehavior;

  TrialSettings({
    this.endBehavior,
  });

  factory TrialSettings.fromJson(Map<String, dynamic> json) => TrialSettings(
    endBehavior: json["end_behavior"] == null ? null : EndBehavior.fromJson(json["end_behavior"]),
  );

  Map<String, dynamic> toJson() => {
    "end_behavior": endBehavior?.toJson(),
  };
}

class EndBehavior {
  String? missingPaymentMethod;

  EndBehavior({
    this.missingPaymentMethod,
  });

  factory EndBehavior.fromJson(Map<String, dynamic> json) => EndBehavior(
    missingPaymentMethod: json["missing_payment_method"],
  );

  Map<String, dynamic> toJson() => {
    "missing_payment_method": missingPaymentMethod,
  };
}
