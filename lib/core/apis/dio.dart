import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';


class DioHelper {
  static Dio? dio ;
  static init (){
    dio = Dio(
        BaseOptions(
          baseUrl: 'http://192.168.0.61:8000/api',
          receiveDataWhenStatusError: true,
        )
    );
  }
  static Future<Response> getData({required String? url , Map<String,dynamic>? query , String? lang=' en ',String? token})
  async{
    dio!.options.headers={
      'lang':lang,
      'Authorization':token??'',
      'content-type':'application/json'
    };
    return await dio!.get
      (
        url!,
        queryParameters: query
    );
  }
  static Future<Response> postData({required String? url, Map<String,dynamic>? query,required Map<String,dynamic> data,String? lang= 'en',String? token })
  async{
    dio!.options.headers={
      'lang':lang,
      'Authorization':token??'',
      'content-type':'application/json'
    };
    return await dio!.post(
        url!,
        queryParameters: query,
        data:data
    );
  }
  static Future<Response> putData({required String? url, Map<String,dynamic>? query, required Map<String,dynamic> data , String? lang = 'en',String? token })
  async{
    dio!.options.headers={
      'lang':lang,
      'Authorization':token??'',
      'content-type':'application/json'
    };
    return await dio!.put
      (
        url!,
        queryParameters: query,
        data: data
    );
  }
}