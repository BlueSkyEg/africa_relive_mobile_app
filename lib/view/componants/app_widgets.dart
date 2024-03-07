// ignore_for_file: prefer_const_constructors

import 'package:africa_relief/view/screens/navigation_main_screen/navigation_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/themes/colors.dart';

class CustomAppBar extends StatefulWidget {
  final String text;
  final void Function()? onBack;
  const CustomAppBar({super.key, required this.text, this.onBack,});

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
              onTap: widget.onBack??() => Navigator.pop(context),
              child: Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,),),
            Padding(
              padding:  EdgeInsets.only(left: 20.0,top: 0),
              child: Text(widget.text,style: TextStyle(color: AppColors.blacks,fontWeight: FontWeight.bold,fontSize: 16),maxLines: 1,overflow: TextOverflow.ellipsis,),),


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