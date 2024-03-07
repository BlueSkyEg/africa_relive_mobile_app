// ignore_for_file: prefer_typing_uninitialized_variables

import '../../../../models/payment_models/payment_intint_model.dart';
import '../../../../models/payment_models/retrieve_all_payment_model.dart';
import '../../../../models/payment_models/single_payment_model.dart';
import '../../../../models/payment_models/subscription_model.dart';

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
class GetSingleDonationStateSuccess extends HomeStates{
  final SinglePayment singlePay;
  GetSingleDonationStateSuccess({required this.singlePay});
}
class GetSingleDonationStateError extends HomeStates{
  final  error;
  GetSingleDonationStateError(this.error);
}
class GetSingleDonationStateLoading extends HomeStates{}
class GetSubscriptionStatSuccess extends HomeStates{

}
class GetSubscriptionStateError extends HomeStates{
  final  error;
  GetSubscriptionStateError(this.error);
}
class GetSubscriptionStateLoading extends HomeStates{}
class GetSingleDonationStateSuccessOTP extends HomeStates{
  final SinglePayment singlePay;
  GetSingleDonationStateSuccessOTP({required this.singlePay});
}
class GetSingleDonationStateErrorOTP extends HomeStates{
  final  error;
  GetSingleDonationStateErrorOTP(this.error);
}
class GetSingleDonationStateLoadingOTP extends HomeStates{}
class GetPaymentMethodIdStateSuccess extends HomeStates{}
class GetPaymentMethodIdStateError extends HomeStates{
  final  error;
  GetPaymentMethodIdStateError(this.error);
}
class GetPaymentMethodIdStateLoading extends HomeStates{}
class ShowOTPSuccess extends HomeStates{}
class ShowOTPLoading extends HomeStates{}
class ShowOTPError extends HomeStates{
  final error;
  ShowOTPError(this.error);
}
class GetRetrieveLoading extends HomeStates{}
class GetRetrieveSuccess extends HomeStates{
  final RetrieveAllPaymentModel retrieve;
  GetRetrieveSuccess({required this.retrieve});
}
class GetRetrieveError extends HomeStates{
  final error;
  GetRetrieveError(this.error);
}