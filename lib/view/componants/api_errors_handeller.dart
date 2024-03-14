// ignore_for_file: prefer_const_constructors

import 'package:africa_relief/config/themes/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'loginWidgets.dart';

class Errors {
  static String authenticationError = '422';
  static String tokenError = '500';
  static String userError = '401';
  static String authenticationErrorText = 'It looks like there was an issue with your e-mail or password. Please double-check and try again.';
  static String passwordNotStrongOrNotMatch='Your password need to be stronger or passwords dosn\'t match';
}

class ErrorDialog extends StatelessWidget {
  final String error;

  const ErrorDialog({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          height: 305,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Icon(
                Icons.warning_amber_rounded,
                color: AppColors.warningColor,
                size: 80,
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.0),
                child: Text('Oops!',
                    style: TextStyle(
                        height: 1.3,
                        fontSize: 20.0,
                        color: AppColors.errorsColor,
                        decorationColor: Colors.white,
                        decorationThickness: 0),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.0,right: 40,left: 40,bottom: 12),
                child: Text(error,
                    style: TextStyle(
                        height: 1.3,
                        fontSize: 14.0,
                        fontWeight:FontWeight.w400,
                        color: AppColors.blacks,
                        decorationColor: Colors.white,
                        decorationThickness: 0),
                    maxLines: 3,
                    textAlign: TextAlign.center,
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Expanded(
                    child: ButtonItemBuilder(
                        color: Colors.white,
                        isLogin: false,
                        onTap: () async {
                          Navigator.pop(context);
                        },
                        textwidget: Text('Ok',
                            style: TextStyle(
                                color: AppColors.blacks,
                                fontSize: 17,
                                fontWeight: FontWeight.w600))),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
