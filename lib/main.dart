
import 'package:africa_relief/core/stripe_payment/stripe_keys.dart';
import 'package:africa_relief/view/componants/variable.dart';
import 'package:africa_relief/view/screens/login_screen/login.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stripe_sdk/stripe_sdk.dart';
import 'config/themes/theme.dart';
import 'core/apis/dio.dart';
import 'core/helper/Cashhelper/cash_helper.dart';
import 'core/helper/blocobserver/bloc_obsorver.dart';
import 'package:flutter_stripe/flutter_stripe.dart' as st;
void main() async{
  Stripe.init(ApiKeys.publishableKey);
  st.Stripe.publishableKey= ApiKeys.publishableKey;
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  DioHelperLogin.init();
  Bloc.observer = SimpleBlocObserver();
  await CashHelper.int();
  token=await CashHelper.getData(key: 'token')!=null?CashHelper.getData(key: 'token'):'';
  name=await CashHelper.getData(key: 'name')!=null?CashHelper.getData(key: 'name'):'';
  email=await CashHelper.getData(key: 'email')!=null?CashHelper.getData(key: 'email'):'';
  userCardList=['100'];// CashHelper.sharedPreferences!.setStringList('cashed_cards_list', userCardList);
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
  @override
  void initState() {
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