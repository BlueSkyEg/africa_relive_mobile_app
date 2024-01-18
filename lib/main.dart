
import 'package:africa_relief/view/screens/login_screen/login.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'config/themes/theme.dart';
import 'core/apis/dio.dart';
import 'core/helper/blocobserver/bloc_obsorver.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  Bloc.observer = SimpleBlocObserver();
  // await CashHelper.int();
  Widget? startScreen =const LoginScreen();
  runApp(MyApp(startScreen: startScreen,));
}

class MyApp extends StatefulWidget {
  final Widget? startScreen;
  const MyApp({super.key,this.startScreen});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(300,900),
      builder: (context, child) => MaterialApp(
        title: 'Flutter Demo',
        theme: lightMode,
        home: widget.startScreen,
        debugShowCheckedModeBanner: false,
      ),
      minTextAdapt: true,
      splitScreenMode: true,
    );
  }
}