// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:africa_relief/config/themes/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../componants/loginWidgets.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Form(
              key: formKey,
              child: Align(
                child: Padding(
                  padding: EdgeInsets.only(top: 50, right: 14, left: 14,bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(padding:  EdgeInsets.only(bottom: 70.0), child: Image.asset('assets/images/afr.png',),),
                      FormFields(controller: emailController, labelText: 'E-mail', hintText: 'example@example.com',),
                      Padding(padding:  EdgeInsets.only(bottom: 16.0,top: 40), child:FormFields(controller: passController, labelText: 'Password', hintText: '',isPass: true,),),
                      ButtonLogin(onTap:(){
                        if (formKey.currentState!.validate()) {
                          FocusScope.of(context).unfocus();
                        }
                      } ),
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
            ),
          ],
        ),
      ),
    );
  }
}

