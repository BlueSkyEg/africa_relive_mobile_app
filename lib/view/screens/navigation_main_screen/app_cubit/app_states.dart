// ignore_for_file: prefer_typing_uninitialized_variables

abstract class AppStates{}
class AppInitialState extends AppStates{}
class BottomNaveState extends AppStates{}
class GetCompanyStateSuccess extends AppStates{}
class GetCompanyStateError extends AppStates{
  final  error;
  GetCompanyStateError(this.error);
}
class GetCompanyStateLoading extends AppStates{}