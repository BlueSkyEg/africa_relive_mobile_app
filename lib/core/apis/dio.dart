import 'dart:io';

import 'package:dio/dio.dart';


class DioHelper {
  static Dio? dio ;
  static init (){
    dio = Dio(
        BaseOptions(
          baseUrl: 'https://insights.cpapai.com',
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
  // static Future<Response> download({required String? name,required String? url, Map<String,dynamic>? query,  Map<String,dynamic>? data , String? lang = 'en',String? token })
  // async{
  //   dio!.options.headers={
  //     'lang':lang,
  //     'Authorization':token??'',
  //     'content-type':'application/json'
  //   };
  //   // if(Platform.isIOS) {
  //   //   Directory directory = (await getApplicationDocumentsDirectory());
  //   //   String newPath = "";
  //   //   print(directory);
  //   //   List<String> paths = directory.path.split("/");
  //   //   // for (int x = 1; x < paths.length; x++) {
  //   //   //   String folder = paths[x];
  //   //   //   if (folder != "Android") {
  //   //   //     newPath += "/" + folder;
  //   //   //   } else {
  //   //   //     break;
  //   //   //   }
  //   //   // }
  //   //   newPath = newPath + "/Download";
  //   //   directory = Directory(newPath);
  //   //   // openfile = directory.path.toString();
  //   //   print(directory);
  //   //   print(name);
  //   //   print(name);
  //   //   return await dio!
  //   //       .download(url.toString(), '${directory.path}/${name.toString()}');
  //   // }
  //   // else{
  //   //   Directory directory = (await getDownloadsDirectory())!;
  //   //   String newPath = "";
  //   //   print(directory);
  //   //   List<String> paths = directory.path.split("/");
  //   //   for (int x = 1; x < paths.length; x++) {
  //   //     String folder = paths[x];
  //   //     if (folder != "Android") {
  //   //       newPath += "/" + folder;
  //   //     } else {
  //   //       break;
  //   //     }
  //   //   }
  //     newPath = newPath + "/Download";
  //     directory = Directory(newPath);
  //     openfile = directory.path.toString();
  //     print(directory);
  //     print(name);
  //     print(name);
  //     return await dio!.download(url.toString(), '${directory.path}/${name.toString()}');
  //   }
  // }
}