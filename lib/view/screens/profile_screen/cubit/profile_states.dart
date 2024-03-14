import 'package:africa_relief/models/user_models/user_model.dart';

abstract class ProfileStates{}
class ProfileInitialState extends ProfileStates{}

class GetProfileLoadingState extends ProfileStates{}
class GetProfileSuccessState extends ProfileStates{
  final ProfileModel profile;

  GetProfileSuccessState({required this.profile});

}
class GetProfileErrorState extends ProfileStates{}
class PostUserInfoLoading extends ProfileStates{}
class PostUserInfoSuccess extends ProfileStates{}
class PostUserInfoError extends ProfileStates{
  final error;
  PostUserInfoError(this.error);
}
class GetRecurringLoadingState extends ProfileStates{}
class GetRecurringSuccessState extends ProfileStates{}
class GetRecurringErrorState extends ProfileStates{
  final error;
  GetRecurringErrorState(this.error);
}
class CancelSubscriptionLoading extends ProfileStates{}
class CancelSubscriptionSuccess extends ProfileStates{}
class CancelSubscriptionError extends ProfileStates{
  final error;
  CancelSubscriptionError(this.error);
}
class GetDonationsLoading extends ProfileStates{}
class GetDonationsSuccess extends ProfileStates{}
class GetDonationsError extends ProfileStates{
  final error;
  GetDonationsError(this.error);
}