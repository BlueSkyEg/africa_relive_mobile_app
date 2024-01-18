// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingSheet(
        elevation: 4,
        cornerRadius: 24,
        snapSpec: const SnapSpec(
          snap: true,
          snappings: [.8, 0.7, 1.0],
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        body: Stack(
          alignment:  Alignment.topLeft,
          children: [
            Container(
              height: MediaQuery.of(context).size.height/2.5,
              child: SvgPicture.asset('assets/images/project.svg',fit: BoxFit.fill,),
            ),
            Padding(
              padding:  EdgeInsets.only(top:16.0),
              child: IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                    },
                  icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
            ),
          ],
        ),
        builder: (context, state) {
          return Padding(
            padding:  EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.height/1.3,
              child: Padding(
                padding:  EdgeInsets.only(top:8.0,left: 16,right: 16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(child: Text('Healthcare Initiative Donation',maxLines: 2,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),)),
                          ProjectTypeText(projectTypeText: 'Education'),
                        ],
                      ),
                      SubscribersRow(),
                      ProjectHeaderRow(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height/2.5,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              Text('Africa Relief is an esteemed organization committed to addressing the pressing healthcare challenges in Africa. In light of the critical situation faced by the public health system, we have devised two distinct emergency response strategies aimed at averting a complete collapse and ensuring the availability of essential healthcare services to the vulnerable populations.One of our primary focuses is the rehabilitation of hospitals. Recognizing the vital role these institutions play in providing',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16),),
                            ],
                          ),
                        ),
                      ),
                      DonationLogin(onTap: (){
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
                      },)
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}