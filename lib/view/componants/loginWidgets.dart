// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, curly_braces_in_flow_control_structures

import 'package:africa_relief/view/screens/home_screen/home_screen.dart';
import 'package:africa_relief/view/screens/login_screen/login.dart';
import 'package:africa_relief/view/screens/login_screen/regiter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../config/themes/colors.dart';
import '../../config/themes/icons.dart';
import '../screens/login_screen/login_cubit/login_cubit.dart';
import '../screens/navigation_main_screen/navigation_screen.dart';

class LoginWays extends StatelessWidget {
  final String imagePath;

  const LoginWays({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: 48,
        width: 48,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: HexColor('E4E3E9'), // Set the border color
          ),
        ),
        child: SvgPicture.asset(
          imagePath,
        ),
      ),
    );
  }
}

class RowLoginWays extends StatelessWidget {
  const RowLoginWays({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.0),
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

class FormFields extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final Widget? prefixIcon;
  final void Function()? onChange;

  FormFields(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.hintText,
      this.isPass = false,
      this.isRegister = false,
      this.prefixIcon,
      this.onChange});

  bool isPass;
  bool isRegister;

  @override
  State<FormFields> createState() => _FormFieldsState();
}

class _FormFieldsState extends State<FormFields> {
  String pass = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
            child: Text(widget.labelText),
          ),
          TextFormField(
            onChanged: (value) {
              setState(() {
                pass = value;
              });
            },
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
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
            obscureText:widget.isPass==true?LoginCubit.get(context).isProtect:false,
            validator: (value) {
              if (value == '') {
                return 'This can\'t be empty.';
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              suffixIcon: widget.isPass
                  ? IconButton(
                      hoverColor: Colors.white,
                      onPressed: () {
                        return LoginCubit.get(context).onSecure();
                      },
                      icon: LoginCubit.get(context).suffix,
                    )
                  : null,
              hintText: widget.hintText,
              hintStyle: TextStyle(
                fontSize: 17,
                fontFamily: 'pop500',
                color: Colors.grey.withOpacity(.5),
                overflow: TextOverflow.ellipsis,
              ),
              prefixIcon: widget.isPass == false
                  ? widget.prefixIcon
                  : Icon(
                  IconBroken.Password,
                  color: AppColors.buttonsColor
              ) ??
                      widget.prefixIcon,
              contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 20),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: AppColors.buttonsColor,
                  width: 1.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  )),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.red,
                  )),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.red,
                ),
              ),
              // labelText: widget.labelText,
              // labelStyle: TextStyle(fontFamily: 'pop500',color: Colors.grey)
            ),
            cursorColor: Colors.black,
          ),
          if (widget.isRegister)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: PasswordStrong(
                Password: pass,
              ),
            )
        ],
      ),
    );
  }
}

class ButtonItemBuilder extends StatelessWidget {
  final void Function() onTap;
  final Widget textwidget;
  Color? color;
  double? height;
  double? width;
  double? radius;
  bool isLogin;

  ButtonItemBuilder(
      {super.key,
      required this.onTap,
      required this.textwidget,
      this.isLogin = true,
      this.color,
      this.height,
      this.width,
      this.radius});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 0, left: 0, top: 12, bottom: 12),
      child: Container(
        height: height ?? 52,
        width: width??double.infinity,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius ?? 50),
            color: color ?? AppColors.buttonsColor),
        child: ElevatedButton(
          style: ButtonStyle(
            textStyle: MaterialStatePropertyAll(TextStyle(color: Colors.white)),
            overlayColor: MaterialStatePropertyAll(Colors.grey),
            backgroundColor:
                MaterialStatePropertyAll(color ?? Colors.transparent),
          ),
          onPressed: onTap,
          child: isLogin
              ? Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                )
              : textwidget,
        ),
      ),
    );
  }
}

class OrLine extends StatelessWidget {
  const OrLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0, right: 10, left: 10),
      child: Row(
        children: [
          Expanded(child: Container(color: HexColor('E4E3E9'), height: 1)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'OR',
              style: TextStyle(color: HexColor('86898E'), fontSize: 14),
            ),
          ),
          Expanded(child: Container(color: HexColor('E4E3E9'), height: 1)),
        ],
      ),
    );
  }
}

class RegisterLine extends StatelessWidget {
  final String? text;
  final String? buttonText;
  const RegisterLine({super.key, this.text, this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.0, bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text??'Don\'t have an account? ',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          TextButton(
              onPressed: () async {
                if(text!=null)
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
                else
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterScreen(),
                      ));
              },
              child: Text(
                buttonText??'Sign up',
                style: TextStyle(color: AppColors.buttonsColor, fontSize: 14),
              )),
        ],
      ),
    );
  }
}

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Center(
          child: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => Home(),
              ));
        },
        child: Container(
          height: 32,
          width: 69,
          padding: EdgeInsetsDirectional.only(start: 8, end: 4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              border: Border.all(color: Colors.grey)),
          child: Row(
            children: [
              Expanded(
                  child: Text(
                'Skip',
                style: TextStyle(fontSize: 14, color: HexColor('86898E')),
              )),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.grey,
                size: 16,
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class LogoItemBuilder extends StatelessWidget {
  final double? n;
  const LogoItemBuilder({super.key, this.n});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0, bottom: 25),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Stack(
            alignment: Alignment.topLeft,
            children: [
              Container(
                height: n??210,
                width: double.infinity,
                child: Opacity(
                  opacity: .05,
                  child: Image(
                    image: AssetImage('assets/images/mmm.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              if(n!=null)
                Padding(
                  padding: const EdgeInsets.only(left:16.0,top: 32),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,),),
                ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: n!=null?120:170.0),
            child: Container(
              height: n!=null?80:130,
              width:  n!=null?80:130,
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
              child: Image(
                image: AssetImage('assets/images/lll.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void ShowToast({required String message, required ToastState? state}) =>
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: ToastColor(state),
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      textColor: Colors.white,
      fontSize: 16.0,
    );

enum ToastState { SUCCESS, ERROR, WARNING }

Color? ToastColor(ToastState? state) {
  Color? color;
  switch (state) {
    case ToastState.SUCCESS:
      color = AppColors.buttonsColor;
      break;
    case ToastState.ERROR:
      color = Colors.red;
      break;
    case ToastState.WARNING:
      color = Colors.orangeAccent;
      break;
    case null:
    // TODO: Handle this case.
  }
  return color;
}

class PasswordStrong extends StatefulWidget {
  final String Password;

  const PasswordStrong({super.key, required this.Password});

  @override
  State<PasswordStrong> createState() => _PasswordStrongState();
}
class _PasswordStrongState extends State<PasswordStrong> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: _getColorForPasswordStrength(
                        password: widget.Password, num: 1),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: _getColorForPasswordStrength(
                        password: widget.Password, num: 2),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: _getColorForPasswordStrength(
                        password: widget.Password, num: 3),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: _getColorForPasswordStrength(
                        password: widget.Password, num: 4),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Use 8 or more characters with at least one capital letter, number, and symbol.',
            style: TextStyle(color: AppColors.greyTextColor, fontSize: 12),
          ),
        )
      ],
    );
  }
}
Color _getColorForPasswordStrength({required String password, int? num}) {
  if (password.length != 0 && num == 1) {
    return Colors.red; // Weak password
  }
  if (password.length >=6 && num == 2) {
    return Colors.orange; // Moderate password
  }
  if (password.length >= 8 && num == 3) {
    return Colors.yellow; // Moderate password
  }
  if (password.length > 8&&password.contains(RegExp(r'[A-Z]')) && num == 4) {
    isStronge=true;
    return Colors.green; // Moderate password
  } else {
    return Colors.grey; // Strong password
  }
}
bool isStronge=false;
