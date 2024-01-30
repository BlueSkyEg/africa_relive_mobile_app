// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, sized_box_for_whitespace

import 'package:africa_relief/view/screens/home_screen/home_cubit/home_cubit.dart';
import 'package:africa_relief/view/screens/home_screen/home_cubit/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../componants/projects_widgets.dart';

class ProjectsScreen extends StatelessWidget{
   ProjectsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>HomeCubit()..projects,
      child: BlocConsumer<HomeCubit,HomeStates>(
        builder: (BuildContext context, HomeStates state)=>Scaffold(
          appBar: PreferredSize(
            preferredSize:Size.fromHeight(20),
            child: AppBar(
              leading:Container(),
              leadingWidth: MediaQuery.of(context).size.width/2,
            ),
          ),
          body: Padding(
            padding:  EdgeInsets.only(left: 13.0,right: 13,bottom: 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.only(left: 8.0,bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,),),
                      Padding(
                        padding:  EdgeInsets.only(left: 20.0,top: 0),
                        child: Text('Our Projects',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),maxLines: 1,),
                      ),
                    ],
                  ),
                ),
                FilterList(),
                ProjectsGridView(),
              ],
            ),
          ),
        ),
        listener: (context, state) {

        },
      ),
    );
  }
}