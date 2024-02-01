// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_print

import 'package:africa_relief/view/componants/variable.dart';
import 'package:africa_relief/view/screens/home_screen/home_cubit/home_cubit.dart';
import 'package:africa_relief/view/screens/home_screen/home_cubit/home_states.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../componants/singel_project_widgets.dart';

class ProjectScreen extends StatefulWidget{
   ProjectScreen({super.key});
  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}
class _ProjectScreenState extends State<ProjectScreen> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..projects,
      child: BlocConsumer<HomeCubit,HomeStates>(
        builder: (context, state) =>  Scaffold(
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Stack(
                children: [
                  Stack(
                    children: [
                      Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                          ),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: getImage,
                            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                          ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: 12.0,top: 40),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Icon(Icons.arrow_back_ios,size: 25,color: Colors.white,),),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 12.0,top: 8),
                              child: GestureDetector(
                                  child: SvgPicture.asset('assets/images/share.svg',color: Colors.white,)
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  ProjectParagraph(),
                ],
              ),
              Padding(
                padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/2,bottom: 10),
                child: DonationLogin(
                  onTap: (){
                    setState(() {
                      showModalBottomSheet(
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
ScrollController scrollController=ScrollController();
Color? conColor;