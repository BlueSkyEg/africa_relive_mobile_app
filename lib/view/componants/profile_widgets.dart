// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, curly_braces_in_flow_control_structures

import 'package:africa_relief/view/screens/annual_receipts_screen/annual_reciept_screen.dart';
import 'package:africa_relief/view/screens/donation_history_screen/donation_history.dart';
import 'package:africa_relief/view/screens/notification/notification_screen.dart';
import 'package:africa_relief/view/screens/recurring_donation/recurring_donations_screen.dart';
import 'package:flutter/material.dart';

import '../../config/themes/colors.dart';
import '../screens/profile_screen/settings_screen/setting_screen.dart';

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
              Icon(icon,color: greyTextColor,size: 24,),
              SizedBox(width: 14,),
              Text(label,style: TextStyle(fontSize: 18),),
              Spacer(),
              Icon(Icons.arrow_forward_ios_rounded,color: greyTextColor,size: 20,),
            ],
          ),
        ),
      ),
    );
  }
}