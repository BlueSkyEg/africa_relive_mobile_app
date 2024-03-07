// ignore_for_file: avoid_function_literals_in_foreach_calls, avoid_print, prefer_const_constructors
import 'dart:convert';

import 'package:africa_relief/models/user_models/login_model.dart';
import 'package:africa_relief/models/user_models/register_model.dart';
import 'package:africa_relief/view/screens/login_screen/login_cubit/login_states.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../config/themes/icons.dart';
import '../../../../core/apis/dio.dart';
import '../../../../models/payment_models/payment_intint_model.dart';
import '../../../../models/projects_model.dart';
import '../../../componants/payments_widgets.dart';
import '../../../componants/variable.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  LoginModel? login;
  RegisterModel? register;
  bool isProtect = true;
  int? statusCode;
  Widget suffix = Icon(IconBroken.Show, color: Colors.grey);

  void onSecure() {
    isProtect = !isProtect;
    suffix = isProtect
        ? Icon(IconBroken.Show, color: Colors.grey)
        : Icon(
            IconBroken.Hide,
            color: Colors.grey,
          );
    emit(PasswordState());
  }

  void Login({required String mail, required String pass}) {
    emit(GetLoginStateLoading());
    DioHelperLogin.postData(
        url: '/login', data: {'email': mail, 'password': pass}).then((value) {
      statusCode = value.statusCode;
      login = LoginModel.fromJson(value.data);
      emit(GetLoginStateSuccess(login: login!));
    }).catchError((error) {
      print(error);
      emit(GetLoginStateError(error));
    });
  }

  void Register(
      {required String mail,
      required String pass,
      required name,
      required String confirmPass}) {
    emit(GetRegisterStateLoading());
    DioHelperLogin.postData(
      url: '/register',
      data: {
        'name': name,
        'email': mail,
        'password': pass,
        'password_confirmation': confirmPass,
      },
    ).then((value) {
      register = RegisterModel.fromJson(value.data);
      emit(GetRegisterStateSuccess(login: register!));
    }).catchError((error) {
      print(error.toString());
      emit(GetRegisterStateError(error));
    });
  }

  void ForgotPassword({required String mail}) {
    emit(SendForgetPasswordMailLoadingState());
    DioHelperLogin.postData(
        url: '/auth/forget-password',
        data: {'email': mail.toString()}).then((value) {
      emit(SendForgetPasswordMailSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SendForgetPasswordMailErrorState(error));
    });
  }
}
