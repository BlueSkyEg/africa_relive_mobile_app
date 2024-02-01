// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:africa_relief/view/componants/images_url.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../componants/home_widgets.dart';

class CategoriesScreen extends StatelessWidget{
  const CategoriesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(

          leading: Container(height: 0,),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 0.0,bottom: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,),),
                  Padding(
                    padding:  EdgeInsets.only(left: 20.0,top: 0),
                    child: Text('Our Projects',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),maxLines: 1,),
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: 16.0),
                        child: ProjectsCategories(imagePath: food,lapel: 'Food Aid',),
                      ),
                      ProjectsCategories(imagePath: medical,lapel:'Medical' ,),
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: 16.0),
                        child: ProjectsCategories(imagePath: orphans,lapel:'Orphans' ,),
                      ),

                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: 16.0),
                        child: ProjectsCategories(imagePath:water,lapel: 'Water',),
                      ),
                      ProjectsCategories(imagePath: zakat,lapel:'Zakat' ,),

                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: 16.0),
                        child: ProjectsCategories(imagePath: education,lapel: 'Education',),
                      ),
                      ProjectsCategories(imagePath: ramadan,lapel:'Ramadan' ,),

                    ],
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }

}