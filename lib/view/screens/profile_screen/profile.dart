// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:africa_relief/config/themes/colors.dart';
import 'package:africa_relief/config/themes/icons.dart';
import 'package:africa_relief/view/componants/images_url.dart';
import 'package:africa_relief/view/screens/login_screen/login.dart';
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
      create: (BuildContext context) =>HomeCubit()..projects,
      child: BlocConsumer<HomeCubit,HomeStates>(
        builder: (BuildContext context, HomeStates state)=>Scaffold(
          appBar: PreferredSize(
              preferredSize:Size.fromHeight(10),child: AppBar()),
          body: Padding(
            padding:  EdgeInsets.symmetric(vertical: 12.0,horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Container(
                      height: 108,
                      width: 108,
                      child: CachedNetworkImage(
                        width: double.infinity,
                        fit: BoxFit.cover,
                        imageUrl: profile,
                        placeholder: (context, url) => CircularProgressIndicator(color: Colors.white,),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                  Center(child: Padding(
                    padding:  EdgeInsets.symmetric(vertical: 8.0),
                    child: Text('Freda Kutch',style: TextStyle(fontSize: 20)),
                  )),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text('Total Spent',style: TextStyle(fontSize: 14,color: greyTextColor),),
                              Padding(
                                padding:  EdgeInsets.only(top: 8.0),
                                child: Text('\$522',style: TextStyle(fontSize: 18),),
                              ),
                            ],
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 16.0),
                            child: Container(height: 44,width: 1,color: Colors.grey,),
                          ),
                          Column(
                            children: [
                              Text('Total Donations',style: TextStyle(fontSize: 14,color: greyTextColor),),
                              Padding(
                                padding:  EdgeInsets.only(top: 8.0),
                                child: Text('7',style: TextStyle(fontSize: 18),),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  ProfileRows(icon: Icons.settings,label: 'Setting',),
                  ProfileRows(icon: Icons.edit_calendar_sharp,label: 'Donations History',),
                  ProfileRows(icon: Icons.refresh,label: 'Recurring Donations',),
                  ProfileRows(icon: Icons.receipt_long,label: 'Annual Receipts',),
                  ProfileRows(icon: Icons.notifications,label: 'Notifications ',),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                    },
                    child: Padding(
                      padding:  EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        padding: EdgeInsetsDirectional.all(14),
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                            border: Border(bottom: BorderSide(color: Colors.grey))
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.logout,color: Colors.red,size: 24,),
                            SizedBox(width: 14,),
                            Text('Log out',style: TextStyle(fontSize: 18,color: Colors.red),),
                          ],
                        ),
                      ),
                    ),
                  )

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