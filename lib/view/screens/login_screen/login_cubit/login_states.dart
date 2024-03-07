// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:africa_relief/models/user_models/login_model.dart';
import 'package:africa_relief/models/user_models/register_model.dart';

abstract class LoginStates{}
class LoginInitialState extends LoginStates{}
class GetLoginStateSuccess extends LoginStates{
  final LoginModel login;
  GetLoginStateSuccess({required this.login});
}
class GetLoginStateError extends LoginStates{
  final  error;
  GetLoginStateError(this.error);
}
class GetLoginStateLoading extends LoginStates{}
class GetRegisterStateSuccess extends LoginStates{
  final RegisterModel login;
  GetRegisterStateSuccess({required this.login});
}
class GetRegisterStateError extends LoginStates{
  final  error;
  GetRegisterStateError(this.error);
}
class GetRegisterStateLoading extends LoginStates{}
class IsClicked extends LoginStates{}
class PasswordState extends LoginStates{}
class LoginCardState extends LoginStates{}
class SendForgetPasswordMailLoadingState extends LoginStates{}
class SendForgetPasswordMailSuccessState extends LoginStates{}
class SendForgetPasswordMailErrorState extends LoginStates{
  final error;
   SendForgetPasswordMailErrorState(this.error);
}