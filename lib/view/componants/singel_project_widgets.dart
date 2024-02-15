// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:africa_relief/view/componants/variable.dart';
import 'package:africa_relief/view/screens/home_screen/home_cubit/home_cubit.dart';
import 'package:africa_relief/view/screens/home_screen/home_cubit/home_states.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:stripe_sdk/stripe_sdk.dart' as Stripea;

import '../../config/themes/colors.dart';
import '../../core/apis/dio.dart';
import '../../core/stripe_payment/stripe_payment_manager.dart';
import '../../models/payment_intint_model.dart';
import '../screens/single_project_screen/project_screen.dart';

class ProjectTypeText extends StatelessWidget{
  final String projectTypeText;
   ProjectTypeText({super.key, required this.projectTypeText});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8),
        decoration:BoxDecoration(
            color: HexColor('F1F7F3'),
            borderRadius: BorderRadius.circular(50)
        ),
        child: Text(projectTypeText,style: TextStyle(color: buttonsColor,fontSize: 12),));
  }
}
class SubscribersRow extends StatelessWidget{
  SubscribersRow({super.key, });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 16.0),
      child: Row(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                     child: Image(image: NetworkImage('https://cdn.vectorstock.com/i/1000x1000/17/61/male-avatar-profile-picture-vector-10211761.webp'),fit: BoxFit.cover),
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
                           child: Image(image: NetworkImage('https://cdn.vectorstock.com/i/1000x1000/17/61/male-avatar-profile-picture-vector-10211761.webp'),fit: BoxFit.cover),
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
                               child: Image(image: NetworkImage('https://cdn.vectorstock.com/i/1000x1000/17/61/male-avatar-profile-picture-vector-10211761.webp'),fit: BoxFit.cover),
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
                               child: Image(image: NetworkImage('https://cdn.vectorstock.com/i/1000x1000/17/61/male-avatar-profile-picture-vector-10211761.webp'),fit: BoxFit.cover),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ],
              ),
            ),
            Expanded(child: Text('+2635 Others Donated',style: TextStyle(color: greyTextColor,fontSize: 14),maxLines: 1,))
          ]
      ),
    );
  }
}
class ProjectHeaderRow extends StatelessWidget{
  final String header;
  final bool isProjectHeadColor;
  ProjectHeaderRow({super.key, required this.header,  this.isProjectHeadColor=true,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(isProjectHeadColor)
            Container(
            height: 24,
            width: 24,
            child: SvgPicture.asset('assets/images/format_quote.svg',fit: BoxFit.fill,),
          ),
          if(isProjectHeadColor)

          SizedBox(width: 4,),
          Expanded(child: Text(header,style: TextStyle(color: isProjectHeadColor?buttonsColor:Colors.black,fontSize: 16,fontWeight: FontWeight.w500),maxLines: 3,overflow: TextOverflow.ellipsis,)),
        ],
      ),
    );
  }
}
class DonationLogin extends StatelessWidget{
  final void Function() onTap;
  DonationLogin({super.key, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 13,left: 13,top: 12,bottom: 12),
      child: Container(
        height: 52,
        width: double.infinity,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color:buttonsColor,
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            textStyle:MaterialStatePropertyAll(TextStyle(color: Colors.white)),
            overlayColor: MaterialStatePropertyAll(Colors.grey),
            backgroundColor:MaterialStatePropertyAll(Colors.transparent), ),
          onPressed: onTap,
          child: Text('Donate Now',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w600),),
        ),
      ),
    );
  }
}
class DonationBottomSheet extends StatefulWidget{
   void Function()? onTap;
  DonationBottomSheet({super.key,this.onTap});

  @override
  State<DonationBottomSheet> createState() => _DonationBottomSheetState();
}
class _DonationBottomSheetState extends State<DonationBottomSheet> {
  bool first=false;
  bool second=false;
  bool third=false;
  bool isChecked=false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>HomeCubit(),
      child: BlocConsumer<HomeCubit,HomeStates>(
        builder:(context, state) =>  Container(
          color: HexColor('F7F9FA'),
          height: 320.h,
          child: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      height: 7,
                      width: MediaQuery.of(context).size.width / 5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(25),
                          color: HexColor('D9DAE1')),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: 16.0),
                    child: Container(
                      height: 44.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: borderColor),
                      ),
                      child: Center(child: Text('\$ Custom Amount')),
                    ),
                  ),
                  Container(
                    height: 44.h,
                    width: double.infinity,
                    child: ListView.builder(
                      padding: EdgeInsets.all(0),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>  Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 5.0),
                        child: GestureDetector (
                          onTap: (){
                            setState(() {
                              amount=projectAmountsList[index];
                              third=false;
                            });
                          },
                          child: Container(
                            height: 44.h,
                            width: 105,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: amount==projectAmountsList[index]?buttonsColor:borderColor),
                            ),
                            child: Center(child: Text('\$ ${projectAmountsList[index]}')),
                          ),
                        ),
                      ),
                      itemCount: projectAmountsList.length,

                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: 16.0),
                    child: Container(
                      height: 44.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: borderColor),
                        color: HexColor('E4E3E9')
                      ),
                      child: Row(
                        children: [
                          Checkbox(value: isChecked, onChanged: (value) {
                            setState(() {
                              isChecked = !isChecked;
                            });
                          },),
                          Text('Make this donation every'),
                          Spacer(),
                          Padding(
                            padding:  EdgeInsets.only(right: 8.0),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2<String>(
                                style: TextStyle(
                                   fontSize: 14,color: Colors.black),
                                isExpanded: true,
                                hint:  Text(
                                  'once',
                                  style: TextStyle(
                                        fontSize: 14,color: Colors.black),
                                  overflow: TextOverflow.ellipsis,

                                ),
                                isDense: true,
                                items:[
                                  DropdownMenuItem(value: 'year',child: Text('year'),),
                                  // DropdownMenuItem(value: 'quarter',child: Text('quarter'),),
                                  DropdownMenuItem(value: 'month',child: Text('month'),),
                                  DropdownMenuItem(value: 'week',child: Text('week'),),
                                  DropdownMenuItem(value: 'day',child: Text('day'),),
                                  DropdownMenuItem(value: 'once',child: Text('once'),),
                                ],
                                value: selectedItem,
                                onChanged: (value) {
                                  setState(() {
                                    selectedItem = value.toString();
                                  });
                                },
                                buttonStyleData: ButtonStyleData(
                                  // height: 35,
                                  width: 110,
                                  padding:  EdgeInsets.only(left: 10, right: 14),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: HexColor('E4E3E9')
                                    ),
                                      color: HexColor('E4E3E9')
                                  ),
                                  elevation: 0,
                                ),
                                iconStyleData:  IconStyleData(
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                  ),
                                  iconSize: 24,
                                  iconEnabledColor:  Colors.blueGrey,
                                  iconDisabledColor: Colors.grey,
                                ),
                                dropdownStyleData: DropdownStyleData(
                                  elevation: 1,
                                  // maxHeight: 20,
                                  padding: EdgeInsetsDirectional.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.black26,
                                    ),
                                  ),
                                  // offset: const Offset(0, -2),
                                  isOverButton: false,
                                  scrollbarTheme: ScrollbarThemeData(
                                    radius:  Radius.circular(40),
                                    thickness: MaterialStateProperty.all(6),
                                    thumbVisibility: MaterialStateProperty.all(true),
                                  ),
                                  useSafeArea: true
                                ),
                                menuItemStyleData:  MenuItemStyleData(
                                    padding:
                                    EdgeInsetsDirectional.only(start: 0, end: 0),
                                    height: 35
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        Container(
                          height: 52,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: borderColor),
                              color: Colors.white
                          ),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              textStyle:MaterialStatePropertyAll(TextStyle(color: Colors.white)),
                              overlayColor: MaterialStatePropertyAll(Colors.white),
                              backgroundColor:MaterialStatePropertyAll(Colors.white), ),
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                            child: Text('Cancel',style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.w600),),
                          ),
                        ),
                        SizedBox(width: 12,),
                        Expanded(
                          child: Container(
                            height: 52,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: buttonsColor
                            ),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                textStyle:MaterialStatePropertyAll(TextStyle(color: Colors.white)),
                                overlayColor: MaterialStatePropertyAll(Colors.grey),
                                backgroundColor:MaterialStatePropertyAll(Colors.transparent), ),
                              onPressed: widget.onTap,
                              child: Text('Continue',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w600),),
                            ),
                          ),
                        ),
                      ],
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
class ProjectParagraph extends StatelessWidget{
  ProjectParagraph({super.key,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 200,right: 0,left: 0),
      child: Container(
        // height:double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(13),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30))
        ),
        child: SingleChildScrollView(
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
              Column(
                children: [
                  Text(getB3,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16),),
                ],
              ),
              SizedBox(height: 65,)
            ],
          ),
        ),
      ),
    );
  }
}

String? selectedValue;
String selectedItem='once';
