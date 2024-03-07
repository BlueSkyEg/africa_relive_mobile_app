// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:africa_relief/view/screens/profile_screen/cubit/profile_states.dart';
import 'package:africa_relief/view/screens/profile_screen/settings_screen/setting_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/themes/colors.dart';
import '../../../componants/app_widgets.dart';
import '../../../componants/loginWidgets.dart';
import '../../../componants/profile_widgets.dart';
import '../cubit/profile_cubit.dart';

 class EditProfileScreen extends StatefulWidget{
   EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController controllerFirstName=TextEditingController();
  final TextEditingController controllerLastName=TextEditingController();
  final TextEditingController controllerCity=TextEditingController();
  final TextEditingController controllerState=TextEditingController();
  final TextEditingController controllerZip=TextEditingController();
  final TextEditingController controllerPhone=TextEditingController();
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..GetUserInfo(),
      child: BlocConsumer<ProfileCubit,ProfileStates>(
        builder: (context, state) =>  Scaffold(
          appBar: PreferredSize(
              preferredSize:Size.fromHeight(40),child: CustomAppBar(text: 'Edit profile',)),
          body: Padding(
            padding:  EdgeInsets.symmetric(vertical: 12.0,horizontal: 16),
            child: Container(
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: state is GetProfileLoadingState?CrossAxisAlignment.center:CrossAxisAlignment.start,
                  mainAxisAlignment: state is GetProfileLoadingState?MainAxisAlignment.center:MainAxisAlignment.start,
                  children: [
                    if(state is GetProfileSuccessState||state is PostUserInfoLoading)
                      EditProfileImage(data: ProfileCubit.get(context).profile!,),
                    if(state is GetProfileSuccessState||state is PostUserInfoLoading)
                      EditProfileData(controllerZip:controllerZip,controllerState:controllerState,controllerFirstName: controllerFirstName, labelText: '', hintText: '', controllerEmail: controllerLastName,controllerCity:controllerCity, data: ProfileCubit.get(context).profile!,controllerPhone: controllerPhone),
                    if(state is GetProfileSuccessState||state is PostUserInfoLoading)
                      SizedBox(height: MediaQuery.of(context).size.height/3,),
                    if(state is GetProfileSuccessState||state is PostUserInfoLoading)
                      Row(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(right:16.0),
                          child: ButtonItemBuilder(onTap: (){}, textwidget: Text('Cancel',style:TextStyle(color: Colors.black),),color:Colors.white,isLogin: false,width: 105,),
                        ),
                        Expanded(
                          child: Padding(
                            padding:  EdgeInsets.only(left: 16.0),
                            child: ButtonItemBuilder(
                                onTap: (){
                                  setState(() {
                                    ProfileCubit.get(context).UpdateUserInfo(name: controllerFirstName.text,phone: controllerPhone.text,mail: controllerLastName.text);
                                  });
                                },
                                textwidget: state is PostUserInfoLoading?Progress():Text('Save Changes',style:TextStyle(color: Colors.white)),color: AppColors.buttonsColor,isLogin: false),
                          ),
                        ),
                      ],
                    ),
                    if(state is GetProfileLoadingState)
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(child: Progress()),
                          ],
                        ),
                      )

                  ],
                ),
              ),
            ),
          ),
        ),
        listener: (context, state) {
          if(state is GetProfileSuccessState) {
            controllerFirstName.text=state.profile.data!.name.toString();
            controllerLastName.text=state.profile.data!.email.toString()!='null'?state.profile.data!.email.toString():'' ;
            controllerPhone.text=state.profile.data!.phone.toString()!='null'?state.profile.data!.phone.toString():'' ;
          }
          if(state is PostUserInfoSuccess){
            ProfileCubit.get(context).GetUserInfo();
          }
        },
      ),
    );
  }
}