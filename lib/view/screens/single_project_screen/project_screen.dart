// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wtf_sliding_sheet/wtf_sliding_sheet.dart';

import '../../../config/themes/colors.dart';

class ProjectScreen extends StatefulWidget{
   ProjectScreen({super.key});
  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  @override
  // void initState() {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return Container(
  //         height: 200.0, // Set the height of the bottom sheet
  //         child: Center(
  //           child: Text('This is the Bottom Sheet'),
  //         ),
  //       );
  //     },
  //   );
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingSheet(
        elevation: 4,
        cornerRadius: 50,
        snapSpec: const SnapSpec(
          // Enable snapping. This is true by default.
          snap: true,
          // Set custom snapping points.
          snappings: [.8, 0.7, 1.0],
          // Define to what the snappings relate to. In this case,
          // the total available space that the sheet can expand to.
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        // The body widget will be displayed under the SlidingSheet
        // and a parallax effect can be applied to it.
        body: Container(
          height: MediaQuery.of(context).size.height/2.5,

          child: SvgPicture.asset('assets/images/project.svg',fit: BoxFit.fill,),
        ),
        builder: (context, state) {
          // This is the content of the sheet that will get
          // scrolled, if the content is bigger than the available
          // height of the sheet.
          return Padding(
            padding:  EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.height/1.3,
              child: Padding(
                padding:  EdgeInsets.only(top:8.0,left: 16,right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(child: Text('Healthcare Initiative Donation',maxLines: 2,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),)),
                        Container(
                            padding: EdgeInsets.all(8),
                            decoration:BoxDecoration(
                                color: HexColor('F1F7F3'),
                                borderRadius: BorderRadius.circular(50)
                            ),
                            child: Text('Education',style: TextStyle(color: buttonsColor,fontSize: 12),)),
                      ],
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top: 16.0),
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              Container(
                              height: 40,
                              width: 40,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: SvgPicture.asset('assets/images/person1.svg',fit: BoxFit.cover,),
                                                    ),
                              Stack(
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.only(left: 15.0),
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.white,
                                            spreadRadius: 1,
                                            blurRadius: 0,
                                            offset: Offset(-2, -.5), // changes the shadow direction
                                          ),
                                        ],
                                      ),
                                      child: SvgPicture.asset('assets/images/person1.svg',fit: BoxFit.cover,),
                                    ),
                                  ),
                                  Stack(
                                    children: [
                                      Padding(
                                        padding:  EdgeInsets.only(left: 40.0),
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          clipBehavior: Clip.antiAliasWithSaveLayer,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.white,
                                                spreadRadius: 1,
                                                blurRadius: 0,
                                                offset: Offset(-2, -.5), // changes the shadow direction
                                              ),
                                            ],
                                          ),
                                          child: SvgPicture.asset('assets/images/person1.svg',fit: BoxFit.cover,),
                                        ),
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.only(left: 65.0),
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          clipBehavior: Clip.antiAliasWithSaveLayer,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.white,
                                                spreadRadius: 1,
                                                blurRadius: 0,
                                                offset: Offset(-2, -.5), // changes the shadow direction
                                              ),
                                            ],
                                          ),
                                          child: SvgPicture.asset('assets/images/person1.svg',fit: BoxFit.cover,),
                                        ),
                                      ),
                                    ],
                                  ),

                                ],
                              ),
                            ],
                          ),
                        ]
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}