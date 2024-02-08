// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../config/themes/colors.dart';

class DonationsHistory extends StatelessWidget{
  final bool isDonations;
   DonationsHistory({super.key,  this.isDonations=true});

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
                              child: Text('ID',style: TextStyle(color: greyTextColor,fontSize: 14),),
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
                            child: Text('Form',style: TextStyle(color: greyTextColor,fontSize: 14)),
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
                            child: Text('date',style: TextStyle(color: greyTextColor,fontSize: 14)),
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
                          child: Text('Status',style: TextStyle(color: greyTextColor,fontSize: 14)),
                        ),
                        Container(
                            padding: EdgeInsets.all(8),
                            decoration:BoxDecoration(
                                color: HexColor('F1F7F3'),
                                borderRadius: BorderRadius.circular(50)
                            ),
                            child: Text('completed',style: TextStyle(color: buttonsColor,fontSize: 12),)),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 10.0),
                child: Container(height: .3,width: double.infinity,color: greyTextColor,),
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
                            child: Text('Amount',style: TextStyle(color: greyTextColor,fontSize: 14)),
                          ),
                          Text('\$200',style: TextStyle(color: buttonsColor,fontSize: 18)),
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
                              Text('View Receipt ',style: TextStyle(color: buttonsColor,fontSize: 14),),
                              Icon(Icons.arrow_forward,color: buttonsColor,size: 20,)
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
                                Text('View Receipt ',style: TextStyle(color: buttonsColor,fontSize: 14),),
                                Icon(Icons.arrow_forward,color: buttonsColor,size: 20,)
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
                          border: Border.all(color: greyTextColor)
                        ),
                        child: Icon(Icons.more_vert,color: greyTextColor,),
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