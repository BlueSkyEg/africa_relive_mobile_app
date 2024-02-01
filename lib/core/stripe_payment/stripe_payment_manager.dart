import 'package:africa_relief/core/apis/dio.dart';
import 'package:africa_relief/core/stripe_payment/stripe_keys.dart';
import 'package:dio/dio.dart';

abstract class PaymentManager{
  static Future<void>makePayment(int amount,String currency)async {
    try{
      String clientSecret=await _GetPayment(amount.toString(),currency);
    }catch(error){
      throw Exception(error.toString());
    }


  }

  static Future<String> _GetPayment(String amount,String currency)async{
    Dio dio=Dio();
    var response= await dio.post(
       'https://api.stripe.com/v1/payment_intents',
      options: Options(
        headers: {
          'Authorization':'Bearer ${ApiKeys.secreteKey}',
          'content-type':'application/x-www-form-urlencoded'},

      ),
      data: {
        'amount':amount,
        'currency':currency,
      },
    );
    return response.data['client_secret'];
  }
}