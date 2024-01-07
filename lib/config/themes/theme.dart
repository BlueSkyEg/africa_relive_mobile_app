// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

ThemeData lightMode= ThemeData(
  useMaterial3: true,
  primaryColor: Colors.blue,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
      surfaceTintColor: Colors.transparent,
      backgroundColor:Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(
        size:40,
      color: Colors.blue

    )
  ),
  buttonTheme: ButtonThemeData(),
  textTheme: TextTheme(
    bodyLarge:TextStyle(
      fontFamily: 'poppins',
      color: Colors.blue,
    )
  ),
);
ThemeData darkTheme= ThemeData(
  scaffoldBackgroundColor: Colors.white,
  // primarySwatch: swatshColor as MaterialColor ,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
  ),
  buttonTheme: ButtonThemeData(
    // buttonColor: swatshColor as MaterialColor,
  ),
  textTheme: TextTheme(
    bodyLarge:TextStyle(
      fontFamily: 'poppins',
      color: Colors.blue
    )
  ),

);