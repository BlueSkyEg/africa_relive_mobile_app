// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../componants/projects_widgets.dart';

class ProjectsScreen extends StatelessWidget{
   ProjectsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:Size.fromHeight(40),
        child: AppBar(
          leading:Padding(
            padding:  EdgeInsets.only(left: 20.0,top: 8),
            child: Text('Our Projects',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),maxLines: 1,),
          ) ,
          leadingWidth: MediaQuery.of(context).size.width/2,
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.only(left: 13.0,right: 13,bottom: 13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FilterList(),
            ProjectsGridView(),
          ],
        ),
      ),
    );
  }
}