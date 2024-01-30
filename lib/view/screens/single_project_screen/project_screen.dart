// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_print

import 'package:africa_relief/view/componants/variable.dart';
import 'package:africa_relief/view/screens/home_screen/home_cubit/home_cubit.dart';
import 'package:africa_relief/view/screens/home_screen/home_cubit/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wtf_sliding_sheet/wtf_sliding_sheet.dart';

import '../../../config/themes/colors.dart';
import '../../componants/singel_project_widgets.dart';

class ProjectScreen extends StatefulWidget{
   ProjectScreen({super.key});
  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}
class _ProjectScreenState extends State<ProjectScreen> {
  void _onScroll() {
    // Calculate scroll percentage
    double scrollPercentage = scrollController.offset / scrollController.position.maxScrollExtent;

    // Update container color based on scroll percentage
    setState(() {
      conColor = Color.lerp(buttonsColor, buttonsColor.withOpacity(.5), scrollPercentage);
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    scrollController.addListener(_onScroll);
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
              SlidingSheet(
                elevation: 4,
                cornerRadius: 24,
                snapSpec: const SnapSpec(
                  snap: true,
                  snappings: [.8, 0.9, 1],
                  positioning: SnapPositioning.relativeToAvailableSpace,
                ),
                body: Stack(
                  alignment:  Alignment.topLeft,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height/2.5,
                      width: double.infinity,
                      child: Image(image: NetworkImage(getImage),fit: BoxFit.fill)
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 16,top:40.0),
                      child: GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                            },
                          child: Icon(Icons.arrow_back_ios,color: Colors.white,)),
                    ),
                  ],
                ),
                builder: (context, state) {
                  return Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height/1.1,
                      child: Padding(
                        padding:  EdgeInsets.only(top:8.0,left: 16,right: 16),
                        child: SingleChildScrollView(
                          controller: scrollController,
                          // physics: NeverScrollableScrollPhysics(),
                          child: Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(child: Text(getTitle,maxLines: 2,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),)),
                                    ProjectTypeText(projectTypeText: getType),
                                  ],
                                ),
                                SubscribersRow(),
                                ProjectHeaderRow(header: getH1),
                                SizedBox(
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    physics: NeverScrollableScrollPhysics(),
                                    child: Column(
                                      children: [
                                        Text(getB1,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16),),
                                      ],
                                    ),
                                  ),
                                ),
                                ProjectHeaderRow(header: getH2),
                                SizedBox(
                                  child: SingleChildScrollView(
                                    physics: NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    child: Column(
                                      children: [
                                        Text(getB2,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16),),
                                      ],
                                    ),
                                  ),
                                ),
                                ProjectHeaderRow(header: getH3),
                                Padding(
                                  padding:  EdgeInsets.only(bottom: 8.0),
                                  child: SizedBox(
                                    child: SingleChildScrollView(
                                      physics: NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      child: Column(
                                        children: [
                                          Text(getB3,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16),),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 52,)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              Padding(
                padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/2),
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