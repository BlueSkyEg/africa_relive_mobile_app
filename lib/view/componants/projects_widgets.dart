// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:africa_relief/view/componants/variable.dart';
import 'package:africa_relief/view/screens/single_project_screen/project_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../config/themes/colors.dart';
import '../screens/home_screen/home_cubit/home_cubit.dart';
import 'images_url.dart';

class CardOfGridviewOfProjects extends StatelessWidget{
  final String image;
  final String type;
  final String title;
  final String h1;
  final String h2;
  final String h3;
  final String b1;
  final String b2;
  final String b3;
   CardOfGridviewOfProjects({super.key, required this.image, required this.type, required this.title, required this.h1, required this.h2, required this.h3, required this.b1, required this.b2, required this.b3});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        getType=type;
        getImage=image;
        getTitle=title;
        getH1=h1;
        getH2=h2;
        getH3=h3;
        getB1=b1;
        getB2=b2;
        getB3=b3;
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProjectScreen(),));
        print(getType);
      },
      child: Container(
        height: 230,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Container(
              height: 230,
              width: 180,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.05),
                  borderRadius: BorderRadius.circular(30)
              ),
              child: Image(image: NetworkImage(image),fit: BoxFit.fill,),
            ),
            Padding(
              padding:  EdgeInsets.only(bottom: 12.0,left: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      width:90,
                      padding: EdgeInsets.all(8),
                      decoration:BoxDecoration(
                        // color:  HexColor('1AFFFFFF'),
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.topLeft,
                            colors:  [
                              Colors.black26,
                              HexColor('1AFFFFFFF'),                            ],
                          ),
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.grey.withOpacity(.1))
                      ),
                      child: Center(child: Text(type,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),maxLines: 1,))),
                  Padding(
                    padding:  EdgeInsets.only(top:8.0),
                    child: Container(
                        padding: EdgeInsets.all(0),
                        width:150,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(color: Colors.black.withOpacity(.05),borderRadius: BorderRadius.circular(5)),
                        child: Text(title,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w600),maxLines: 2,)),
                  ),
                ],
              ),
            )
          ],
        ),
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
        crossAxisCount: MediaQuery.of(context).size.width>500?4:2,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.2/1.6,
        children: HomeCubit.get(context).projects.map((e) => CardOfGridviewOfProjects(
            image: e.image.toString(),
            type: e.type.toString(),
            title: e.title.toString(),
          h1: e.header1.toString(),
          h2: e.header2.toString(),
          h3: e.header3.toString(),
          b1: e.body1.toString(),
          b2: e.body2.toString(),
          b3: e.body3.toString(),
        )).toList(),

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
              child: Image(image: NetworkImage(imagePath)),
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
      padding:  EdgeInsets.only(top: 16.0,bottom: 16,left: 0),
      child: Container(
        height: 36,
        child: ListView(
          padding: EdgeInsets.zero,
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
            RowOfProjectsFilter(lapel: 'Food',imagePath: food,),
            RowOfProjectsFilter(imagePath: education,lapel: 'Education',),
            RowOfProjectsFilter(imagePath: medical,lapel:'Medical' ,),
            RowOfProjectsFilter(imagePath: water,lapel: 'Water',),
            RowOfProjectsFilter(imagePath: orphans,lapel: 'Orphans',),
            RowOfProjectsFilter(imagePath: zakat,lapel: 'Zakat',),
            RowOfProjectsFilter(imagePath: ramadan,lapel: 'Ramadan',),
          ],
        ),
      ),
    );
  }

}
