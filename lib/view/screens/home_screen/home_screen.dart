// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../config/themes/colors.dart';
import '../../componants/home_widgets.dart';

class HomeScreen extends StatelessWidget{
   HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left:10.0,right: 10,top: 60,bottom: 14),
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
              HeaderAndSeeAllLin(header: 'Our Projects', textButton: 'See All',),
              ProjectList(),
              HeaderAndSeeAllLin(header: 'Latest Updates', textButton: 'See All',),
              SizedBox(
                height: 105,
                  child: UpdatesList())
            ],
          ),
        ),
      ),
    );
  }

}