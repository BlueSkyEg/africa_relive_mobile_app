// ignore_for_file: prefer_const_constructors

import 'package:africa_relief/core/helper/Cashhelper/cash_helper.dart';
import 'package:africa_relief/view/componants/singel_project_widgets.dart';
import 'package:africa_relief/view/componants/variable.dart';
import 'package:africa_relief/view/screens/home_screen/home_cubit/home_cubit.dart';
import 'package:africa_relief/view/screens/home_screen/home_cubit/home_states.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../config/themes/colors.dart';
import '../../../core/apis/dio.dart';
import '../../componants/app_widgets.dart';
import '../../componants/loginWidgets.dart';
import '../../componants/payments_widgets.dart';
import '../single_project_screen/project_screen.dart';

class PaymentScreen extends StatefulWidget{
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  TextEditingController _controller=TextEditingController();
  TextEditingController _controllerccv=TextEditingController();
  TextEditingController _controllerexmonth=TextEditingController();
  TextEditingController _controllerexyear=TextEditingController();
  TextEditingController _controllerMail=TextEditingController();
  TextEditingController _controllerName=TextEditingController();
  TextEditingController _controllerCity=TextEditingController();
  TextEditingController _controllerLine=TextEditingController();
  TextEditingController _controllerZip=TextEditingController();
  String country='US';
  @override
  void initState() {
    _controllerName.text=name;
    _controllerMail.text=email;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit,HomeStates>(
        builder: (context, state) => Scaffold(
          appBar: PreferredSize(
              preferredSize:Size.fromHeight(40),child: CustomAppBar(text:'To complete your payment with (\$ $amount)')),
          body:  Padding(
            padding: const EdgeInsets.all(13.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  PaymentUserData(controllerMail: _controllerMail, controllerName: _controllerName, controllerCity: _controllerCity, controllerLine: _controllerLine, controllerZip: _controllerZip, country: country,),
                  CardDonateData(controller: _controller, controllerccv: _controllerccv, controllerexmonth: _controllerexmonth, controllerexyear: _controllerexyear,),
                  if(state is GetPaymentMethodIdStateError)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(right: 8.0),
                          child: Icon(Icons.warning,color: Colors.red,),
                        ),
                        Expanded(child: Text('${state.error}',style: TextStyle(color: Colors.red),)),
                      ],
                    ),
                  SizedBox(height:40.h,),
                  ButtonItemBuilder(
                    height: 45,
                    radius: 10,
                    isLogin: false,
                    color: HexColor('#007AFF'),
                    onTap: ()async{
                      HomeCubit.get(context).GetPaymentMethodId(_controller.text, _controllerexmonth.text, _controllerexyear.text, _controllerccv.text, _controllerName.text, _controllerMail.text,country, _controllerLine.text, _controllerCity.text, _controllerZip.text);
                    },
                    textwidget: state is GetSingleDonationStateLoading||state is GetPaymentMethodIdStateLoading||state is GetSubscriptionStateLoading?Progress():Text('Pay\$$amount /($selectedItem)',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w600),),
                  ),
                ],
              ),
            ),
          ),
        ),
        listener: (context, state) {
          if(state is GetPaymentMethodIdStateSuccess) {
            if(selectedItem=='once') {HomeCubit.get(context).SingleDonation();}
            else{HomeCubit.get(context).SubscriptionDonation();}
          }
          if(state is GetSingleDonationStateSuccess&&state.singlePay.success==true||state is GetSubscriptionStatSuccess) {
            paymentMethodeID='';
            showDialog(context: context, builder: (BuildContext context) {return DonationSuccessDialogItemBuilder();},);
          }
          if(state is ShowOTPSuccess){
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return  DonationOTPDialogItemBuilder(onTap: ()async{
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Center(
                        child: Progress(),
                      );
                    },
                  );
                  DioHelperLogin.postData(url:'/create-single-charge',data: {
                    'paymentIntentId':otpID
                  },token:'Bearer $token').then((value) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return DonationSuccessDialogItemBuilder();
                      },
                    );
                  });
                });
              },
            );
          }
        },
      ),
    );
  }
}