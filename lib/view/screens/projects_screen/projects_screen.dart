// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, sized_box_for_whitespace, curly_braces_in_flow_control_structures

import 'package:africa_relief/config/themes/colors.dart';
import 'package:africa_relief/view/screens/home_screen/home_cubit/home_cubit.dart';
import 'package:africa_relief/view/screens/home_screen/home_cubit/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/projects_model.dart';
import '../../componants/app_widgets.dart';
import '../../componants/projects_widgets.dart';

class ProjectsScreen extends StatefulWidget{
   ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  ScrollController filterController=ScrollController();
  void initState() {
    // TODO: implement initState
    if(filter=='')
    projects=HomeCubit.get(context).projects;
    if(filter!='')
    projects=HomeCubit.get(context).projects.where((element) => element.type!.contains(filter)).toList();
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
      projects=HomeCubit.get(context).projects.where((element) => element.type!.contains(value)).toList();
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
          body: Padding(
            padding:  EdgeInsets.only(left: 13.0,right: 13,bottom: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FilterList(
                  filterController: filterController,
                  onAllTap: (){
                    setState(() {
                      filter='';
                      projects=HomeCubit.get(context).projects;
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
                if(projects.isNotEmpty)
                ProjectsGridView(projects: projects),
                if(projects.isEmpty)
                  Expanded(child: Center(child: Text('No Projects Yet...',style: TextStyle(color: greyTextColor,fontSize: 14),)))
              ],
            ),
          ),
        ),
        listener: (context, state) {

        },
      ),
    );
  }
}
List<ProjectsData> projects=[];
