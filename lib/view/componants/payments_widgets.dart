// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, prefer_const_literals_to_create_immutables

import 'package:africa_relief/config/themes/colors.dart';
import 'package:africa_relief/view/componants/singel_project_widgets.dart';
import 'package:africa_relief/view/componants/variable.dart';
import 'package:africa_relief/view/screens/home_screen/home_cubit/home_cubit.dart';
import 'package:africa_relief/view/screens/single_project_screen/project_screen.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../models/payment_models/retrieve_all_payment_model.dart';
import 'loginWidgets.dart';
class FormFieldPay extends StatelessWidget{
  final TextEditingController controller;
  final String labelText;
  final String hintText;
   FormFieldPay({super.key, required this.controller, required this.labelText, required this.hintText});

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
           height: 52,
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
   );
  }
}
class CustomCreditCardFormField extends StatelessWidget {
  final int maxLength;
  final InputDecoration decoration;
  final TextEditingController controller;
  const CustomCreditCardFormField({
    Key? key,
    this.maxLength = 16,
    required this.decoration,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      child: TextFormField(
        style: TextStyle(color: Colors.black),
        controller: controller,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          _CreditCardInputFormatter(),
        ],
        maxLength: maxLength + maxLength ~/ 4, // Adjust max length to account for spaces
        decoration: decoration,
      ),
    );
  }
}
class _CreditCardInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String formattedText = newValue.text.replaceAll(RegExp(r'\s'), ''); // Remove spaces
    if (formattedText.length > 4) {
      formattedText = formattedText.substring(0, 4) +
          '-' +
          (formattedText.length > 8
              ? formattedText.substring(4, 8) + '-' + (formattedText.length > 12 ? formattedText.substring(8, 12) + '-' + formattedText.substring(12) : formattedText.substring(8))
              : formattedText.substring(4));
    }
    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }}

class DonationSuccessDialogItemBuilder extends StatelessWidget{
  const DonationSuccessDialogItemBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          height: 355,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              SvgPicture.asset('assets/images/Done.svg'),
              Padding(
                padding:  EdgeInsets.only(top: 12.0),
                child: Text(
                  'Successful Donation',
                  style: TextStyle(fontSize: 18.0,color: AppColors.buttonsColor,decorationColor: Colors.white,decorationThickness: 0),
                ),
              ),
              Text(
                'Thank you for making a donation',
                style: TextStyle(fontSize: 14.0,color: Colors.black,decorationColor: Colors.white,decorationThickness: 0),
              ),
              Spacer(),
              ButtonItemBuilder(
                  isLogin: false,
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProjectScreen(),));
                  },
                  textwidget: Text('Ok',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w600)))
            ],
          ),
        ),
      ),
    );
  }

}

class DonationOTPDialogItemBuilder extends StatefulWidget{
  final void Function()? onTap;
   DonationOTPDialogItemBuilder({super.key, this.onTap});
  @override
  State<DonationOTPDialogItemBuilder> createState() => _DonationOTPDialogItemBuilderState();
}
class _DonationOTPDialogItemBuilderState extends State<DonationOTPDialogItemBuilder> {
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Icon(Icons.warning_amber_rounded,size: 150,),
                  Padding(
                    padding:  EdgeInsets.only(top: 12.0,bottom: 8),
                    child: Text(
                      'Click (Pay) To Complete Your Donation',
                      style: TextStyle(fontSize: 12.0,color: Colors.black,decorationColor: Colors.white,decorationThickness: 0),
                    ),
                  ),
                  Spacer(),
                  ButtonItemBuilder(
                      height: 45,
                      radius: 10,
                      isLogin: false,
                      color: HexColor('#007AFF'),
                      onTap: widget.onTap!,
                      textwidget: Text('Pay\$$amount /($selectedItem)',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w600)))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class UserCardsItemBuilder extends StatefulWidget{
  final RetrieveAllPaymentModel retrieve;
  const UserCardsItemBuilder({super.key, required this.retrieve});

  @override
  State<UserCardsItemBuilder> createState() => _UserCardsItemBuilderState();
}
class _UserCardsItemBuilderState extends State<UserCardsItemBuilder> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.all(0),
      itemCount: widget.retrieve.data!.paymentMethods!.data!.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          height: 60,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(5),
              border: Border.all(color: AppColors.greyTextColor)
          ),
          child: Row(
            children: [
              Icon(Icons.credit_card,size: 30,color: Colors.blueGrey,),
              SizedBox(width: 8,),
              Expanded(child: Text('************${widget.retrieve.data!.paymentMethods!.data![index].card!.last4.toString()}',style: TextStyle(fontSize: 14),)),
              Spacer(),
              GestureDetector(
                onTap: () {
                  if(selectedItem=='once')
                  {
                    paymentMethodeID=widget.retrieve.data!.paymentMethods!.data![index].id.toString();
                    HomeCubit.get(context).SingleDonation();
                  }
                  if(selectedItem!='once')
                  {
                    paymentMethodeID=widget.retrieve.data!.paymentMethods!.data![index].id.toString();
                    HomeCubit.get(context).SubscriptionDonation();
                  }
                },
                child: Container(
                  padding: EdgeInsetsDirectional.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      // border: Border.all(),
                      color: HexColor('F1F7F3')
                  ),
                  child: Text('pay',style: TextStyle(color: AppColors.buttonsColor,fontSize: 14),),
                ),
              )
            ],
          ),
        ),
      ),);
  }
}


class PaymentUserData extends StatefulWidget{
  final TextEditingController controllerMail;
  final TextEditingController controllerName;
  final TextEditingController controllerCity;
  final TextEditingController controllerLine;
  final TextEditingController controllerZip;
  String country;
   PaymentUserData({super.key, required this.controllerMail, required this.controllerName, required this.controllerCity, required this.controllerLine, required this.controllerZip, required this.country});

  @override
  State<PaymentUserData> createState() => _PaymentUserDataState();
}
class _PaymentUserDataState extends State<PaymentUserData> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(vertical: 8.0),
          child: FormFieldPay(controller: widget.controllerName,labelText:'Name',hintText: 'eg John Doe'),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(vertical: 8.0),
          child: FormFieldPay(controller: widget.controllerMail, labelText: 'E-mail',hintText: 'eg example@example.com',),
        ),
        Align(alignment:Alignment.topLeft,child: Padding(padding: EdgeInsets.only(left: 10,bottom: 4,top: 8), child: Text('Country'),)),
        Padding(
          padding:  EdgeInsets.only(bottom: 8.0),
          child: Container(
            height: 52,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.greyTextColor)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: CountryListPick(
                      appBar: AppBar(
                        backgroundColor: Colors.white,
                        title: Text('Select your country'),
                        leading:GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,),),
                      ),
                      theme: CountryTheme(
                        isShowFlag: false,
                        isShowTitle: true,
                        isShowCode: false,
                        isDownIcon: true,
                        showEnglishName: true,
                      ),
                      pickerBuilder: (context, countryCode) => Row(
                        children: [
                          Expanded(child: Text(countryCode!.name.toString(),style: TextStyle(color: AppColors.greyTextColor),)),
                          Icon(Icons.arrow_forward_ios_rounded,size: 20,color: AppColors.greyTextColor,)
                        ],
                      ),
                      initialSelection: 'US',
                      onChanged: (value) {
                        setState(() {
                          widget.country=value!.code.toString();
                        });
                      },
                      useUiOverlay: true,
                      useSafeArea: false,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(vertical: 8.0),
          child: FormFieldPay(controller: widget.controllerCity, labelText: 'City',hintText: 'eg NewYork'),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(vertical: 8.0),
          child: FormFieldPay(controller: widget.controllerLine, labelText: 'Address Line',hintText: 'eg 7195 East Blue Spring St. Bay Shore, NY 11706',),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(vertical: 8.0),
          child: FormFieldPay(controller: widget.controllerZip, labelText: 'Zip Code',hintText: 'eg 11706',),
        ),
      ],
    );
  }
}

class CardDonateData extends StatefulWidget{
  final TextEditingController controller;
  final TextEditingController controllerccv;
  final TextEditingController controllerexmonth;
  final TextEditingController controllerexyear;
  const CardDonateData({super.key, required this.controller, required this.controllerccv, required this.controllerexmonth, required this.controllerexyear});

  @override
  State<CardDonateData> createState() => _CardDonateDataState();
}
class _CardDonateDataState extends State<CardDonateData> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Padding(
          padding:  EdgeInsets.only(bottom: 13.0),
          child: Row(
            children: [
              Expanded(
                child: CustomCreditCardFormField(
                  controller: widget.controller,
                  maxLength: 16,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    labelText: 'Card Number',
                    labelStyle: TextStyle(color: AppColors.greyTextColor,fontSize: 14),
                    hintStyle: TextStyle(color: AppColors.greyTextColor,fontSize: 14),
                    suffixIcon: Icon(Icons.add_card),
                    hintText: 'XXXX XXXX XXXX XXXX',
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding:  EdgeInsets.only(bottom: 13.0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomCreditCardFormField(
                          controller: widget.controllerexmonth,
                          maxLength: 2,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                            labelStyle: TextStyle(color: AppColors.greyTextColor,fontSize: 14),
                            hintStyle: TextStyle(color: AppColors.greyTextColor,fontSize: 14),
                            labelText: 'MM',
                            hintText: '00',
                          ),
                        ),
                      ),
                      SizedBox(width: 8,),
                      Expanded(
                        child: CustomCreditCardFormField(
                          controller: widget.controllerexyear,
                          maxLength: 4,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                            labelStyle: TextStyle(color: AppColors.greyTextColor,fontSize: 14),
                            hintStyle: TextStyle(color: AppColors.greyTextColor,fontSize: 14),
                            labelText: 'YY',
                            hintText: '0000',
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: CustomCreditCardFormField(
                  controller: widget.controllerccv,
                  maxLength: 3,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    labelStyle: TextStyle(color: AppColors.greyTextColor,fontSize: 14),
                    hintStyle: TextStyle(color: AppColors.greyTextColor,fontSize: 14),
                    labelText: 'ccv',
                    hintText: 'XXXX',
                  ),
                ),
              ),

            ],
          ),
        ),
      ],
    );
  }
}

