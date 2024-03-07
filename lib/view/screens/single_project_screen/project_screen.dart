// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_print

import 'package:africa_relief/view/componants/variable.dart';
import 'package:africa_relief/view/screens/home_screen/home_cubit/home_cubit.dart';
import 'package:africa_relief/view/screens/home_screen/home_cubit/home_states.dart';
import 'package:africa_relief/view/screens/navigation_main_screen/navigation_screen.dart';
import 'package:africa_relief/view/screens/payment_screen/payment_screen.dart';
import 'package:africa_relief/view/screens/payment_screen/user_cards_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../config/themes/colors.dart';
import '../../componants/loginWidgets.dart';
import '../../componants/payments_widgets.dart';
import '../../componants/singel_project_widgets.dart';
import 'package:stripe_sdk/stripe_sdk.dart' as Stripea;


class ProjectScreen extends StatefulWidget{
   ProjectScreen({super.key});
  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}
class _ProjectScreenState extends State<ProjectScreen> {
  @override
  void initState() {
    selectedItem='once';
    print(selectedItem);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..projects,
      child: BlocConsumer<HomeCubit,HomeStates>(
        builder: (context, state) =>  Scaffold(
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              TopSideOfSingleProject(),
              Padding(
                padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/2,bottom: 10),
                child: DonationButton(
                  onTap: (){
                    setState(() {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => DonationBottomSheet(onTap: (){
                              setState(() {
                                if(userCardList.isEmpty) {Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentScreen(),));}
                                if(userCardList.isNotEmpty){
                                  showDialog(
                                    context: context,
                                      builder: (context) => SelectedPayWay(),
                                  );
                                }
                              });
                            }),
                        shape: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(25)),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                      );
                    });
                  },),
              )
            ],
          ),
        ),
        listener: (context, state) {},
      ),
    );
  }
}
ScrollController scrollController=ScrollController();
Color? conColor;