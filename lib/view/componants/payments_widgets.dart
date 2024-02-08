// ignore_for_file: prefer_const_constructors

import 'package:africa_relief/core/apis/dio.dart';
import 'package:africa_relief/view/componants/variable.dart';
import 'package:africa_relief/view/screens/home_screen/home_cubit/home_cubit.dart';
import 'package:africa_relief/view/screens/home_screen/home_cubit/home_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:stripe_sdk/stripe_sdk.dart' as Stripea;

import 'loginWidgets.dart';

class CardForm extends StatelessWidget{
  final TextEditingController controller;
 final  TextEditingController controllerccv;
  final TextEditingController controllerexmonth;
 final TextEditingController controllerexyear;
   CardForm({super.key, required this.controller, required this.controllerccv, required this.controllerexmonth, required this.controllerexyear});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit,HomeStates>(
        builder: (context, state) => Column(
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: CustomCreditCardFormField(
                    controller: controller,
                    maxLength: 16,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Card Number',
                      hintText: 'XXXX XXXX XXXX XXXX',
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(

                    child: Row(
                      children: [
                        Expanded(
                          child: CustomCreditCardFormField(
                            controller: controllerexmonth,
                            maxLength: 2,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'month',
                              hintText: '00',
                            ),
                          ),
                        ),
                        Expanded(
                          child: CustomCreditCardFormField(
                            controller: controllerexyear,
                            maxLength: 4,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'year',
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
                    controller: controllerccv,
                    maxLength: 3,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'ccv',
                      hintText: 'XXXX',
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: 20,),
            ButtonLogin(
              isLogin: false,
                onTap: ()async{
              await Stripea.Stripe.instance.api.createPaymentMethod({
                'type': 'card',
                'card': {
                  'number':controller.text,
                  'exp_month': controllerexmonth.text,
                  'exp_year': controllerexyear.text,
                  'cvc': controllerccv.text,
                }
              }).then((value) {
                HomeCubit.get(context).UserLogin();
                pay=value['id'].toString();
                print(pay);

              });

            },
              textwidget: state is GetLoginStateLoading?CircularProgressIndicator():Text('Donate',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w600),),
            ),
            SizedBox(height: 20,),
          ],
        ),
        listener: (context, state) {
          if(state is GetLoginStateSuccess)
            Navigator.pop(context);
        },
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
    return TextFormField(
      style: TextStyle(color: Colors.black),
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        _CreditCardInputFormatter(),
      ],
      maxLength: maxLength + maxLength ~/ 4, // Adjust max length to account for spaces
      decoration: decoration,
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
String pay='';