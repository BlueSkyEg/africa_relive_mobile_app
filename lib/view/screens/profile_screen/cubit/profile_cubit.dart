// ignore_for_file: avoid_function_literals_in_foreach_calls, avoid_print

import 'package:africa_relief/models/payment_models/recurring_history_model.dart';
import 'package:africa_relief/models/user_models/user_model.dart';
import 'package:africa_relief/view/componants/variable.dart';
import 'package:africa_relief/view/screens/profile_screen/cubit/profile_states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/apis/dio.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);
  ProfileModel? profile;
  RecurringModel? recurringHistory;
  RecurringModel? donationsHistory;

  void GetUserInfo() {
    emit(GetProfileLoadingState());
    DioHelperLogin.getData(url: '/user', token: 'Bearer $token').then((value) {
      profile = ProfileModel.fromJson(value.data);
      emit(GetProfileSuccessState(profile: profile!));
    }).catchError((error) {
      print(error.toString());
      emit(GetProfileErrorState());
    });
  }

  void UpdateUserInfo({String? mail, String? phone, String? name}) {
    emit(PostUserInfoLoading());
    DioHelperLogin.postData(url: '/user', token: 'Bearer $token', data: {
      'name': name!,
      'email': mail!,
      'phone': phone!,
    }).then((value) {
      emit(PostUserInfoSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(PostUserInfoError(error));
    });
  }

  void GetecurringDonationHistory() {
    emit(GetRecurringLoadingState());
    DioHelperLogin.getData(url: '/user/subscriptions', token: 'Bearer $token')
        .then((value) {
      recurringHistory = RecurringModel.fromJson(value.data);
      emit(GetRecurringSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetRecurringErrorState(error));
    });
  }

  void CanelSubscribtion() {
    print(subscriptionId);

    emit(CancelSubscriptionLoading());
    DioHelperLogin.delete(
            url: '/user/subscription?',
            data: {'subscriptionId': subscriptionId},
            token: 'Bearer $token')
        .then((value) {
      subscriptionId = '';
      print(subscriptionId);
      emit(CancelSubscriptionSuccess());
    }).catchError((error) {
      print(error);
      emit(CancelSubscriptionError(error));
    });
  }

  void GetDonationsHistory() {
    emit(GetDonationsLoading());
    DioHelperLogin.getData(url: '/user/donations', token: 'Bearer $token')
        .then((value) {
      donationsHistory = RecurringModel.fromJson(value.data);

          emit(GetDonationsSuccess());
    })
        .catchError((error) {

    });
  }
}
