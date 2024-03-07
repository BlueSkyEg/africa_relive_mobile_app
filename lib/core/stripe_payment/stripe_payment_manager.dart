// // ignore_for_file: prefer_const_constructors
//
// import 'package:africa_relief/core/apis/dio.dart';
// import 'package:africa_relief/core/stripe_payment/stripe_keys.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
//
// import '../../models/payment_models/payment_intint_model.dart';
//
// abstract class PaymentManager{
//
//   static Future<void>makePayment(int amount,String currency)async{
//     try {
//       String clientSecret=await _getClientSecret((amount*100).toString(), currency);
//       await _initializePaymentSheet(clientSecret);
//       await Stripe.instance.presentPaymentSheet();
//     } catch (error) {
//       throw Exception(error.toString());
//     }
//   }
//
//   static Future<void>_initializePaymentSheet(String clientSecret)async{
//       Stripe.instance.initPaymentSheet(
//       paymentSheetParameters: SetupPaymentSheetParameters(
//         paymentIntentClientSecret: clientSecret,
//         billingDetails: BillingDetails(name: 'mohamed',phone: '01020233455',address: Address(city: 'alex', country: 'egy', line1: '1', line2: '2', postalCode: '2468', state: 'state'),email: 'moAtef@gmail.com'),
//         merchantDisplayName: "Africa Relive",
//         customFlow: false,
//       ),
//     );
//      // Stripe.instance.createPaymentMethod(params: PaymentMethodParams.card(paymentMethodData: PaymentMethodData())).then((value) {
//      //   value.customerId
//      //   ;
//      // });
//   }
//
//   static Future<String> _getClientSecret(String amount,String currency)async{
//     Dio dio=Dio();
//     var response= await dio.post(
//       'https://api.stripe.com/v1/payment_intents',
//       options: Options(
//         headers: {
//           'Authorization': 'Bearer ${ApiKeys.secreteKey}',
//           'Content-Type': 'application/x-www-form-urlencoded'
//         },
//       ),
//       data: {
//         'amount': amount,
//         'currency': currency,
//       },
//     );
//     res=response.data['id'];
//     return response.data["client_secret"];
//   }
//
// }
//
// var res;