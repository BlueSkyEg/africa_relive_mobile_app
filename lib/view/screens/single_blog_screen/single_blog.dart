// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:africa_relief/view/screens/navigation_main_screen/navigation_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../componants/blogs_widgets.dart';
import '../../componants/singel_project_widgets.dart';
import '../home_screen/home_cubit/home_cubit.dart';
import '../home_screen/home_cubit/home_states.dart';

class SingleBlogScreen extends StatefulWidget{
  const SingleBlogScreen({super.key});

  @override
  State<SingleBlogScreen> createState() => _SingleBlogScreenState();
}

class _SingleBlogScreenState extends State<SingleBlogScreen> {
  CarouselController carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>HomeCubit()..projects,
      child: BlocConsumer<HomeCubit,HomeStates>(
        builder: (BuildContext context, HomeStates state)=>Scaffold(
          appBar: PreferredSize(
            preferredSize:Size.fromHeight(40),
            child: AppBar(
              leading:Padding(
                padding:  EdgeInsets.only(left: 12.0,bottom: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home(),)),
                      child: Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,),),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0,top: 8),
                      child: GestureDetector(
                          child: SvgPicture.asset('assets/images/share.svg')
                      ),
                    ),
                  ],
                ),
              ),
              leadingWidth: MediaQuery.of(context).size.width,
            ),
          ),
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding:  EdgeInsets.only(left: 13.0,right: 13,bottom: 13,top: 13),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeaderOfSingleBlog(),
                      ImagesSlider(controller: carouselController),
                      BlogParagraph(),
                      SizedBox(height: 64,)
                    ],
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/2),
                child: DonationLogin(
                  onTap: (){
                    setState(() {
                      showModalBottomSheet(
                        useSafeArea: true,
                        isScrollControlled: true,
                        context: context,
                        builder: (context) =>
                            DonationBottomSheet(),
                        shape: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(25)),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                      );
                    });
                  },),
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
