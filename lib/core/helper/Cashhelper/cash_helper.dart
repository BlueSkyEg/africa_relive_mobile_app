// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:shared_preferences/shared_preferences.dart';

class CashHelper{
  static SharedPreferences? sharedPreferences;
  static int()async{
    sharedPreferences=await SharedPreferences.getInstance();
  }
  static saveData({required String key,required dynamic value})async{
    if(value is String)return await sharedPreferences!.setString(key, value);
    if(value is double)return await sharedPreferences!.setDouble(key, value);
    if(value is bool)return await sharedPreferences!.setBool(key, value);
    else return await sharedPreferences!.setInt(key, value);
  }
  static getData({required String key}){
    return sharedPreferences!.get(key);
  }
  static cleanData({required String key})async{
    return await sharedPreferences!.remove(key);
  }
}