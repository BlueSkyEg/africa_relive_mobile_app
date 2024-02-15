// ignore_for_file: avoid_function_literals_in_foreach_calls, avoid_print
import 'dart:convert';

import 'package:africa_relief/view/screens/login_screen/login_cubit/login_states.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../core/apis/dio.dart';
import '../../../../models/payment_intint_model.dart';
import '../../../../models/projects_model.dart';
import '../../../componants/payments_widgets.dart';
import '../../../componants/variable.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);
  // void UserLogin(){
  //   emit(GetLoginStateLoading());
  //  DioHelper.postData(url:'/create-single-charge',data: {
  //    'paymentMethodId':pay,
  //    'amount':amount,
  //    'paymentDescription':'الحمد لله'
  //  }).then((value) {
  //    emit(GetLoginStateSuccess());
  //  }).catchError((error){
  //     print(error.toString());
  //     emit(GetLoginStateError(error));
  //   });
  // }

}
