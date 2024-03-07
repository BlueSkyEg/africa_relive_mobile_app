// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, prefer_interpolation_to_compose_strings

import 'package:africa_relief/view/screens/navigation_main_screen/navigation_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import '../../../componants/app_widgets.dart';
import '../../../componants/payments_widgets.dart';
import '../../../componants/profile_widgets.dart';
import '../../home_screen/home_cubit/home_cubit.dart';
import '../../home_screen/home_cubit/home_states.dart';
import 'package:stripe_sdk/stripe_sdk.dart' as Stripea;


class SettingScreen extends StatelessWidget{
   SettingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>HomeCubit()..projects,
      child: BlocConsumer<HomeCubit,HomeStates>(
        builder: (BuildContext context, HomeStates state)=>Scaffold(
          appBar: PreferredSize(
              preferredSize:Size.fromHeight(40),child: CustomAppBar(text: 'Settings',onBack: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home(),))),),
          body: ProfileItemBuilder(),
        ),
        listener: (context, state) {

        },
      ),
    );
  }
}
