// ignore_for_file: prefer_typing_uninitialized_variables

abstract class HomeStates{}
class HomeInitialState extends HomeStates{}
class GetHomeStateSuccess extends HomeStates{}
class GetHomeStateError extends HomeStates{
  final  error;
  GetHomeStateError(this.error);
}
class GetHomeStateLoading extends HomeStates{}
class IsClicked extends HomeStates{}
class HomeCardState extends HomeStates{}
class GetLoginStateSuccess extends HomeStates{}
class GetLoginStateError extends HomeStates{
  final  error;
  GetLoginStateError(this.error);
}
class GetLoginStateLoading extends HomeStates{}