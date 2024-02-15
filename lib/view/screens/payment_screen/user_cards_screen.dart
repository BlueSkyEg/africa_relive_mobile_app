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
         appBar: AppBar(
           leading:Padding(
             padding:  EdgeInsets.only(left: 12.0,bottom: 0),
             child: Row(
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 GestureDetector(
                   onTap: () => Navigator.pop(context),
                   child: Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,),),
                 Padding(
                   padding: const EdgeInsets.only(left: 4.0,top: 0),
                   child: Text('Your Cards',style: TextStyle(color: greyTextColor,fontWeight: FontWeight.bold,),maxLines: 1,overflow: TextOverflow.ellipsis,),
                 ),
               ],
             ),
           ),
           leadingWidth: MediaQuery.of(context).size.width,
         ),
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
         if(state is GetSingleDonationStateSuccess&&state.singlePay.success==true||state is GetSubscriptionStatSuccess&&state.singlePay.success==true) {
           pay='';
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
                   'paymentIntentId':otp
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