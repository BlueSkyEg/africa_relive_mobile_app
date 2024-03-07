// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, curly_braces_in_flow_control_structures, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:africa_relief/config/themes/icons.dart';
import 'package:africa_relief/core/helper/Cashhelper/cash_helper.dart';
import 'package:africa_relief/models/user_models/user_model.dart';
import 'package:africa_relief/view/componants/loginWidgets.dart';
import 'package:africa_relief/view/componants/variable.dart';
import 'package:africa_relief/view/screens/annual_receipts_screen/annual_reciept_screen.dart';
import 'package:africa_relief/view/screens/donation_history_screen/donation_history.dart';
import 'package:africa_relief/view/screens/notification/notification_screen.dart';
import 'package:africa_relief/view/screens/profile_screen/settings_screen/edit_profile_screen.dart';
import 'package:africa_relief/view/screens/recurring_donation/recurring_donations_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/themes/colors.dart';
import '../screens/login_screen/login.dart';
import '../screens/profile_screen/settings_screen/setting_screen.dart';
import 'images_url.dart';

class ProfileRows extends StatelessWidget{
  final IconData icon;
  final String label;
   ProfileRows({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(label=='Donations History')
          Navigator.push(context,MaterialPageRoute(builder: (context) => DonationHistoryScreen(),) );
        if(label=='Recurring Donations')
          Navigator.push(context,MaterialPageRoute(builder: (context) => RecurringDonationScreen(),) );
        if(label=='Setting')
          Navigator.push(context,MaterialPageRoute(builder: (context) => SettingScreen(),) );
        if(label=='Profile')
          Navigator.push(context,MaterialPageRoute(builder: (context) => EditProfileScreen(),) );
        if(label=='Annual Receipts')
          Navigator.push(context,MaterialPageRoute(builder: (context) => AnnualReceiptScreen(),) );
        if(label=='Notifications ')
          Navigator.push(context,MaterialPageRoute(builder: (context) => NotificationScreen(),) );
      },
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          padding: EdgeInsetsDirectional.all(14),
          decoration: BoxDecoration(
              // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
              border: Border(bottom: BorderSide(color: Colors.grey))
          ),
          child: Row(
            children: [
              Icon(icon,color: AppColors.greyTextColor,size: 24,),
              SizedBox(width: 14,),
              Text(label,style: TextStyle(fontSize: 18),),
              Spacer(),
              Icon(Icons.arrow_forward_ios_rounded,color: AppColors.greyTextColor,size: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
class UserDataItemBuilder extends StatelessWidget{
  final ProfileModel data;
   UserDataItemBuilder({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      Center(
        child: Container(
          height: 108,
          width: 108,
          child: Image.asset('assets/images/gggg.png',fit: BoxFit.cover,),
        ),
      ),
      Center(child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 8.0),
        child: Text(data.data!.name.toString(),style: TextStyle(fontSize: 20)),
      )),
      Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text('Total Spent',style: TextStyle(fontSize: 14,color: AppColors.greyTextColor),),
                  Padding(
                    padding:  EdgeInsets.only(top: 8.0),
                    child: Text('\$0',style: TextStyle(fontSize: 18),),
                  ),
                ],
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(height: 44,width: 1,color: Colors.grey,),
              ),
              Column(
                children: [
                  Text('Total Donations',style: TextStyle(fontSize: 14,color: AppColors.greyTextColor),),
                  Padding(
                    padding:  EdgeInsets.only(top: 8.0),
                    child: Text(data.data!.donations!.length.toString(),style: TextStyle(fontSize: 18),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ],);
  }

}
class SettingItemBuilder extends StatelessWidget{
  const SettingItemBuilder({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileRows(icon: Icons.settings,label: 'Setting',),
        ProfileRows(icon: Icons.edit_calendar_sharp,label: 'Donations History',),
        ProfileRows(icon: Icons.refresh,label: 'Recurring Donations',),
        ProfileRows(icon: Icons.receipt_long,label: 'Annual Receipts',),
        ProfileRows(icon: Icons.notifications,label: 'Notifications ',),
        GestureDetector(
          onTap: () {
            CashHelper.cleanData(key: 'token');
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
          },
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              padding: EdgeInsetsDirectional.all(14),
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                  border: Border(bottom: BorderSide(color: Colors.grey))
              ),
              child: Row(
                children: [
                  Icon(Icons.logout,color: Colors.red,size: 24,),
                  SizedBox(width: 14,),
                  Text('Log out',style: TextStyle(fontSize: 18,color: Colors.red),),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
class ProfileItemBuilder extends StatelessWidget{
  const ProfileItemBuilder({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 12.0,horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ProfileRows(icon: Icons.person,label: 'Profile',),
            ProfileRows(icon: Icons.notifications,label: 'Notifications ',),
            ProfileRows(icon: Icons.live_help,label: 'Help & Support ',),
          ],
        ),
      ),
    );
  }
}
class EditProfileImage extends StatelessWidget{
  final ProfileModel data;
  const EditProfileImage({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
   return Column(
     children: [
       Row(
         children: [
           Padding(
             padding:  EdgeInsets.only(right:16),
             child: Container(
               height: 80,
               width: 80,
               clipBehavior: Clip.antiAliasWithSaveLayer,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(50)
               ),
               child: data.data!.img!=null?CachedNetworkImage(imageUrl: data.data!.img.toString()):Image.asset('assets/images/gggg.png',fit: BoxFit.cover,),
             ),
           ),
           Expanded(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    height: 36,
                    width: 143,
                    padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: AppColors.greyTextColor,width: .1)
                    ),
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(IconBroken.Upload,size: 18,color: Colors.black54),
                          Padding(
                            padding: const EdgeInsets.only(left: 8,top: 6.0),
                            child: Text('Upload Photo',style: TextStyle(color: Colors.black54,fontSize: 14),),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                 Text('PNG & JPEG 4.88MB Max',style: TextStyle(color: Colors.black54,fontSize: 12))
               ],
             ),
           )
         ],
       ),
     ],
   );
  }
}
class EditProfileFailed extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  EditProfileFailed({super.key, required this.controller, required this.labelText, required this.hintText});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10,bottom: 4),
            child: Text(labelText),
          ),
          Container(
            height: 44,
            child: TextFormField(
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              style: TextStyle(color: Colors.black),
              controller: controller,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: AppColors.buttonsColor,
                      width: 1.0,
                    ),
                  ),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  // labelText: '',
                  hintText: hintText,
                  hintStyle: TextStyle(color: AppColors.greyTextColor,fontSize: 14)

              ),
            ),
          ),
        ],
      ),
    );}}
class EditProfileData extends StatefulWidget {
  final TextEditingController controllerFirstName;
  final TextEditingController controllerEmail;
  final TextEditingController controllerPhone;
  final TextEditingController controllerCity;
  final TextEditingController controllerZip;
  final TextEditingController controllerState;
  final ProfileModel data;
  final String labelText;
  final String hintText;
  EditProfileData({super.key, required this.controllerFirstName, required this.labelText, required this.hintText, required this.controllerEmail, required this.controllerCity, required this.controllerZip, required this.controllerState, required this.data, required this.controllerPhone});

  @override
  State<EditProfileData> createState() => _EditProfileDataState();
}

class _EditProfileDataState extends State<EditProfileData> {
  @override
  void initState() {


    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.only(top: 16.0),
          child: Row(
            children: [
              Expanded(child: Padding(
                padding:  EdgeInsets.only(right:16.0),
                child: EditProfileFailed(controller: widget.controllerFirstName, labelText: 'Name', hintText: 'Freda',),
              )),
              // Expanded(child: EditProfileFailed(controller: widget.controllerLastName, labelText: 'Last Name', hintText: 'Kutch',)),
            ],
          ),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(vertical: 16.0),
          child: EditProfileFailed(controller: widget.controllerEmail, labelText: 'E-mail', hintText: 'Carlotta.Luettgen@hotmail.com',),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10,bottom: 4),
                child: Text('Phone'),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius:  BorderRadius.circular(8.0),
                  border: Border.all(color: AppColors.greyTextColor)
                ),
                child: Row(
                  children: [
                    CountryListPick(
                      appBar: AppBar(
                        backgroundColor: Colors.white,
                        title: Text('Select your country'),
                        leading:GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,),),
                      ),
                      theme: CountryTheme(
                        isShowFlag: true,
                        isShowTitle: false,
                        isShowCode: true,
                        isDownIcon: false,
                        showEnglishName: false,
                      ),

                      initialSelection: 'US',
                      onChanged: (value) {
                        countryCode=value!.dialCode.toString();
                      },
                      useUiOverlay: true,
                      useSafeArea: false,
                    ),
                    Expanded(
                      child: TextFormField(
                        onTapOutside: (event) => FocusScope.of(context).unfocus(),
                        style: TextStyle(color: Colors.black),
                        controller:  widget.controllerPhone,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(8),
                            border: OutlineInputBorder(borderSide: BorderSide.none),
                            hintStyle: TextStyle(color: AppColors.greyTextColor,fontSize: 14)

                        ),
                      ),
                    )            ],
                ),
              ),
            ],
          ),
        )
        // Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 16.0),
        //   child: Container(height: 1,width: double.infinity,color: AppColors.greyTextColor,),
        // ),
        // Padding(
        //   padding:  EdgeInsets.only(top: 16),
        //   child: Container(
        //     height: 52,
        //     width: double.infinity,
        //     decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(8),
        //         border: Border.all(color: AppColors.greyTextColor)
        //     ),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.start,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Expanded(
        //           child: CountryListPick(
        //             appBar: AppBar(
        //               backgroundColor: Colors.white,
        //               title: Text('Select your country'),
        //               leading:GestureDetector(
        //                 onTap: () => Navigator.pop(context),
        //                 child: Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,),),
        //             ),
        //             theme: CountryTheme(
        //               isShowFlag: false,
        //               isShowTitle: true,
        //               isShowCode: false,
        //               isDownIcon: true,
        //               showEnglishName: true,
        //             ),
        //             pickerBuilder: (context, countryCode) => Row(
        //               children: [
        //                 Expanded(child: Text(countryCode!.name.toString(),style: TextStyle(color: AppColors.greyTextColor),)),
        //                 Icon(Icons.arrow_forward_ios_rounded,size: 20,color: AppColors.greyTextColor,)
        //               ],
        //             ),
        //             initialSelection: 'US',
        //             onChanged: (value) {
        //             },
        //             useUiOverlay: true,
        //             useSafeArea: false,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        // Padding(
        //   padding:  EdgeInsets.symmetric(vertical: 16.0),
        //   child: EditProfileFailed(controller: widget.controllerLastName, labelText: 'City', hintText: 'New York',),
        // ),
        // Padding(
        //   padding:  EdgeInsets.only(bottom: 16.0),
        //   child: Row(
        //     children: [
        //       Expanded(child: Padding(
        //         padding:  EdgeInsets.only(right:16.0),
        //         child: EditProfileFailed(controller: widget.controllerState, labelText: 'State', hintText: 'Brooklyn',),
        //       )),
        //       Expanded(child: EditProfileFailed(controller: widget.controllerZip, labelText: 'Zip', hintText: '11170',)),
        //     ],
        //   ),
        // ),
      ],
    );}}