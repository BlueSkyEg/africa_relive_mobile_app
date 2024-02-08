// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, prefer_interpolation_to_compose_strings

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
 TextEditingController _controller=TextEditingController();
 TextEditingController _controllerccv=TextEditingController();
 TextEditingController _controllerexmonth=TextEditingController();
 TextEditingController _controllerexyear=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>HomeCubit()..projects,
      child: BlocConsumer<HomeCubit,HomeStates>(
        builder: (BuildContext context, HomeStates state)=>Scaffold(
          appBar: PreferredSize(
              preferredSize:Size.fromHeight(40),child: CustomAppBar(text: 'Settings')),
          body: Padding(
            padding:  EdgeInsets.symmetric(vertical: 12.0,horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProfileRows(icon: Icons.person,label: 'Profile',),
                  ProfileRows(icon: Icons.notifications,label: 'Notifications ',),
                  ProfileRows(icon: Icons.live_help,label: 'Help & Support ',),
                ],
              ),
            ),
          ),
        ),
        listener: (context, state) {

        },
      ),
    );
  }
}
