// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:africa_relief/view/componants/app_widgets.dart';
import 'package:africa_relief/view/componants/payments_widgets.dart';
import 'package:africa_relief/view/componants/singel_project_widgets.dart';
import 'package:africa_relief/view/componants/variable.dart';
import 'package:africa_relief/view/screens/home_screen/home_cubit/home_cubit.dart';
import 'package:africa_relief/view/screens/home_screen/home_cubit/home_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../config/themes/colors.dart';
import '../../../core/apis/dio.dart';
import '../../componants/loginWidgets.dart';
import '../single_project_screen/project_screen.dart';

class SavesCards extends StatefulWidget{
  const SavesCards({super.key});

  @override
  State<SavesCards> createState() => _SavesCardsState();
}

class _SavesCardsState extends State<SavesCards> {
  @override
  Widget build(BuildContext context) {
   return BlocProvider(
     create: (context) => HomeCubit()..GetRetrieveAllPayments(),
     child: BlocConsumer<HomeCubit,HomeStates>(
       builder: (context, state) =>  Scaffold(
         appBar: PreferredSize(
             preferredSize:Size.fromHeight(40),child: CustomAppBar(text:'Your Cards')),
         body: Padding(
           padding: const EdgeInsets.all(13.0),
           child: Column(
             mainAxisAlignment:state is !GetRetrieveSuccess?MainAxisAlignment.center:MainAxisAlignment.start,
             children: [
               if(state is GetRetrieveSuccess)
                 UserCardsItemBuilder( retrieve: state.retrieve,),
               if(state is !GetRetrieveSuccess)
                 Center(child: Progress())
             ],
           ),
         ),
       ),
       listener: (context, state) {
         if(state is GetSingleDonationStateSuccess&&state.singlePay.success==true) {
           paymentMethodeID='';
           showDialog(context: context, builder: (BuildContext context) {return DonationSuccessDialogItemBuilder();},);
         }
         if(state is ShowOTPSuccess){
           showDialog(
             context: context,
             builder: (BuildContext context) {
               bool isdone=false;
               return  DonationOTPDialogItemBuilder(onTap: ()async{
                 setState(() {
                   isdone=true;
                 });
                 showDialog(
                   context: context,
                   builder: (BuildContext context) {
                     return Center(
                       child: Progress(),
                     );
                   },
                 );
                 DioHelper.postData(url:'/single-charge/create',data: {
                   'paymentIntentId':otpID
                 }).then((value) {
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