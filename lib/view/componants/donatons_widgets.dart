// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:africa_relief/config/themes/icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../config/themes/colors.dart';
import '../screens/payment_screen/payment_screen.dart';
import '../screens/payment_screen/user_cards_screen.dart';
import '../screens/single_project_screen/project_screen.dart';
import 'loginWidgets.dart';

class DonationsHistory extends StatefulWidget{
  final bool isDonations;
   DonationsHistory({super.key,  this.isDonations=true});

  @override
  State<DonationsHistory> createState() => _DonationsHistoryState();
}

class _DonationsHistoryState extends State<DonationsHistory> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(12.0),
      child: ListView.separated(
        itemBuilder: (context, index) => Container(
          height: 240,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.grey,width: .3)
          ),
          child: Column(
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(vertical:16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:  EdgeInsets.only(left: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(bottom: 10.0),
                              child: Text('ID',style: TextStyle(color: AppColors.greyTextColor,fontSize: 14),),
                            ),
                            Text('225'),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(bottom: 10.0),
                            child: Text('Form',style: TextStyle(color: AppColors.greyTextColor,fontSize: 14)),
                          ),
                          Text('Food Basket'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding:  EdgeInsets.only(left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(bottom: 10.0),
                            child: Text('date',style: TextStyle(color: AppColors.greyTextColor,fontSize: 14)),
                          ),
                          Text('10-2-2023'),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(bottom: 10.0),
                          child: Text('Status',style: TextStyle(color: AppColors.greyTextColor,fontSize: 14)),
                        ),
                        Container(
                            padding: EdgeInsets.all(8),
                            decoration:BoxDecoration(
                                color: HexColor('F1F7F3'),
                                borderRadius: BorderRadius.circular(50)
                            ),
                            child: Text('completed',style: TextStyle(color: AppColors.buttonsColor,fontSize: 12),)),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 10.0),
                child: Container(height: .3,width: double.infinity,color: AppColors.greyTextColor,),
              ),
              if(widget.isDonations)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding:  EdgeInsets.only(left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(bottom: 10.0),
                            child: Text('Amount',style: TextStyle(color: AppColors.greyTextColor,fontSize: 14)),
                          ),
                          Text('\$200',style: TextStyle(color: AppColors.buttonsColor,fontSize: 18)),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                          height: 44,
                          padding: EdgeInsets.all(8),
                          decoration:BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.grey,width: .3)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('View Receipt ',style: TextStyle(color: AppColors.buttonsColor,fontSize: 14),),
                              Icon(Icons.arrow_forward,color: AppColors.buttonsColor,size: 20,)
                            ],
                          )),
                    ),
                  ),
                ],
              ),
              if(widget.isDonations==false)
              Padding(
                padding:  EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 12.0,left: 12),
                        child: Container(
                            height: 44,
                            padding: EdgeInsets.all(8),
                            decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(color: Colors.grey,width: .3)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('View Receipt ',style: TextStyle(color: AppColors.buttonsColor,fontSize: 14),),
                                Icon(Icons.arrow_forward,color: AppColors.buttonsColor,size: 20,)
                              ],
                            )),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(right: 12.0,left: 12),
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) => Container(
                                height: 150.h,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 16.0,top: 8),
                                        child: Container(height: 4,color: AppColors.greyTextColor,width: MediaQuery.of(context).size.width/6,),
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                            child: Icon(Icons.edit,color: AppColors.greyTextColor,),
                                          ),
                                          Text('Manage Subscription',style: TextStyle(color: AppColors.greyTextColor),)
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 24.0),
                                        child: GestureDetector(
                                          onTap: (){
                                            showDialog(
                                              context: context,
                                              builder: (context) => CancelDialogItemBuilder(),
                                            );
                                          },
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                child: Icon(Icons.cancel,color: Colors.redAccent,),
                                              ),
                                              Text('Cancel Subscription',style: TextStyle(color: Colors.redAccent),)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              shape: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10)),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                            );
                          });
                        },
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: AppColors.greyTextColor)
                          ),
                          child: Icon(Icons.more_vert,color: AppColors.greyTextColor,),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(height: 12,),
        itemCount: 10,
      ),
    );
  }
}
class AnnualReceiptsItemBuilder extends StatelessWidget{
  final bool isDonations;
  AnnualReceiptsItemBuilder({super.key,  this.isDonations=true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(12.0),
      child: ListView.separated(
        itemBuilder: (context, index) => Container(
          height: 180,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.grey,width: .3)
          ),
          child: Column(
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(vertical:16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:  EdgeInsets.only(left: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(bottom: 10.0),
                              child: Text('amount',style: TextStyle(color: AppColors.greyTextColor,fontSize: 14),),
                            ),
                            Text('\$200',style: TextStyle(fontWeight: FontWeight.w600),),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(bottom: 10.0),
                            child: Text('Donations',style: TextStyle(color: AppColors.greyTextColor,fontSize: 14)),
                          ),
                          Text('7',style: TextStyle(fontWeight: FontWeight.w600),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Expanded(
              //       child: Padding(
              //         padding:  EdgeInsets.only(left: 20.0),
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Padding(
              //               padding:  EdgeInsets.only(bottom: 10.0),
              //               child: Text('date',style: TextStyle(color: AppColors.greyTextColor,fontSize: 14)),
              //             ),
              //             Text('10-2-2023'),
              //           ],
              //         ),
              //       ),
              //     ),
              //     Expanded(
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Padding(
              //             padding:  EdgeInsets.only(bottom: 10.0),
              //             child: Text('Status',style: TextStyle(color: AppColors.greyTextColor,fontSize: 14)),
              //           ),
              //           Container(
              //               padding: EdgeInsets.all(8),
              //               decoration:BoxDecoration(
              //                   color: HexColor('F1F7F3'),
              //                   borderRadius: BorderRadius.circular(50)
              //               ),
              //               child: Text('completed',style: TextStyle(color: AppColors.buttonsColor,fontSize: 12),)),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 10.0),
                child: Container(height: .3,width: double.infinity,color: AppColors.greyTextColor,),
              ),
              if(isDonations)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding:  EdgeInsets.only(left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(bottom: 10.0),
                            child: Text('Year',style: TextStyle(color: AppColors.greyTextColor,fontSize: 14)),
                          ),
                          Text('2023',style: TextStyle(color: AppColors.buttonsColor,fontSize: 18,fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                          height: 44,
                          padding: EdgeInsets.all(8),
                          decoration:BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.grey,width: .3)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('View Receipt ',style: TextStyle(color: AppColors.buttonsColor,fontSize: 14),),
                              Icon(Icons.arrow_forward,color: AppColors.buttonsColor,size: 20,)
                            ],
                          )),
                    ),
                  ),
                ],
              ),
              if(isDonations==false)
              Padding(
                padding:  EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 12.0,left: 12),
                        child: Container(
                            height: 44,
                            padding: EdgeInsets.all(8),
                            decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(color: Colors.grey,width: .3)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('View Receipt ',style: TextStyle(color: AppColors.buttonsColor,fontSize: 14),),
                                Icon(Icons.arrow_forward,color: AppColors.buttonsColor,size: 20,)
                              ],
                            )),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(right: 12.0,left: 12),
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: AppColors.greyTextColor)
                        ),
                        child: Icon(Icons.more_vert,color: AppColors.greyTextColor,),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(height: 12,),
        itemCount: 10,
      ),
    );
  }
}
class CancelDialogItemBuilder extends StatelessWidget{
  const CancelDialogItemBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          height: 280,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset('assets/images/cancel.png'),
              Padding(
                padding:  EdgeInsets.only(top: 12.0),
                child: Text(
                  'Are you sure you want to cancel your subscription?',
                  style: TextStyle(fontSize: 14.0,color: Colors.grey,decorationColor: Colors.white,decorationThickness: 0),maxLines: 2,
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Expanded(
                    child: ButtonItemBuilder(
                        color: Colors.white,
                        isLogin: false,
                        onTap: () async {
                          Navigator.pop(context);
                        },
                        textwidget: Text('No, Keep',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w600))),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ButtonItemBuilder(
                      color: Colors.redAccent,
                        isLogin: false,
                        onTap: () async {
                          Navigator.pop(context);
                        },
                        textwidget: Text('Yes, Cancel ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w600))),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}
