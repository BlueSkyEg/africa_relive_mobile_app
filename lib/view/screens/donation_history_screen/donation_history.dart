// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:africa_relief/view/componants/app_widgets.dart';
import 'package:africa_relief/view/screens/profile_screen/cubit/profile_cubit.dart';
import 'package:africa_relief/view/screens/profile_screen/cubit/profile_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../config/themes/colors.dart';
import '../../componants/donatons_widgets.dart';
import '../home_screen/home_cubit/home_cubit.dart';
import '../home_screen/home_cubit/home_states.dart';

class DonationHistoryScreen extends StatelessWidget{
   DonationHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>ProfileCubit()..GetDonationsHistory(),
      child: BlocConsumer<ProfileCubit,ProfileStates>(
        builder: (BuildContext context, ProfileStates state)=>Scaffold(
          appBar: PreferredSize(
              preferredSize:Size.fromHeight(40),child: CustomAppBar(text: 'Donation History ')),
          body: state is GetDonationsSuccess&&ProfileCubit.get(context).donationsHistory!=null?DonationsHistory(data: ProfileCubit.get(context).donationsHistory!,onCancel: (){
            ProfileCubit.get(context).CanelSubscribtion();
          }):Progress(),
        ),
        listener: (context, state) {

        },
      ),
    );
  }
}