// ignore_for_file: avoid_function_literals_in_foreach_calls, avoid_print
import 'dart:async';
import 'dart:convert';
import 'package:africa_relief/models/retrieve_all_payment_model.dart';
import 'package:africa_relief/view/componants/singel_project_widgets.dart';
import 'package:africa_relief/view/screens/single_project_screen/project_screen.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:stripe_sdk/stripe_sdk.dart' as Stripea;

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../core/apis/dio.dart';
import '../../../../core/helper/Cashhelper/cash_helper.dart';
import '../../../../models/projects_model.dart';
import '../../../../models/single_payment_model.dart';
import '../../../../models/subscription_model.dart';
import '../../../componants/payments_widgets.dart';
import '../../../componants/variable.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());
  static HomeCubit get(context) => BlocProvider.of(context);
  SinglePayment? singlePayment;
  SubscriptionModel? subscriptionPayment;
  SinglePayment? singlePaymentOTP;
  var s;
  RetrieveAllPaymentModel? retrieve;
  List<ProjectsData> projects = [
    ProjectsData(
      id: 1,
      type: 'Education',
      title: 'Educational Center',
      description: 'In Africa, where knowledge is power, 20% lack formal schooling, while 28% completed primary, 37% secondary, and 15% higher education, these statistics highligh the importance of accessible learning opportunities',
      image: 'https://africa-relief.org/wp-content/uploads/2023/11/image-3-2.webp',
      body1: 'In Africa, the pursuit of education remains pivotal, with staggering statistics showing that one in five adults lacks formal education. ARCD’s Relief champions start the change through Educational Centers, bridging this gap by providing accessible and quality education. These centers serve as catalysts for transformation, nurturing young minds, and illuminating paths to a brighter future.',
      header1: 'Educational Centers, where minds flourish and futures bloom',
      body2: 'ARCD’s Relief is committed to breaking barriers by establishing Educational Centers across communities in Africa. These centers are not just buildings; they’re havens of knowledge and hope, offering educational opportunities to those who’ve been marginalized',
      header2: 'How is ARCD\'s Relief responding?',
      body3: 'In the heart of every Educational Center lies the seed of change, nurturing minds and fostering brighter tomorrows.Your support propels , enabling education for all and fostering a more empowered, educated Africa.',
      header3: 'Education: Building Bridges, Transforming Lives',
      amounts: [
        690,
        920,
        1150,
        27600
      ],

    ),
    ProjectsData(
      id: 2,
      type: 'Water',
      title: 'Surface Water Well',
      description: 'Provide easy access to clean water for the vilage, supports 200-400 individuals. These wells sustain livelihoods, ensuring a continuous flow of clean water for those in need.',
      image: 'https://africa-relief.org/wp-content/uploads/2023/11/unnamed_2-1.webp',
      body1: 'Sub-Saharan Africa grapples with a staggering 40% of its population—approximately 783 million people—deprived of clean drinking water. In this context, each surface well acts as a beacon of hope, serving not only as a source of life but also as a vital lifeline for those lacking access, offering a means to quench the thirst and preserve the lives of many.',
      header1: 'Each well stands as a paving the way for healthier, thriving livelihoods.',
      body2: 'ARCD’s Relief establishes surface water wells, utilizing natural resources to create accessible water sources for communities in need.',
      header2: 'How is ARCD\'s Relief responding?',
      body3: 'A Surface water well can be the community’s Lifeline',
      header3: 'A Surface water well can be the community\'s Lifeline',
      amounts: [
        100,
        300,
        500,
        2500,
      ],
    ),
    ProjectsData(
      id: 3,
      type: 'Food Aid',
      title: 'Food Basket',
      description: 'Let’s Unite to Ensure No Neighbor Goes Hungry. In Africa, Two-Thirds Struggle with Food Insecurity. Your Donation Fights Hunger. Join Us to Create a Lasting Impact!',
      image: 'https://africa-relief.org/wp-content/uploads/2023/11/image-12.webp',
      body1: 'Africa faces a dire crisis, with two-thirds of its population battling food insecurity, making it a global epicenter of hunger. Millions suffer from malnutrition, highlighting the urgency for immediate action and escalated food aid. It’s crucial to protect numerous lives and pave the way for a nourished future in the region.',
      header1: 'All faiths converge on a singular cause: alleviating hunger through compassionate contributions',
      body2: 'ARCD’s Relief acts swiftly, addressing hunger through our Food Basket Project, offering vital nourishment to those in need. Your donations fuel this initiative, transforming compassion into instant relief. Join hands with us to directly impact and contribute to our mission of eradicating hunger.',
      header2: 'How is ARCD\'s Relief responding?',
      body3: 'Your generosity powers ARCD’s Relief food aid Projects, where each donation transcends empathy to provide sustenance, erasing the shadows of hunger. Join us and witness the profound impact of your support—illuminating lives and forging a path toward a future free from hunger.',
      header3: 'Your Donation. Their Nourishment',
      amounts: [
        75,
        150,
        300,
        500,
      ],
    ),
    ProjectsData(
      id: 4,
      type: 'Medical help',
      title: 'Health Carer',
      description: 'Your donation isn’t just a contribution; it’s a lifeline that fortifies communities and bolsters healthcare systems. Let’s transform hope into action, ensuring every individual in Africa receives the quality healthcare they rightfully deserve.',
      image: 'https://africa-relief.org/wp-content/uploads/2023/11/image-2-2.webp',
      body1: 'Africa bears over 24% of the world’s disease burden but has access to a mere 3% of health workers and less than 1% of global financial resources, according to WHO. This staggering gap in healthcare resources across numerous African nations raises a red flag for the continent’s overall health status, highlighting the urgent need for equitable support and resources.',
      header1: 'Let\'s turn hope into action, ensuring every individual in Africa has the fundamental right to clean water for a healthier, empowered future.',
      body2: 'Africa Relief implements two critical emergency strategies to safeguard the public health system from collapse. Our efforts focus on hospital rehabilitation and the vital distribution of medicine, medical supplies, and equipment, ensuring sustained support for communities in need.',
      header2: 'How is ARCD\'s Relief responding?',
      body3: 'Supplying essential medical resources and equipment, ensuring continuous support for communities in need.',
      header3: 'Critical Aid Needed:',
      amounts: [
        100,
        200,
        500,
        1000
      ],
    ),
    ProjectsData(
      id: 5,
      type: 'Orphan Sponsorship',
      title: 'Orphans Sponsorship',
      description: 'In the past, hearts were filled with care for orphans, embracing them with love. Today, their numbers have grown, and many who could have aided them are gone. Orphanhood, once uncommon, now prevails. The few remaining struggle to provide, unable to meet the rising tide of need.',
      image: 'https://africa-relief.org/wp-content/uploads/2023/11/unnamed_1-1.webp',
      body1: 'By sponsoring an orphan, you become their beacon of hope, offering stability, education, and a chance for a promising future. empowering orphans is not just a duty; it’s a pathway to a brighter, hopeful tomorrow',
      header1: 'Your support changes lives, turning vulnerabilities into opportunities',
      body2: 'ARCD’s Relief is dedicated to securing a better future for orphans. Through our Sponsorship Program, we provide access to education, healthcare, and a nurturing environment for these deserving children.',
      header2: 'How is ARCD\'s Relief responding?',
      body3: 'Your donation directly impacts an orphan’s life, providing essentials like education, healthcare, and emotional support. Your generosity fosters resilience and empowers them to thrive despite challenges.',
      header3: 'Your donation nurturing Futures',
      amounts: [
        50,
        150,
        300,
        600
      ],

    ),
    ProjectsData(
      id: 6,
      type: 'Zakat',
      title: 'Zakat Al-Mal',
      description: 'Zakat Al-Mal embodies the spirit of generosity, providing essential aid to uplift lives and communities',
      image: 'https://africa-relief.org/wp-content/uploads/2023/11/image_15.webp',
      body1: 'Contribute Zakat Al-Mal to create a ripple of positive change. Your generosity creates opportunities and transforms lives for the better.',
      header1: 'Your Zakat extends a hand of hope, laying the groundwork for prosperity among those seeking aid.',
      body2: 'ARCD’s Relief diligently allocates Zakat Al-Mal funds to support various sustainable projects, enabling long-term growth within communities.',
      header2: 'How is ARCD\'s Relief responding?',
      body3: 'Your Zakat Al-Mal donation aids in education, healthcare, and economic empowerment, fostering stability and growth for underprivileged communities.',
      header3: 'Your Contribution. Their Progress.',
      amounts: [
        50,
        100,
        500,
      ],
    ),
    ProjectsData(
      id: 7,
      type: 'Ramadan',
      title: 'Iftar Meal',
      description: 'It’s more than just a meal, Having the Iftar meal together fosters unity and kindness, creating bonds that transcend hunger.',
      image: 'https://africa-relief.org/wp-content/uploads/2023/11/image-6.webp',
      body1: 'In the moments of having Iftar, we find unity and compassion. Join us in providing nourishment to those fasting, sowing seeds of solidarity and care.',
      header1: 'Your support during Iftar extends beyond a meal; it feeds hope and strengthens communities.',
      body2: 'ARCD’s Relief ensures that no one breaks their fast alone. Through our Iftar Meal project, we’re distributing nutritious meals to families, fostering a sense of togetherness during this sacred time.',
      header2: 'How is ARCD\'s Relief responding?',
      body3: 'Your donation directly supports families in need, ensuring they have access to wholesome meals during Ramadan. Your generosity fosters a sense of community and provides nourishment when it’s needed most.',
      header3: 'Sharing an Iftar Meal, Enhancing Unity.',
      amounts: [
        30,
        900,
        300,
        900
      ],
    ),

  ];
  List<ProjectsData> blogs = [
    ProjectsData(
      id: 1,
      type: 'Education',
      title: 'Salah Alzoobi Mosque',
      image: 'https://africa-relief.org/wp-content/uploads/2023/09/Szuabi6-scaled.jpg',
      image2: [
        // 'https://africa-relief.org/wp-content/uploads/2023/09/Szuabi6-scaled.jpg'
        'https://africa-relief.org/wp-content/uploads/2023/09/Szuabi5-scaled.jpeg',
        'https://africa-relief.org/wp-content/uploads/2023/09/Szuabi.jpeg',
        // 'https://africa-relief.org/wp-content/uploads/2023/09/Szuabi4-scaled.jpeg'
      ],
      body1: 'In regions where access to quality education is a challenge, the establishment of an 8-room school equipped with a water well becomes a beacon of hope. This project not only provides a comprehensive educational setting for the community but also ensures students have access to clean water, a basic necessity often taken for granted. During the opening, the joy was palpable as donors interacted with the eager children and gifted school bags.',
      body2: 'Over 300 students.',
      header1: 'Empower a child’s future through education and health. Your support can light up their world.',
      header2: 'Beneficiaries:',
    ),
    ProjectsData(
      id: 2,
      type: 'Food Aid',
      title: 'Nurturing Families: Meat Distribution Initiative',
      image: 'https://africa-relief.org/wp-content/uploads/2023/10/Zabiha.jpg',
      image2: ['https://africa-relief.org/wp-content/uploads/2023/10/Zabiha.jpg',],
      body1: 'Protein-rich diets can be hard to come by in certain Tanzanian regions. Our meat distribution initiative is more than just a meal—it’s nourishment, care, and a reminder to families that they aren’t alone. Especially in areas where meals are often limited and basic, such distributions make a world of difference.',
      body2: '15 families, with an average family size of 7.',
      header1: 'Gift the joy of a hearty meal. Your generosity fills plates and hearts.',
      header2: 'Beneficiaries:',
    ),
    ProjectsData(
      id: 3,
      type: 'Water',
      title: 'Mariame Diawara and Fatoumata Tiemoko Well',
      image: 'https://africa-relief.org/wp-content/uploads/2023/09/Mariame6.jpeg',
      image2: [
        'https://africa-relief.org/wp-content/uploads/2023/09/Mariame6.jpeg',
        'https://africa-relief.org/wp-content/uploads/2023/09/Mariame4.jpeg',
        'https://africa-relief.org/wp-content/uploads/2023/09/Mariame2.jpeg',
        'https://africa-relief.org/wp-content/uploads/2023/09/Mariame.jpeg'
      ],
      body1: 'In regions affected by water scarcity, every drop counts. These solar water wells, dedicated in honor of Mariame Diawara and Fatoumata Tiemoko, ensure that hundreds have access to clean, safe water. Beyond hydration, these wells represent hope, health, and a tribute to beloved individuals.',
      body2: '600-800 individuals.',
      header1: 'Sun and water are the essence of life. Illuminate lives with your support.',
      header2: 'Beneficiaries:',
    ),
    ProjectsData(
      id: 4,
      type: 'Medical',
      title: 'Strategic Partnerships in Tanzania',
      image: 'https://africa-relief.org/wp-content/uploads/2023/09/Tanzania2.jpeg',
      image2: [
        'https://africa-relief.org/wp-content/uploads/2023/09/Tanzania2.jpeg',
        'https://africa-relief.org/wp-content/uploads/2023/09/Tanzania5.jpeg',
        'https://africa-relief.org/wp-content/uploads/2023/09/Tanzania4.jpeg',
        'https://africa-relief.org/wp-content/uploads/2023/09/Tanzania3.jpeg'
      ],
      body1: 'The Africa Relief team has made significant strides in our ongoing efforts to enhance healthcare services in Tanzania. Our visit to the office of the Deputy Minister of Health promises our inclusion in their 2024 plan focusing on eye and hearing operations. This collaboration further extends to equipping hospitals in alignment with the ministry’s vision. We also had a productive discussion with an education official, which may lead to a partnership with the Ministry of Education in the future.Outcomes of the Meeting:Inclusion in the Health Ministry’s 2024 plan for eye and hearing operations. Equipping hospitals in collaboration with the ministry. Signed a partnership agreement with Charity Vision and LEP. Launch of the “Hear and See” program. Possible cooperation avenues with the Ministry of Education.',
      body2: 'Patients needing eye and hearing treatments, hospitals that will benefit from enhanced equipment/resources, and educational beneficiaries from potential collaboration with the Ministry of Education.',
      header1: 'As we venture into these strategic partnerships, your unwavering support aids us in reaching broader horizons and ensuring better health and education for all.',
      header2: 'Beneficiaries:',
    ),
    ProjectsData(
      id: 5,
      type: 'Orphan Support',
      title: 'Strengthening Partnerships in Ghana',
      image: 'https://africa-relief.org/wp-content/uploads/2023/08/20230821_140424-2048x922.jpg',
      image2: [
        'https://africa-relief.org/wp-content/uploads/2023/08/20230821_140424-2048x922.jpg',
        'https://africa-relief.org/wp-content/uploads/2023/09/Tanzania5.jpeg',
        'https://africa-relief.org/wp-content/uploads/2023/09/Tanzania4.jpeg',
        'https://africa-relief.org/wp-content/uploads/2023/09/Tanzania3.jpeg'
      ],
      body1: 'Africa Relief had the honor of meeting with the Minister of Social Affairs and key officials at the ministry’s headquarters in Ghana. This vital meeting explored mutual areas of interest, from introducing our mission to discussing specific collaborative efforts aimed at bettering the lives of the under-resourced Ghanaian community.Key Discussions:Africa Relief’s role and ambitions in Ghana, highlighting our broader goals across the African continent. Containers shipped to Ghana, with some already delivered. Procedures for customs exemption certificates to expedite our future relief efforts. A crucial topic was the support for orphans, and the ministry provided valuable data on how we can engage and support them better. A comprehensive partnership between Africa Relief and the ministry, influencing various service departments in Ghana. Outcomes of the Meeting: The approval and coordination of educational container distributions, with documents provided for each designated area. Three of the educational containers will be specifically channeled for our specialized centers. A timeline is set to clear all containers by September 1st. A medical clinic will be gifted to the government as a gesture of goodwill from Africa Relief. A comprehensive customs exemption certificate will be issued for our containers related to a multitude of sectors, streamlining our operations. For medical convoy missions, excluding imminent ones, there will be tight-knit coordination with hospitals and the Ministry of Health to pinpoint the most needy locations. We have a clearer understanding of the orphan situation, with current records indicating 6,000 orphans across Ghana.',
      body2: 'Immediate beneficiaries encompass the institutions awaiting our containers, educational facilities, medical facilities, and notably, the 6,000 registered orphans in Ghana.',
      header1: 'This partnership reflects our commitment to driving impactful change. Your continued support ensures that such collaborations flourish, enabling us to reach more communities and touch more lives.',
      header2: 'Beneficiaries:',
    ),
  ];
  void GetRetrieveAllPayments(){
    emit(GetRetrieveLoading());
    DioHelper.getData(url: '/payment-method/retrieve/all').then((value) {
      retrieve=RetrieveAllPaymentModel.fromJson(value.data);
      emit(GetRetrieveSuccess(retrieve:retrieve!));
    }).catchError((error){
      print(error);
      emit(GetRetrieveError(error));
    });
  }
  void SingleDonation(){
    emit(GetSingleDonationStateLoading());
    DioHelper.postData(url:'/single-charge/create',data: {
      'paymentMethodId':pay,
      'amount':amount,
      'paymentDescription':getTitle
    }).then((value) {
      singlePayment=SinglePayment.fromJson(value.data);
      if(singlePayment!.data!=null) {
        print(singlePayment!.data!.clientSecret);
        Stripe.instance.handleNextAction(singlePayment!.data!.clientSecret.toString()).then((value) {
          otp=value.id;
          s=value;
          // HomeCubit();
          emit(ShowOTPSuccess());
        }).catchError((error){
          print(error.toString());
          emit(ShowOTPError(error));
        });

      }
      else{
        emit(GetSingleDonationStateSuccess(singlePay:singlePayment!));
      }
    }).catchError((error){
      print(error.toString());
      emit(GetSingleDonationStateError(error));
    });
  }
  void SubscriptionDonation(){
    emit(GetSubscriptionStateLoading());
    DioHelper.postData(url:'/subscription/create',data: {
      'paymentMethodId':pay,
      'amount':amount,
      'subscriptionName':getTitle,
      'recurringPeriod':selectedItem,
    }).then((value) {
      subscriptionPayment=SubscriptionModel.fromJson(value.data);
      if(subscriptionPayment!.data!.clientSecret!=null) {
        print(subscriptionPayment!.data!.clientSecret);
        Stripe.instance.handleNextAction(subscriptionPayment!.data!.clientSecret.toString()).then((value) {
          otp=value.id;
          s=value;
          // HomeCubit();
          emit(ShowOTPSuccess());
        }).catchError((error){
          print(error.toString());
          emit(ShowOTPError(error));
        });

      }
      else{
        emit(GetSubscriptionStatSuccess(singlePay:subscriptionPayment!));
      }
    }).catchError((error){
      print(error.toString());
      emit(GetSubscriptionStateError(error));
    });
  }
  void SingleDonationOTP(){
    emit(GetSingleDonationStateLoadingOTP());
    DioHelper.postData(url:'/single-charge/create',data: {
      'paymentIntentId':otp
    }).then((value) {
      singlePaymentOTP=SinglePayment.fromJson(value.data);
      emit(GetSingleDonationStateSuccessOTP(singlePay:singlePaymentOTP!));
      otp='';
    }).catchError((error){
      print(error.toString());
      emit(GetSingleDonationStateErrorOTP(error));
    });
  }
  void ShowOTPSheet(String secret,context){
    emit(ShowOTPLoading());
    Stripe.instance.handleNextAction(secret).then((value) {
      otp=value.id;
      HomeCubit().SingleDonationOTP();
    }).catchError((error){
      print(error.toString());
      emit(ShowOTPError(error));
    });
  }
  void GetPaymentMethodId(String controller,String controllerexmonth,String controllerexyear,String controllerccv,String controllerName,String controllerMail,String controllerCountry,String controllerLine,String controllerCity,String controllerZip){
    emit(GetPaymentMethodIdStateLoading());
     Stripea.Stripe.instance.api.createPaymentMethod({
       'type': 'card',
       'card': {
        'number':controller,
        'exp_month': controllerexmonth,
        'exp_year': controllerexyear,
        'cvc': controllerccv,
      },
       'billing_details': {
         'email': controllerMail??'', // Add the email address here
         'name': controllerName??'',
         'address': {
           'line1': controllerLine??'',
           'city': controllerCity??'',
           'state': '',
           'postal_code': controllerZip??'',
           'country': controllerCountry??'',
         },
       },

    }).then((value) {
      pay=value['id'].toString();
      print(pay);
      if(!userCardList.contains(controller)) {
        if(CashHelper.getListData(key:'cashed_cards_list')!=null) {
          userCardList=CashHelper.getListData(key:'cashed_cards_list');
        }
        userCardList.add(controller);
        DioHelper.postData(url: '/payment-method/save', data: {
        'paymentMethodId':pay,
      }).then((value) {
        CashHelper.sharedPreferences!.setStringList('cashed_cards_list',userCardList);
        print(userCardList);
        });
      }
      emit(GetPaymentMethodIdStateSuccess());

    })
        .catchError((error){
      print(error.toString());
      emit(GetPaymentMethodIdStateError(error));
    });
  }
  bool isClicked = false;
}
