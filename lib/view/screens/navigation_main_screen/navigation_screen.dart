// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sort_child_properties_last, unnecessary_string_interpolations, sized_box_for_whitespace

import 'package:africa_relief/config/themes/colors.dart';
import 'package:africa_relief/config/themes/icons.dart';
import 'package:africa_relief/view/screens/blogs_screen/blogs.dart';
import 'package:africa_relief/view/screens/home_screen/home_screen.dart';
import 'package:africa_relief/view/screens/profile_screen/profile.dart';
import 'package:africa_relief/view/screens/projects_screen/projects_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hidable/hidable.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'app_cubit/app_cubit.dart';
import 'app_cubit/app_states.dart';



class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // PageController _viewControllerVertical=PageController(initialPage:currantScreen);
  // PageController _viewControllerHorizontal=PageController(initialPage:currantScreen);
  List<Widget> shopScreens = [
    HomeScreen(),
    ProjectsScreen(),
    BlogsScreen(),
    ProfileScreen()
  ];
  // void showTutorial() {
  //   if(appBarCase==false&&currantScreen==2)
  //     tutorialCoachMarkHome.show(context: context);
  // }
  @override
  void initState() {
    // createTutorialHome();
    // Future.delayed(Duration.zero, showTutorial);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => AppCubit()),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        builder: (BuildContext context, state) {
          return Scaffold(
            // drawer: BuildDrawer(isHome: true),
            body:  shopScreens[currantScreen],
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: HexColor('D9DAE1'))
                ),
                child: StylishBottomBar(
                    hasNotch: true,
                    backgroundColor:Colors.white,
                    elevation: 0,
                    onTap: (value) {
                      setState(() {
                        AppCubit.get(context).changeBottomNave(value,context);
                      });
                      // void showTutorial() {
                      //   if (appBarCase == false && currantScreen == 2)
                      //     tutorialCoachMarkHome.show(context: context);
                      // }
                      //
                      // if (appBarCase == false && currantScreen == 2) {
                      //   createTutorialHome();
                      //   Future.delayed(Duration.zero, showTutorial);
                      // }
                      // pageNumber = 1;
                      // isPending = true;
                      // folderPath = '';
                      // folders = [];
                      // sortKey='';
                      // sortOrder='';
                      // AppCubit.get(context).changeBottomNave(value,context);
                    },                      currentIndex: currantScreen,
                    items: [
                      BottomBarItem(
                          selectedColor: buttonsColor,
                          icon: Icon(IconBroken.Home,color: currantScreen==0?buttonsColor:Colors.grey,),
                          title: Text('Home',
                              style: TextStyle(fontSize: 10))),
                      BottomBarItem(
                          selectedColor: buttonsColor,
                          icon: Icon(IconBroken.Category,color: currantScreen==1?buttonsColor:Colors.grey,),
                          title: Text('Projects',
                              style: TextStyle(fontSize: 10))),
                      BottomBarItem(
                          selectedColor: buttonsColor,
                          icon: Icon(IconBroken.Paper,color: currantScreen==2?buttonsColor:Colors.grey,),
                          title: Text('News',
                              style: TextStyle(fontSize: 10))),
                      BottomBarItem(
                          selectedColor: buttonsColor,
                          icon: SvgPicture.asset('assets/images/profile.svg',color: currantScreen==3?buttonsColor:Colors.grey,),
                          title: Text('Profile',
                              style: TextStyle(fontSize: 10))),
                    ],
                    option: BubbleBarOptions(
                        unselectedIconColor: Colors.grey,
                        bubbleFillStyle: BubbleFillStyle.fill,
                        barStyle: BubbleBarStyle.vertical,

                        padding: EdgeInsets.only(bottom: 0, top: 0)
                    )
                ),
              ),
            ),
          );
        },
        listener: (BuildContext context, Object? state) {},
      ),
    );
    //  }
  }
}
final ScrollController scrollControllerNav = ScrollController();
