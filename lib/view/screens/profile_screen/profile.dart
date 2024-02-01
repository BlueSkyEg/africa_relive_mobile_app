// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../componants/app_widgets.dart';
import '../home_screen/home_cubit/home_cubit.dart';
import '../home_screen/home_cubit/home_states.dart';

class ProfileScreen extends StatelessWidget{
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>HomeCubit()..projects,
      child: BlocConsumer<HomeCubit,HomeStates>(
        builder: (BuildContext context, HomeStates state)=>Scaffold(
          appBar: PreferredSize(
              preferredSize:Size.fromHeight(40),child: CustomAppBar(text: 'Latest Updates ')),
          body: Column(
            children: [
              Container(
                child: CachedNetworkImage(
                  width: double.infinity,
                  fit: BoxFit.cover,
                  imageUrl: 'https://s3-alpha-sig.figma.com/img/f062/8ec6/6a92aa006e22f17eef886169e77ef6ec?Expires=1707696000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=d42~yVb4WIXX8GLAGYEop~utu0Zv-ivN-~qcubKm472-t2hCcKr2hvMFUIJRUcjAIl0nhK3AeWKKRKTCAoU6SmXA1i77LLdg-iS6638G-HigWpm7EUZeGGY~qMunBAC-~1BR4~Q2c7WiaC09dO2awZRlrtkJ~YWE080PoM1myWrExHJGgbwzMq3S4ur9Zzj2~w4DTMrFZRwa3kN-4H-WAy-zLwZUykp1nNH2TF0p~PXhggBEUhOI2BFdOQ4GEw59N6gkpjG8jDPSvTuFjpUxfFPwyc4~dDFCp0aA62vUxHbDqawjmR7Jw7dLWU94kareYjpy4o7kUx~aUnMRUG9liw__',
                  placeholder: (context, url) => CircularProgressIndicator(color: Colors.white,),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              )
            ],
          ),
        ),
        listener: (context, state) {

        },
      ),
    );
  }
}