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
import '../../componants/variable.dart';
import '../home_screen/home_cubit/home_cubit.dart';
import '../home_screen/home_cubit/home_states.dart';

class RecurringDonationScreen extends StatefulWidget{
  RecurringDonationScreen({super.key});

  @override
  State<RecurringDonationScreen> createState() => _RecurringDonationScreenState();
}

class _RecurringDonationScreenState extends State<RecurringDonationScreen> {
  @override
  void initState() {
    // TODO: implement initState
    print(token);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>ProfileCubit()..GetecurringDonationHistory(),
      child: BlocConsumer<ProfileCubit,ProfileStates>(
        builder: (BuildContext context, ProfileStates state)=>Scaffold(
          appBar: PreferredSize(
              preferredSize:Size.fromHeight(40),child: CustomAppBar(text: 'Recurring Donation')),
          body:state is GetRecurringSuccessState&&ProfileCubit.get(context).recurringHistory!=null? DonationsHistory(isDonations: false,data: ProfileCubit.get(context).recurringHistory!):Column(children: [Text('no recurring yet')],),
        ),
        listener: (context, state) {

        },
      ),
    );
  }
}