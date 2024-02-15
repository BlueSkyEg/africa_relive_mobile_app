// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../componants/app_widgets.dart';
import '../../componants/donatons_widgets.dart';
import '../home_screen/home_cubit/home_cubit.dart';
import '../home_screen/home_cubit/home_states.dart';

class AnnualReceiptScreen extends StatelessWidget{
  const AnnualReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>HomeCubit()..projects,
      child: BlocConsumer<HomeCubit,HomeStates>(
        builder: (BuildContext context, HomeStates state)=>Scaffold(
          appBar: PreferredSize(
              preferredSize:Size.fromHeight(40),child: CustomAppBar(text: 'Annual Receipts')),
          body:AnnualReceiptsItemBuilder(),
        ),
        listener: (context, state) {

        },
      ),
    );
  }
}