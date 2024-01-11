// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:africa_relief/view/screens/single_project_screen/project_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../config/themes/colors.dart';

class CardOfGridviewOfProjects extends StatelessWidget{
   CardOfGridviewOfProjects({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => ProjectScreen(),));

      },
      child: Container(
        width: 165.5,
        height: 216,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20)
        ),
        child: SvgPicture.asset('assets/images/card.svg',fit: BoxFit.fill,),
      ),
    );
  }

}
class ProjectsGridView extends StatelessWidget{
  ProjectsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      child: GridView.count(
        scrollDirection: Axis.vertical,
        padding: EdgeInsetsDirectional.all(0),
        crossAxisCount: 2,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.2/1.6,
        children: [
          CardOfGridviewOfProjects(),
          CardOfGridviewOfProjects(),
          CardOfGridviewOfProjects(),
          CardOfGridviewOfProjects(),
          CardOfGridviewOfProjects(),
          CardOfGridviewOfProjects(),
          CardOfGridviewOfProjects(),
          CardOfGridviewOfProjects(),
          CardOfGridviewOfProjects(),
          CardOfGridviewOfProjects(),
        ],
      ),
    );
  }

}
class RowOfProjectsFilter extends StatelessWidget{
  final String imagePath;
  final String lapel;
  RowOfProjectsFilter({super.key, required this.imagePath, required this.lapel});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: 32,
        padding: EdgeInsetsDirectional.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: borderColor)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 22,
              width: 22,
              child: SvgPicture.asset(imagePath,),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 8,top: 0.0,right: 8),
              child: Text(lapel,style: TextStyle(fontSize: 14,),maxLines: 1,),
            )
          ],
        ),
      ),
    );
  }

}
class FilterList extends StatelessWidget{
  FilterList({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding:  EdgeInsets.only(top: 16.0,bottom: 16,left: 3),
      child: Container(
        height: 36,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              height: 32,
              padding: EdgeInsetsDirectional.only(top: 5,bottom: 5,start: 14,end: 14),
              decoration: BoxDecoration(
                  color: buttonsColor,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: borderColor)
              ),
              child: Center(child: Text('All',style: TextStyle(color: Colors.white,fontSize: 14),)),
            ),
            RowOfProjectsFilter(lapel: 'Food',imagePath: 'assets/images/cart.svg',),
            RowOfProjectsFilter(imagePath: 'assets/images/book.svg',lapel: 'Education',),
            RowOfProjectsFilter(imagePath: 'assets/images/hospital.svg',lapel:'Medical' ,),
            RowOfProjectsFilter(imagePath: 'assets/images/water.svg',lapel: 'Water',),
          ],
        ),
      ),
    );
  }

}
