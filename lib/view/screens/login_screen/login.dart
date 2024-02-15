// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:africa_relief/config/themes/colors.dart';
import 'package:africa_relief/view/screens/login_screen/login_cubit/login_cubit.dart';
import 'package:africa_relief/view/screens/login_screen/login_cubit/login_states.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:stripe_sdk/stripe_sdk.dart';
import '../../../core/apis/dio.dart';
import '../../../models/payment_intint_model.dart';
import '../../componants/loginWidgets.dart';
import 'package:flutter_stripe/flutter_stripe.dart' as str;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        builder: (context, state) => Scaffold(
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(top: 0,bottom: 40),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 210,
                              width: double.infinity,
                              child: Opacity(
                                  opacity: .05,
                                  child: CachedNetworkImage(
                                    imageUrl: 'https://s3-alpha-sig.figma.com/img/15b7/ece2/fd92d0da299387f0a38037a97c4284da?Expires=1707696000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=kAWaycqBVocVYWMGz7ogfEbTF2L2llL~9U3lK1nrtdib5oICu2bJINA0BnH2smDCwGLUOI8LOb6jb9BdSnT8AhQjQfL2NKRSuuBbZFslmLhXmqIiVtw0hrzaxKvP0~FClqmBlbQw1TBM8oZW45nNDZkvV3Gxx1dwhYYjIqwTr~2UlBqrdwebwRukTDxgxUhX2Jw05WPxTTBMVqpgdAIZFNaA9QQfmgHwyCf~~Df3n-Mt-D-07XhXzFsbitAX-Xe6p7AlveBr8JRCzHFAfuU5C-gWYxyAHTOrzxX3E92YrOJduIBbPf2JYAu6dbe-b43-tcymoU8s7Onhc3u9b2N-4g__',
                                    fit: BoxFit.fill,
                                    placeholder: (context, url) => Center(child: CircularProgressIndicator(color:HexColor('F7F9FA'),)),
                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                  )
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(top: 170.0),
                              child: Container(
                                  height: 112,
                                  width: 112,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white,
                                        spreadRadius: 20,
                                        blurRadius: 50,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: CachedNetworkImage(
                                      imageUrl: 'https://s3-alpha-sig.figma.com/img/23e0/00b4/25f00d4ad8dbbe20b8a6ce69ea63435e?Expires=1707696000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=iTCvY1fPU6BPG-6so~uK6zKju~ER9ufSAbN5noRluxXgV4AU-pnfxv7EQ2-Syr5uwB0oVkgYJX4HRML2u0vmryHXqdycR78ayigOb8foSvyI9gOVSZHLQFlNr6KprZg2MU4QCgouLimv-qOeuXdcG0-vHhWNVBM~GzTGpi-QSvqBsZZ69klUOAgWtm5WpLX~mmDux--vwo6434Dmu2rkqORZ6bYS6o8tAkp0x9GPmqY-EIntKsSuFUS4AR48BCKOMqHp3UKqLm~aZIeiav1zgCWlNPwbuQ4FCuMBUzWvfbSULNCSgRLMU0FRMnR~3duyqXwsyu7eyijs3JDqfnyeKQ__',
                                      fit: BoxFit.fill,
                                    placeholder: (context, url) => Center(child: CircularProgressIndicator(color:HexColor('F7F9FA'),)),
                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        child: Padding(
                          padding: EdgeInsets.only(right: 14, left: 14,bottom: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              FormFields(controller: emailController, labelText: 'E-mail', hintText: 'example@example.com',),
                              Padding(padding:  EdgeInsets.only(bottom: 16.0,top: 40), child:FormFields(controller: passController, labelText: 'Password', hintText: '',isPass: true,),),
                              ButtonLogin(
                                  onTap:()async{
                                // LoginCubit.get(context).UserLogin();
                                // DioHelper.getData(url: '/payment-method/setup-intent').then((value) {
                                //   print(value.data['clientSecret']);
                                // });
                               //  SetupPaymentIntent a;
                               // await Stripe.instance.api.createPaymentMethod({
                               //  'type': 'card',
                               //  'card': {
                               //  'number': '4242424242424242',
                               //  'exp_month': '12',
                               //  'exp_year': '24',
                               //  'cvc': '123',
                               //  }
                               //  }).then((value) {
                               //   print(value['id']);
                               // });
                                if (formKey.currentState!.validate()) {
                                  FocusScope.of(context).unfocus();
                                }
                              } ,
                              textwidget: Text(''),
                              ),
                              TextButton(
                                  onPressed: ()async{},
                                  child: Text('Forget password?',style: TextStyle(color: buttonsColor,fontSize: 14),)),
                              OrLine(),
                              RowLoginWays(),
                              RegisterLine(),
                              SkipButton()
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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

