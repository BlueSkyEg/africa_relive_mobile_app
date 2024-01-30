// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../config/themes/colors.dart';
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
                     child: Image(image: NetworkImage('https://s3-alpha-sig.figma.com/img/f351/310a/a237f2216042fe012abbb1d0abfc88f9?Expires=1707696000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=EauKcgu~aO3D-46gn-wZY1YiDIo6XPiVS3Ww3m9j-x6cLo8IFfvi9tHxls7Xiccl6PX5pM6k2PI43awfwq66llh97mvsmpqPTgRtJKF11vzmNBYog35QQz38AcZOFYqx16MCGGUuWrRvr7SO3s1ODmAdWJ2ED0PEQCVzwemh8YbyqZb-p53crBA7DgDxzKRn~4tG20TMk0S55ebGZZ5SEBbAg-91cP9eLELZYfOXXinsoxeJZAPcfd1e20o~EtaPwTeEC9do5wmOT5rOKCpsoxrYMm6qnpEfdyJ2avEfssndtN0o9MTFskg2VgBsYZ~XFvRrk0H3KO-4XdKkAEQqDg__'),fit: BoxFit.cover),
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
                           child: Image(image: NetworkImage('https://s3-alpha-sig.figma.com/img/f351/310a/a237f2216042fe012abbb1d0abfc88f9?Expires=1707696000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=EauKcgu~aO3D-46gn-wZY1YiDIo6XPiVS3Ww3m9j-x6cLo8IFfvi9tHxls7Xiccl6PX5pM6k2PI43awfwq66llh97mvsmpqPTgRtJKF11vzmNBYog35QQz38AcZOFYqx16MCGGUuWrRvr7SO3s1ODmAdWJ2ED0PEQCVzwemh8YbyqZb-p53crBA7DgDxzKRn~4tG20TMk0S55ebGZZ5SEBbAg-91cP9eLELZYfOXXinsoxeJZAPcfd1e20o~EtaPwTeEC9do5wmOT5rOKCpsoxrYMm6qnpEfdyJ2avEfssndtN0o9MTFskg2VgBsYZ~XFvRrk0H3KO-4XdKkAEQqDg__'),fit: BoxFit.cover),
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
                               child: Image(image: NetworkImage('https://s3-alpha-sig.figma.com/img/f351/310a/a237f2216042fe012abbb1d0abfc88f9?Expires=1707696000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=EauKcgu~aO3D-46gn-wZY1YiDIo6XPiVS3Ww3m9j-x6cLo8IFfvi9tHxls7Xiccl6PX5pM6k2PI43awfwq66llh97mvsmpqPTgRtJKF11vzmNBYog35QQz38AcZOFYqx16MCGGUuWrRvr7SO3s1ODmAdWJ2ED0PEQCVzwemh8YbyqZb-p53crBA7DgDxzKRn~4tG20TMk0S55ebGZZ5SEBbAg-91cP9eLELZYfOXXinsoxeJZAPcfd1e20o~EtaPwTeEC9do5wmOT5rOKCpsoxrYMm6qnpEfdyJ2avEfssndtN0o9MTFskg2VgBsYZ~XFvRrk0H3KO-4XdKkAEQqDg__'),fit: BoxFit.cover),
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
                               child: Image(image: NetworkImage('https://s3-alpha-sig.figma.com/img/f351/310a/a237f2216042fe012abbb1d0abfc88f9?Expires=1707696000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=EauKcgu~aO3D-46gn-wZY1YiDIo6XPiVS3Ww3m9j-x6cLo8IFfvi9tHxls7Xiccl6PX5pM6k2PI43awfwq66llh97mvsmpqPTgRtJKF11vzmNBYog35QQz38AcZOFYqx16MCGGUuWrRvr7SO3s1ODmAdWJ2ED0PEQCVzwemh8YbyqZb-p53crBA7DgDxzKRn~4tG20TMk0S55ebGZZ5SEBbAg-91cP9eLELZYfOXXinsoxeJZAPcfd1e20o~EtaPwTeEC9do5wmOT5rOKCpsoxrYMm6qnpEfdyJ2avEfssndtN0o9MTFskg2VgBsYZ~XFvRrk0H3KO-4XdKkAEQqDg__'),fit: BoxFit.cover),
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
  ProjectHeaderRow({super.key, required this.header,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 24,
            width: 24,
            child: SvgPicture.asset('assets/images/format_quote.svg',fit: BoxFit.fill,),
          ),
          SizedBox(width: 4,),
          Expanded(child: Text(header,style: TextStyle(color: buttonsColor,fontSize: 16,fontWeight: FontWeight.w500),maxLines: 2,overflow: TextOverflow.ellipsis,)),
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
  DonationBottomSheet({super.key,});

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
    return Container(
      color: HexColor('F7F9FA'),
      height: 300.h,
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
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 5.0),
                      child: GestureDetector (
                        onTap: (){
                          setState(() {
                            first=true;
                            second=false;
                            third=false;
                          });
                        },
                        child: Container(
                          height: 44.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: first?buttonsColor:borderColor),
                          ),
                          child: Center(child: Text('\$ 50')),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 5.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            first=false;
                            second=true;
                            third=false;
                          });
                        },
                        child: Container(
                          height: 44.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: second?buttonsColor:borderColor),
                          ),
                          child: Center(child: Text('\$ 100')),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 5.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            first=false;
                            second=false;
                            third=true;
                          });

                        },
                        child: Container(
                          height: 44.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: third?buttonsColor:borderColor),
                          ),
                          child: Center(child: Text('\$ 500')),
                        ),
                      ),
                    ),
                  ),
                ],
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
                              'Monthly',
                              style: TextStyle(
                                    fontSize: 14,color: Colors.black),
                              overflow: TextOverflow.ellipsis,

                            ),
                            isDense: true,
                            items:[
                              DropdownMenuItem(value: 'monthly',child: Text('monthly'),),
                              DropdownMenuItem(value: 'yealry',child: Text('yearly'),),
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
                              maxHeight: 130,
                              padding: EdgeInsetsDirectional.all(10),
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
                                radius: const Radius.circular(40),
                                thickness: MaterialStateProperty.all(6),
                                thumbVisibility: MaterialStateProperty.all(true),
                              ),
                              // useSafeArea: true
                            ),
                            menuItemStyleData: const MenuItemStyleData(
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
                          onPressed: (){},
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
    );
  }
}

String? selectedValue;
String selectedItem='monthly';
