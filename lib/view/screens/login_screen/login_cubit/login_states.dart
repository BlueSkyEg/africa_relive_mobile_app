// ignore_for_file: prefer_typing_uninitialized_variables

abstract class LoginStates{}
class LoginInitialState extends LoginStates{}
class GetLoginStateSuccess extends LoginStates{}
class GetLoginStateError extends LoginStates{
  final  error;
  GetLoginStateError(this.error);
}
class GetLoginStateLoading extends LoginStates{}
class IsClicked extends LoginStates{}
class LoginCardState extends LoginStates{}