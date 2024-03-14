import 'dart:ffi';

import 'package:intl/intl.dart';

import '../../core/helper/Cashhelper/cash_helper.dart';

String getType='';
String getImage='';
String getTitle='';
String getH1='';
String getH2='';
String getH3='';
String getB1='';
String getB2='';
String getB3='';
String getBlogsH1='';
String getBlogsType='';
String getBlogsTitle='';
String getBlogsH2='';
String getBlogsB1='';
String getBlogsB2='';
String paymentMethodeID='';
String otpID='';
List<String> blogsImagesList=[];
List<int> projectAmountsList=[];
String countryCode='';
int amount=0;
String token=CashHelper.getData(key: 'token')??'';
String name=CashHelper.getData(key: 'name')??'';
String email=CashHelper.getData(key: 'email')??'';
List<String> userCardList=CashHelper.getListData(key:'cashed_cards_list')??[];
String subscriptionId='';
String formattedDate(String dateString) {
  DateTime dateTime = DateTime.parse(dateString);
  String formatted = DateFormat('dd-MM-yyyy').format(dateTime);
  return formatted;
}
String formattedDateTime(String dateTimeString) {
  DateTime dateTime = DateTime.parse(dateTimeString);
  String formattedDate = DateFormat.yMMMMd().format(dateTime); // March 19, 2023
  String formattedTime = DateFormat.jm().format(dateTime); // 12:27 PM
  return '$formattedDate - $formattedTime';
}
