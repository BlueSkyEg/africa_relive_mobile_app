// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:africa_relief/config/themes/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class NotificationItemBuilder extends StatelessWidget{
  const NotificationItemBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            height: 70,
            width: 60,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
            ),
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl:'https://s3-alpha-sig.figma.com/img/74c8/0569/547ab61d08f35143111d0deb4baaa2b0?Expires=1708905600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=c8FTsmlUj9AhKvXzy08TlNuAMxdz5kr4UyKJBSplcrNsMnN7w6ZdSp5AjOTAGUsBunDq~1udkmTC3gKMAsK-Z0l1t84mxcNLulemnLUMirjRjlC184KJN1KdbvG59Cwnj64Lpnwdzv3TnOccS7TeRgQim44Lj4F3U0OiQg9qYUzRzr4UfSftfNEw1nDsrNi9cTb~9hamV8lgR2Oicoil9ITi~7QCtzwtBOHfGv-CcFmPilVBzkstmwDx3KCdDI62N7TIkkeGeqWXbAuPn~Ir85uiIEiDolh~ujusVm4ngtZeYNfe7eqT2FzJVXJqDGE3VyeGPsheN6YEf2Wiqi3BYw__',
              placeholder: (context, url) => Center(child: CircularProgressIndicator(color:HexColor('F7F9FA'),)),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Expanded(
              child: Padding(
                padding:  EdgeInsets.only(left: 12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('New project added',style: TextStyle(fontSize: 14,color: AppColors.greyTextColor),maxLines: 1,overflow: TextOverflow.ellipsis,),
                    Text('New project added',style: TextStyle(fontSize: 16,color: Colors.black),maxLines: 2,overflow: TextOverflow.ellipsis,),
                  ]
                ),
              )),
          Text('2h ago',style: TextStyle(fontSize: 12,color: AppColors.greyTextColor),maxLines: 1,overflow: TextOverflow.ellipsis,),
        ],
      ),
    );
  }
}
class NotificationList extends StatelessWidget{
  const NotificationList({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.all(12.0),
      child: ListView.separated(
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey,width: .3)
          ),
          child: NotificationItemBuilder(),
        ),
        separatorBuilder: (context, index) => SizedBox(height: 12,),
        itemCount: 10,
      ),
    );
  }
}
