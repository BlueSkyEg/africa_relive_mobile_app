// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unrelated_type_equality_checks, curly_braces_in_flow_control_structures

import 'package:africa_relief/config/themes/colors.dart';
import 'package:africa_relief/view/componants/app_widgets.dart';
import 'package:africa_relief/view/screens/login_screen/login.dart';
import 'package:africa_relief/view/screens/login_screen/login_cubit/login_cubit.dart';
import 'package:africa_relief/view/screens/login_screen/login_cubit/login_states.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../config/themes/icons.dart';
import '../../componants/api_errors_handeller.dart';
import '../../componants/loginWidgets.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}
class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var confirmPassController = TextEditingController();
  var nameController = TextEditingController();
  @override
  void initState() {
    isStronge=false;
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
                      LogoItemBuilder(n: 150),
                      Padding(
                        padding: EdgeInsets.only(right: 14, left: 14,bottom: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(padding:  EdgeInsets.only(bottom: 8.0,top: 8), child:FormFields(controller: nameController, labelText: 'Name', hintText: 'eg John Doe',prefixIcon: Icon(IconBroken.Profile,color: AppColors.buttonsColor,)),),
                            Padding(padding:  EdgeInsets.only(bottom: 8.0), child: FormFields(controller: emailController, labelText: 'E-mail', hintText: 'example@example.com',prefixIcon: Icon(IconBroken.Message,color: AppColors.buttonsColor,),),),
                            Padding(padding:  EdgeInsets.only(bottom: 8.0), child:FormFields(controller: passController, labelText: 'Password', hintText: 'Enter Password',isRegister: true,isPass: true,)),
                            Padding(padding:  EdgeInsets.only(bottom: 8.0), child:FormFields(controller: confirmPassController, labelText: 'Confirm Password', hintText: 'Confirm Password',isPass: true,),),
                            ButtonItemBuilder(
                              isLogin: false,
                              onTap:()async{
                                print(isStronge);
                                if (formKey.currentState!.validate()) {
                                  FocusScope.of(context).unfocus();
                                }

                                if(passController.text==confirmPassController.text&&isStronge==true)
                                  LoginCubit.get(context).Register(mail: emailController.text, pass: passController.text,name: nameController.text,confirmPass: confirmPassController.text);
                                if(passController.text!=confirmPassController.text||isStronge==false)
                                  setState(() {
                                    showDialog(context: context, builder: (BuildContext context) {return ErrorDialog(error: Errors.passwordNotStrongOrNotMatch,);},);
                                  });
                              } ,
                              textwidget: state is GetRegisterStateLoading?Progress():Text('Register',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w600),),
                            ),
                            OrLine(),
                            RowLoginWays(),
                            RegisterLine(text: 'Already have an account?',buttonText: 'Login',),
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
          if(state is GetRegisterStateSuccess)
          {
            if(state.login!.success!) {
              ShowToast(message: '${state.login.message}', state:ToastState.SUCCESS);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
            } else {
              ShowToast(message: '${state.login.message}', state:ToastState.ERROR);
            }
          }
          if(state is GetRegisterStateError&&state.error.toString().contains(Errors.authenticationError))
            showDialog(context: context, builder: (BuildContext context) {return ErrorDialog(error: Errors.authenticationErrorText,);},);

        },
      ),
    );
  }
}

