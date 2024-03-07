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

import '../../../componants/api_errors_handeller.dart';
import '../../../componants/loginWidgets.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}
class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        builder: (context, state) => Scaffold(
          appBar: PreferredSize(
              preferredSize:Size.fromHeight(40),child: CustomAppBar(text:'Forgot Password')),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(vertical: 16.0),
                          child: Text('Enter the email associated with your account, and we’ll send an email with instructions to reset your password.',style: TextStyle(color: AppColors.greyTextColor,fontSize: 16,height: 1.3,fontWeight: FontWeight.w500),textAlign: TextAlign.start,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(padding:  EdgeInsets.only(bottom: 8.0), child:FormFields(controller: emailController, labelText: 'E-mail', hintText: 'eg example@example.com',),),
                              ButtonItemBuilder(
                                isLogin: false,
                                onTap:()async{
                                  if (formKey.currentState!.validate()) {
                                    FocusScope.of(context).unfocus();
                                  }
                                  else{

                                  }
                                } ,
                                textwidget: state is GetRegisterStateLoading?Progress():Text('Send instructions',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w600),),
                              ),
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
        ),
        listener: (context, state) {
          if(state is GetRegisterStateError&&state.error.toString().contains(Errors.authenticationError))
            showDialog(context: context, builder: (BuildContext context) {return ErrorDialog(error: Errors.authenticationErrorText,);},);

        },
      ),
    );
  }
}

