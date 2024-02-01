// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  final String text;
  const CustomAppBar({super.key, required this.text,});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}
class _CustomAppBarState extends State<CustomAppBar> with TickerProviderStateMixin{

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading:Padding(
        padding:  EdgeInsets.only(left: 12.0,bottom: 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,),),
            Padding(
              padding:  EdgeInsets.only(left: 20.0,top: 0),
              child: Text(widget.text,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),maxLines: 1,),
            ),

          ],
        ),
      ),
      leadingWidth: MediaQuery.of(context).size.width,
    );
  }
}