// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:africa_relief/config/themes/colors.dart';
import 'package:africa_relief/config/themes/icons.dart';
import 'package:africa_relief/view/componants/images_url.dart';
import 'package:africa_relief/view/screens/login_screen/login.dart';
import 'package:africa_relief/view/screens/profile_screen/cubit/profile_cubit.dart';
import 'package:africa_relief/view/screens/profile_screen/cubit/profile_states.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../componants/app_widgets.dart';
import '../../componants/profile_widgets.dart';
import '../home_screen/home_cubit/home_cubit.dart';
import '../home_screen/home_cubit/home_states.dart';

class ProfileScreen extends StatelessWidget{
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>ProfileCubit()..GetUserInfo(),
      child: BlocConsumer<ProfileCubit,ProfileStates>(
        builder: (BuildContext context, ProfileStates state)=>Scaffold(
          appBar: PreferredSize(
              preferredSize:Size.fromHeight(10),child: AppBar()),
          body: Padding(
            padding:  EdgeInsets.symmetric(vertical: 12.0,horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if(state is GetProfileSuccessState)
                  UserDataItemBuilder(data: state.profile),
                  // if(state is !GetProfileSuccessState)
                  //   Progress(),
                  SettingItemBuilder()
                ],
              ),
            ),
          ),
        ),
        listener: (context, state) {},
      ),
    );
  }
}