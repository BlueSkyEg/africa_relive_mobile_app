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