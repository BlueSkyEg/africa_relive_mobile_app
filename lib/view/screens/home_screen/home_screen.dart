// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:africa_relief/view/screens/home_screen/home_cubit/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../componants/home_widgets.dart';
import 'home_cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget{
   HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) =>HomeCubit()..projects,)
      ],
      child: BlocConsumer<HomeCubit,HomeStates>(
        builder: (context, state) => Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(left:10.0,right: 10,top: 60,bottom: 0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      SliderCard(),
                      Padding(
                        padding:  EdgeInsets.only(bottom: 20.0),
                        child: SmoothPageIndicator(
                          count: 5,
                          effect: JumpingDotEffect(
                              dotColor: HexColor('#000000'),
                              activeDotColor: HexColor('FFFFFF'),
                              dotHeight: 10,
                              dotWidth:10,
                              spacing: 2),
                          controller: PageController(),
                        ),
                      ),
                    ],
                  ),
                  ProjectsCategoriesRow(),
                  HeaderAndSeeAllLin(header: 'Our Projects', textButton: 'See All',isProject: true),
                  ProjectList(),
                  HeaderAndSeeAllLin(header: 'Latest Updates', textButton: 'See All',isBlogs: true),
                  SizedBox(
                      height: 105,
                      child: BlogsList()),
                  SizedBox(height: 0,)

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