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
import '../../models/retrieve_all_payment_model.dart';
import 'loginWidgets.dart';
class FormFieldPay extends StatelessWidget{
  final TextEditingController controller;
  final String labelText;
   FormFieldPay({super.key, required this.controller, required this.labelText});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Container(
     height: 55,
     child: TextFormField(
       onTapOutside: (event) => FocusScope.of(context).unfocus(),
       style: TextStyle(color: Colors.black),
       controller: controller,
       keyboardType: TextInputType.text,
       decoration: InputDecoration(
         border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
         labelText: labelText,

       ),
     ),
   );
  }
}
// class CardForm extends StatefulWidget{
//   final TextEditingController controller;
//  final  TextEditingController controllerccv;
//   final TextEditingController controllerexmonth;
//  final TextEditingController controllerexyear;
//    CardForm({super.key, required this.controller, required this.controllerccv, required this.controllerexmonth, required this.controllerexyear});
//
//   @override
//   State<CardForm> createState() => _CardFormState();
// }
//
// class _CardFormState extends State<CardForm> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => HomeCubit(),
//       child: BlocConsumer<HomeCubit,HomeStates>(
//         builder: (context, state) => Column(
//           children: [
//             SizedBox(height: 20),
//             Row(
//               children: [
//                 Expanded(
//                   child: CustomCreditCardFormField(
//                     controller: widget.controller,
//                     maxLength: 16,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'Card Number',
//                       hintText: 'XXXX XXXX XXXX XXXX',
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 Expanded(
//                   child: Container(
//
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: CustomCreditCardFormField(
//                             controller: widget.controllerexmonth,
//                             maxLength: 2,
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(),
//                               labelText: 'month',
//                               hintText: '00',
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           child: CustomCreditCardFormField(
//                             controller: widget.controllerexyear,
//                             maxLength: 4,
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(),
//                               labelText: 'year',
//                               hintText: '0000',
//                             ),
//                           ),
//                         ),
//
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 10,),
//                 Expanded(
//                   child: CustomCreditCardFormField(
//                     controller: widget.controllerccv,
//                     maxLength: 3,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'ccv',
//                       hintText: 'XXXX',
//                     ),
//                   ),
//                 ),
//
//               ],
//             ),
//             if(state is GetPaymentMethodIdStateError)
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Padding(
//                     padding:  EdgeInsets.only(right: 8.0),
//                     child: Icon(Icons.warning,color: Colors.red,),
//                   ),
//                   Expanded(child: Text('${state.error}',style: TextStyle(color: Colors.red),)),
//                 ],
//               ),
//             SizedBox(height: 20,),
//             ButtonLogin(
//               isLogin: false,
//                 onTap: ()async{
//                 HomeCubit.get(context).GetPaymentMethodId(widget.controller.text, widget.controllerexmonth.text, widget.controllerexyear.text, widget.controllerccv.text);
//             },
//               textwidget: state is GetSingleDonationStateLoading||state is GetPaymentMethodIdStateLoading?CircularProgressIndicator():Text('Donate',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w600),),
//             ),
//             SizedBox(height: 20,),
//           ],
//         ),
//         listener: (context, state) {
//           if(state is GetPaymentMethodIdStateSuccess)
//             HomeCubit.get(context).SingleDonation();
//           if(state is GetSingleDonationStateSuccess&&state.singlePay.success==true) {
//             Navigator.pop(context);
//             pay='';
//             showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 return Center(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     child: Container(
//                       height: 355,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                       padding: EdgeInsets.all(16.0),
//                       child: Column(
//                         children: [
//                           SvgPicture.asset('assets/images/Done.svg'),
//                           Padding(
//                             padding:  EdgeInsets.only(top: 12.0),
//                             child: Text(
//                               'Successful Donation',
//                               style: TextStyle(fontSize: 18.0,color: buttonsColor),
//                             ),
//                           ),
//                           Text(
//                             'Thank you for making a donation',
//                             style: TextStyle(fontSize: 14.0),
//                           ),
//                           Spacer(),
//                           ButtonLogin(
//                             isLogin: false,
//                               onTap: (){
//                             Navigator.pop(context);
//                           },
//                               textwidget: Text('Ok',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w600)))
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             );
//           }
//           if(state is GetSingleDonationStateSuccess&&state.singlePay.success==false){
//             Navigator.pop(context);
//             showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 return BlocProvider(
//                   create: (context) => HomeCubit(),
//                   child: BlocConsumer<HomeCubit,HomeStates>(
//                     builder: (context, state) =>  Stack(
//                       children: [
//                         Center(
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                             child: Container(
//                               height: 355,
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(8.0),
//                               ),
//                               padding: EdgeInsets.all(16.0),
//                               child: Column(
//                                 children: [
//                                   Icon(Icons.warning_amber_rounded,size: 150,),
//                                   Padding(
//                                     padding:  EdgeInsets.only(top: 12.0),
//                                     child: Text(
//                                       'Please After Enter Your OTP ',
//                                       style: TextStyle(fontSize: 18.0,color: buttonsColor),
//                                     ),
//                                   ),
//                                   Text(
//                                     'Click (OK) To Complete Your Donation',
//                                     style: TextStyle(fontSize: 14.0),
//                                   ),
//                                   Spacer(),
//                                   ButtonLogin(
//                                       isLogin: false,
//                                       onTap: ()async{
//                                         DioHelper.postData(url:'/single-charge/create',data: {
//                                           'paymentIntentId':otp
//                                         }).then((value) {
//                                           showDialog(
//                                             context: context,
//                                             builder: (BuildContext context) {
//                                               return Center(
//                                                 child: Padding(
//                                                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                                                   child: Container(
//                                                     height: 355,
//                                                     decoration: BoxDecoration(
//                                                       color: Colors.white,
//                                                       borderRadius: BorderRadius.circular(8.0),
//                                                     ),
//                                                     padding: EdgeInsets.all(16.0),
//                                                     child: Column(
//                                                       children: [
//                                                         SvgPicture.asset('assets/images/Done.svg'),
//                                                         Padding(
//                                                           padding:  EdgeInsets.only(top: 12.0),
//                                                           child: Text(
//                                                             'Successful Donation',
//                                                             style: TextStyle(fontSize: 18.0,color: buttonsColor),
//                                                           ),
//                                                         ),
//                                                         Text(
//                                                           'Thank you for making a donation',
//                                                           style: TextStyle(fontSize: 14.0),
//                                                         ),
//                                                         Spacer(),
//                                                         ButtonLogin(
//                                                             isLogin: false,
//                                                             onTap: ()async{
//                                                               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProjectScreen(),));
//                                                             },
//                                                             textwidget: Text('Ok',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w600)))
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                               );
//                                             },
//                                           );
//                                         });
//                                       },
//                                       textwidget: state is !GetSingleDonationStateSuccess?CircularProgressIndicator():Text('Ok',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w600)))
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         if(otp==null)
//                           Container(height: double.infinity,width: double.infinity,child: Center(child: CircularProgressIndicator()),)
//                       ],
//                     ),
//                     listener: (context, state) {
//
//                     },
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
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
                  style: TextStyle(fontSize: 18.0,color: buttonsColor,decorationColor: Colors.white,decorationThickness: 0),
                ),
              ),
              Text(
                'Thank you for making a donation',
                style: TextStyle(fontSize: 14.0,color: Colors.black,decorationColor: Colors.white,decorationThickness: 0),
              ),
              Spacer(),
              ButtonLogin(
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
                  ButtonLogin(
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
              border: Border.all(color: greyTextColor)
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
                    pay=widget.retrieve.data!.paymentMethods!.data![index].id.toString();
                    HomeCubit.get(context).SingleDonation();
                  }
                  if(selectedItem!='once')
                  {
                    pay=widget.retrieve.data!.paymentMethods!.data![index].id.toString();
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
                  child: Text('pay',style: TextStyle(color: buttonsColor,fontSize: 14),),
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
          child: FormFieldPay(controller: widget.controllerName,labelText:'Name'),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(vertical: 8.0),
          child: FormFieldPay(controller: widget.controllerMail, labelText: 'E-mail',),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              CountryListPick(
                  appBar: AppBar(
                    backgroundColor: Colors.white,
                    title: Text('Choisir un pays'),
                    leading:GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,),),
                  ),
                  theme: CountryTheme(
                    isShowFlag: true,
                    isShowTitle: false,
                    isShowCode: false,
                    isDownIcon: true,
                    showEnglishName: true,
                  ),
                  // Set default value
                  initialSelection: 'US',
                  // or
                  // initialSelection: 'US'
                  onChanged: (value) {
                    setState(() {
                      widget.country=value!.code.toString();
                    });
                    print(widget.country);
                    print(value!.name);
                    print(value!.flagUri);
                    print(value!.dialCode);

                  },
                  // Whether to allow the widget to set a custom UI overlay
                  useUiOverlay: true,
                  // Whether the country list should be wrapped in a SafeArea
                  useSafeArea: false
              ),
              // Expanded(child: FormFieldPay(controller: _controllerCountry, labelText: 'Country',)),
              SizedBox(width: 10,),
              Expanded(child: FormFieldPay(controller: widget.controllerCity, labelText: 'City',)),

            ],
          ),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(vertical: 8.0),
          child: FormFieldPay(controller: widget.controllerLine, labelText: 'Address Line1',),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(vertical: 8.0),
          child: FormFieldPay(controller: widget.controllerZip, labelText: 'Zip Cod',),
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
String pay='';
String otp='';
