// ignore_for_file: prefer_const_constructors

import 'package:africa_relief/view/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../config/themes/colors.dart';
import '../../config/themes/icons.dart';
import '../screens/navigation_main_screen/navigation_screen.dart';

class LoginWays extends StatelessWidget{
  final String imagePath;
  const LoginWays({super.key, required this.imagePath});
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        height: 56,
        width: 56,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border:Border.all(
            color: HexColor('E4E3E9'), // Set the border color
          ),
        ),
        child: SvgPicture.asset(imagePath,),
      ),
    );
  }
}
class RowLoginWays extends StatelessWidget{
  const RowLoginWays({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 22.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          LoginWays(imagePath: 'assets/images/logos_facebook.svg'),
          LoginWays(imagePath: 'assets/images/Google.svg'),
          LoginWays(imagePath: 'assets/images/bi_apple.svg'),
        ],
      ),
    );
  }
}
class FormFields extends StatefulWidget{
  final TextEditingController controller;
  final String labelText;
  final String hintText;
   FormFields({super.key, required this.controller, required this.labelText, required this.hintText,this.isPass=false});
  bool isPass;
  @override
  State<FormFields> createState() => _FormFieldsState();
}
class _FormFieldsState extends State<FormFields> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) {FocusScope.of(context).unfocus();},
      cursorWidth: 1,
      textAlign: TextAlign.left,
      maxLines: 1,
      style: TextStyle(
        fontSize: 17,
        fontFamily: 'pop500',
        color: Colors.black,
        overflow: TextOverflow.ellipsis,
      ),
      keyboardType: TextInputType.emailAddress,
      controller: widget.controller,
      validator: (value) {
        if (value == '') {
          return 'this can\'t be empty';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
          suffixIcon:widget.isPass?IconButton(
            hoverColor: Colors.white,
            onPressed: () {
            },
            icon: Icon(IconBroken.Hide) ,
          ):null,
          hintText:widget.hintText,
          hintStyle: TextStyle(
            fontSize: 17,
            fontFamily: 'pop500',
            color: Colors.grey.withOpacity(.5),
            overflow: TextOverflow.ellipsis,
          ),
          prefixIcon: widget.isPass==false?Icon(IconBroken.Message,color: Colors.black,):Icon(IconBroken.Password,color: Colors.black,),
          contentPadding:EdgeInsets.fromLTRB(20, 10, 10, 20),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Colors.black,
              width: 1.0,

            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(
                color: Colors.grey,
                width: 1.0,
              )),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(
                width: 1,
                color: Colors.red,
              )),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(
              width: 1,
              color: Colors.red,
            ),
          ),
          labelText: widget.labelText,
          labelStyle: TextStyle(fontFamily: 'pop500',color: Colors.grey)),
      cursorColor: Colors.black,
    );
  }
}
class ButtonLogin extends StatelessWidget{
  final void Function() onTap;
  final Widget textwidget;
  bool isLogin;
    ButtonLogin({super.key, required this.onTap,required this.textwidget,this.isLogin=true});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 0,left: 0,top: 12,bottom: 12),
      child: Container(
        height: 52,
        width: double.infinity,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: buttonsColor
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            textStyle:MaterialStatePropertyAll(TextStyle(color: Colors.white)),
            overlayColor: MaterialStatePropertyAll(Colors.grey),
            backgroundColor:MaterialStatePropertyAll(Colors.transparent), ),
          onPressed: onTap,
          child: isLogin?Text('Login',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w600),):textwidget,
        ),
      ),
    );
  }
}
class OrLine extends StatelessWidget{
  const OrLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 40.0,right: 10,left: 10),
      child: Row(
        children: [
          Expanded(child: Container(color: HexColor('E4E3E9'),height: 1)),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.0),
            child: Text('OR',style: TextStyle(color: HexColor('86898E'),fontSize: 14),),
          ),
          Expanded(child: Container(color: HexColor('E4E3E9'),height: 1)),
        ],
      ),
    );
  }
}
class RegisterLine extends StatelessWidget{
  const RegisterLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 24.0,bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Don\'t have an account? '),
          TextButton(
              onPressed: ()async{},
              child: Text('Sign up',style: TextStyle(color: buttonsColor,fontSize: 14),)),
        ],
      ),
    );

  }
}
class SkipButton extends StatelessWidget{
  const SkipButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(child: GestureDetector(
      onTap: () {
        Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => Home(),));
      },
      child: Container(
        height: 29,
        width: 69,
        padding: EdgeInsetsDirectional.only(start: 8,end: 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: Colors.grey)
        ),
        child: Row(
          children: [
            Expanded(child: Text('Skip',style: TextStyle(fontSize: 14,color: HexColor('86898E')),)),
            Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey,size: 16,),
          ],
        ),
      ),
    ));
  }
}
