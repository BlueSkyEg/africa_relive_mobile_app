// ignore_for_file: prefer_const_constructors

import 'package:africa_relief/view/screens/navigation_main_screen/navigation_screen.dart';
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
              onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home(),)),
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
class Progress extends StatefulWidget{
  const Progress({super.key});

  @override
  State<Progress> createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CircularProgressIndicator(color: Colors.grey,);
  }
}