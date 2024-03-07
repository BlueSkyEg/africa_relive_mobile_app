// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, curly_braces_in_flow_control_structures

import 'package:africa_relief/config/themes/colors.dart';
import 'package:africa_relief/core/helper/Cashhelper/cash_helper.dart';
import 'package:africa_relief/view/componants/api_errors_handeller.dart';
import 'package:africa_relief/view/componants/app_widgets.dart';
import 'package:africa_relief/view/componants/variable.dart';
import 'package:africa_relief/view/screens/home_screen/home_screen.dart';
import 'package:africa_relief/view/screens/login_screen/login_cubit/login_cubit.dart';
import 'package:africa_relief/view/screens/login_screen/login_cubit/login_states.dart';
import 'package:africa_relief/view/screens/login_screen/reset_passwords/forget_password_screen.dart';
import 'package:africa_relief/view/screens/navigation_main_screen/navigation_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../config/themes/icons.dart';
import '../../componants/loginWidgets.dart';

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
  void initState() {
    // TODO: implement initState
    print(token);
    super.initState();
  }
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
                      LogoItemBuilder(),
                      Padding(
                        padding: EdgeInsets.only(right: 14, left: 14),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FormFields(controller: emailController, labelText: 'E-mail', hintText: 'example@example.com',prefixIcon:Icon(IconBroken.Message,color: AppColors.buttonsColor,)),
                            FormFields(controller: passController, labelText: 'Password', hintText: 'Enter Password',isPass: true,),
                            Align(
                              alignment: Alignment.topLeft,
                              child: TextButton(
                                  onPressed: ()async{
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordScreen(),));
                                  },
                                  child: Text('Forgot password?',style: TextStyle(color: AppColors.greyTextColor,fontSize: 14))),
                            ),
                            ButtonItemBuilder(
                              isLogin: false,
                                onTap:()async{
                              if (formKey.currentState!.validate()) {
                                FocusScope.of(context).unfocus();
                              }
                              LoginCubit.get(context).Login(mail: emailController.text, pass: passController.text);
                            } ,
                            textwidget: state is GetLoginStateLoading?Progress():Text('Login',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w600),),
                            ),
                            OrLine(),
                            RowLoginWays(),
                            RegisterLine(),
                            SkipButton()
                          ],
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
          if(state is GetLoginStateSuccess)
          {
            if(state.login!.success==true) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home(),));
              ShowToast(message: '${state.login.message}', state:ToastState.SUCCESS);
              CashHelper.saveData(key: 'token', value: state.login.data!.accessToken.toString());
              token=CashHelper.getData(key: 'token');
              CashHelper.saveData(key: 'name', value: state.login.data!.user!.name.toString());
              name=CashHelper.getData(key: 'name');
              CashHelper.saveData(key: 'email', value: state.login.data!.user!.email.toString());
              email=CashHelper.getData(key: 'email');
            }
            else
              ShowToast(message: '${state.login.message}', state:ToastState.ERROR);
            }
          if(state is GetLoginStateError&&state.error.toString().contains(Errors.authenticationError))
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return ErrorDialog(error: Errors.authenticationErrorText,);
              },
            );
        },
      ),
    );
  }
}

