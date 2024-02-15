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
              Stack(
                children: [
                  Stack(
                    children: [
                      Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                          ),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: getImage,
                            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                          ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: 12.0,top: 40),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home(),)),
                              child: Icon(Icons.arrow_back_ios,size: 25,color: Colors.white,),),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 12.0,top: 8),
                              child: GestureDetector(
                                  child: SvgPicture.asset('assets/images/share.svg',color: Colors.white,)
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  ProjectParagraph(),
                ],
              ),
              Padding(
                padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/2,bottom: 10),
                child: DonationLogin(
                  onTap: (){
                    setState(() {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => DonationBottomSheet(onTap: (){
                              setState(() {
                                if(userCardList.isEmpty) {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentScreen(),));
                                }
                                if(userCardList.isNotEmpty){
                                  showDialog(
                                    context: context,
                                      builder: (context) => Center(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                          child: Container(
                                            height: 280,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(8.0),
                                            ),
                                            padding: EdgeInsets.all(16.0),
                                            child: Column(
                                              children: [
                                                Icon(Icons.add_card,size: 100,),
                                                Padding(
                                                  padding:  EdgeInsets.only(top: 12.0,bottom: 12),
                                                  child: Text(
                                                    'Do you want to choose from your saves cards?',
                                                    style: TextStyle(fontSize: 18.0,color: buttonsColor,decorationColor: Colors.white,decorationThickness: 0),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                Spacer(),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: ButtonLogin(
                                                        color: Colors.white,
                                                          isLogin: false,
                                                          onTap: ()async{
                                                            Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentScreen(),));
                                                          },
                                                          textwidget: Text('No Thanks',style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.w600))),
                                                    ),
                                                    SizedBox(width: 10,),
                                                    Expanded(
                                                      child: ButtonLogin(
                                                          isLogin: false,
                                                          onTap: ()async{
                                                            Navigator.push(context, MaterialPageRoute(builder: (context) => SavesCards(),));
                                                          },
                                                          textwidget: Text('Ok',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w600))),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
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
        listener: (context, state) {

        },
      ),
    );
  }
}
ScrollController scrollController=ScrollController();
Color? conColor;