

import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_states.dart';
class AppCubit extends Cubit<AppStates>{
  AppCubit():super(AppInitialState());
  static AppCubit get(context)=>BlocProvider.of(context);
  void changeBottomNave(int index,context){
    // void showTutorial() {
    //   if(appBarCase==false&&currantScreen==2)
    //     tutorialCoachMarkHome.show(context: context);
    // }
    currantScreen = index;
    // if(appBarCase==false&&index==2){
    //   createTutorialHome();
    //   Future.delayed(Duration.zero, showTutorial);
    // }
    emit(BottomNaveState());
  }


}
int currantScreen=0;