// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:africa_relief/view/componants/app_widgets.dart';
import 'package:africa_relief/view/componants/home_widgets.dart';
import 'package:africa_relief/view/componants/variable.dart';
import 'package:africa_relief/view/screens/single_blog_screen/single_blog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../config/themes/colors.dart';
import '../../../models/projects_model.dart';
import '../../componants/blogs_widgets.dart';
import '../../componants/projects_widgets.dart';
import '../home_screen/home_cubit/home_cubit.dart';
import '../home_screen/home_cubit/home_states.dart';

class BlogsScreen extends StatefulWidget{
  const BlogsScreen({super.key});

  @override
  State<BlogsScreen> createState() => _BlogsScreenState();
}

class _BlogsScreenState extends State<BlogsScreen> {
  ScrollController filterController=ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    blogs=HomeCubit.get(context).blogs;
    if(filter=='Food Aid'||filter=='Education'||filter=='')
      s=0;
    if(filter=='Medical'||filter=='Water'||filter=='Zakat')
      s=1;
    if(filter=='Orphan Support'||filter=='Ramadan')
      s=2;
    super.initState();
  }
  void UpdateValue (String value){
    setState(() {
      blogs=HomeCubit.get(context).blogs.where((element) => element.type!.contains(value)).toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>HomeCubit()..projects,
      child: BlocConsumer<HomeCubit,HomeStates>(
        builder: (BuildContext context, HomeStates state)=>Scaffold(
          appBar: PreferredSize(
              preferredSize:Size.fromHeight(10),child: AppBar()),
          body: SingleChildScrollView(
            // physics: NeverScrollableScrollPhysics(),
            child: Padding(
              padding:  EdgeInsets.only(left: 13.0,right: 13,bottom: 13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FilterList(
                    filterController: filterController,
                    onAllTap: (){
                      setState(() {
                        filter='';
                        blogs=HomeCubit.get(context).blogs;
                      });
                    },
                    onfoodTap: UpdateValue,
                    food: 'Food Aid',
                    water: 'Water',
                    education: 'Education',
                    medical: 'Medical',
                    orphan: 'Orphan Support',
                    zakat: 'Zakat',
                    ramadan: 'Ramadan',
                  ),
                  if(blogs.isNotEmpty)
                    ProjectsList(blogs: blogs,),
                  if(blogs.isEmpty)
                    Center(child: Text('No Projects Yet...',style: TextStyle(color: AppColors.greyTextColor,fontSize: 14),))
                ],
              ),
            ),
          ),
        ),
        listener: (context, state) {

        },
      ),
    );
  }
}
 List<ProjectsData> blogs=[];
