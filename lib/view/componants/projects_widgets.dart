// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:africa_relief/view/componants/variable.dart';
import 'package:africa_relief/view/screens/single_project_screen/project_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../config/themes/colors.dart';
import '../../models/projects_model.dart';
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
  final List<int> amounts;
   CardOfGridviewOfProjects({super.key, required this.image, required this.type, required this.title, required this.h1, required this.h2, required this.h3, required this.b1, required this.b2, required this.b3, required this.amounts});

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
        projectAmountsList=amounts;
        amount=projectAmountsList.isNotEmpty?projectAmountsList.first:0;
        print(amounts);
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
              width: 230,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.05),
                  borderRadius: BorderRadius.circular(30)
              ),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: image,
                placeholder: (context, url) => Center(child: CircularProgressIndicator(color:HexColor('F7F9FA'),)),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
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
  List<ProjectsData> projects;
  ProjectsGridView({super.key,required this.projects});

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
        children: projects.map((e) => CardOfGridviewOfProjects(
            image: e.image.toString(),
            type: e.type.toString(),
            title: e.title.toString(),
          h1: e.header1.toString(),
          h2: e.header2.toString(),
          h3: e.header3.toString(),
          b1: e.body1.toString(),
          b2: e.body2.toString(),
          b3: e.body3.toString(),
          amounts: e.amounts!=null?e.amounts!.toList():[],
        )).toList(),

      ),
    );
  }

}
class RowOfProjectsFilter extends StatefulWidget{
  final String imagePath;
  final String lapel;
  RowOfProjectsFilter({super.key, required this.imagePath, required this.lapel, });

  @override
  State<RowOfProjectsFilter> createState() => _RowOfProjectsFilterState();
}

class _RowOfProjectsFilterState extends State<RowOfProjectsFilter> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 3.0),
      child: Container(
        height: 35,
        padding: EdgeInsetsDirectional.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: AppColors.borderColor),
          color: filter.contains(widget.lapel)?AppColors.buttonsColor:null
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // height: 22,
              // width: 22,
              child: SvgPicture.asset(widget.imagePath,fit: BoxFit.cover,)
            ),
            Padding(
              padding:  EdgeInsets.only(left: 8,top: 0.0,right: 8),
              child: Text(widget.lapel,style: TextStyle(color: filter.contains(widget.lapel)?Colors.white:Colors.black),maxLines: 1,overflow: TextOverflow.ellipsis,),
            )
          ],
        ),
      ),
    );
  }
}
class FilterList extends StatefulWidget{
  final void Function()? onAllTap;
  final  Function(String) onfoodTap;
  final String food;
  final String water;
  final String education;
  final String medical;
  final String orphan;
  final String zakat;
  final String ramadan;
  final ScrollController filterController;
  FilterList({super.key, this.onAllTap, required this.onfoodTap, required this.food, required this.water, required this.education, required this.medical, required this.orphan, required this.zakat, required this.ramadan, required this.filterController,});
  @override
  State<FilterList> createState() => _FilterListState();
}

class _FilterListState extends State<FilterList> {
  @override
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding:  EdgeInsets.only(top: 16.0,bottom: 16,left: 0),
      child: Container(
        height: 44,
        child: PageView(
          controller: PageController(initialPage: s),
          children: [
            Row(
            children: [
              GestureDetector(
                onTap: widget.onAllTap,
                child: Container(
                  height: 32,
                  padding: EdgeInsetsDirectional.only(top: 5,bottom: 5,start: 14,end: 14),
                  decoration: BoxDecoration(
                      color: filter==''?AppColors.buttonsColor:Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: AppColors.borderColor)
                  ),
                  child: Center(child: Text('All',style: TextStyle(color: filter==''?Colors.white:Colors.black,fontSize: 14),)),
                ),
              ),
              Expanded(
                child: GestureDetector(
                    onTap:(){
                      filter=widget.food;
                      widget.onfoodTap(widget.food);
                    } ,
                    child: RowOfProjectsFilter(lapel:'Food Aid',imagePath: Images.food)),
              ),
              Expanded(
                child: GestureDetector(
                    onTap:(){
                      filter=widget.education;
                      widget.onfoodTap(widget.education);
                    } ,
                    child: RowOfProjectsFilter(imagePath: Images.education,lapel: 'Education',)),
              ),
            ],
          ),
            Row(
            children: [
              Expanded(
                child: GestureDetector(
                    onTap:(){
                      filter=widget.medical;
                      widget.onfoodTap(widget.medical);
                    } ,
                    child: RowOfProjectsFilter(imagePath: Images.medical,lapel:'Medical' ,)),
              ),
              Expanded(
                child: GestureDetector(
                    onTap:(){
                      filter=widget.water;
                      widget.onfoodTap(widget.water);
                    } ,
                    child: RowOfProjectsFilter(imagePath: Images.water,lapel: 'Water',)),
              ),
              Expanded(
                child: GestureDetector(
                    onTap:(){
                      filter=widget.zakat;
                      widget.onfoodTap(widget.zakat);
                    } ,
                    child: RowOfProjectsFilter(imagePath: Images.zakat,lapel: 'Zakat',)),
              ),

            ],
          ),
            Row(
            children: [
              GestureDetector(
                  onTap:(){
                    filter=widget.orphan;
                    widget.onfoodTap(widget.orphan);
                  } ,
                  child: RowOfProjectsFilter(imagePath: Images.orphans,lapel: 'Orphan Support',)),
              GestureDetector(
                  onTap:(){
                    filter=widget.ramadan;
                    widget.onfoodTap(widget.ramadan);
                  } ,
                  child: RowOfProjectsFilter(imagePath: Images.ramadan,lapel: 'Ramadan',)),
            ],
          ),
          ]
        ),
      ),
    );
  }
}
String filter='';
int s=0;