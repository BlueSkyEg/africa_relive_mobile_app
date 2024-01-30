// ignore_for_file: avoid_function_literals_in_foreach_calls, avoid_print
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../models/projects_model.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);
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
    ),

  ];
  // final List<BalanceData> testProfit = [
  //       BalanceData(
  //           accountType: 'first',
  //           accountDetails: [
  //                 AccountDetail(
  //                     name:'1',
  //                     amounts: {
  //                           "1": -20.86,
  //                           "2": -416.55,
  //                           "3": -68.87,
  //                           "4": -3867.52,
  //                           "5": -89.65,
  //                           "6": 0,
  //                           "7": -201.11,
  //                           "8": -111.77,
  //                           "9": 0,
  //                           "10": 0,
  //                           "11": 1,
  //                           "12": 0,
  //                           "total": -4836.33}),
  //                 AccountDetail(
  //                     name:'2',
  //                     amounts: {
  //                           "1": -30.86,
  //                           "2": -416.55,
  //                           "3": -68.87,
  //                           "4": -3867.52,
  //                           "5": -89.65,
  //                           "6": 0,
  //                           "7": -201.11,
  //                           "8": -111.77,
  //                           "9": 0,
  //                           "10": 0,
  //                           "11": 2,
  //                           "12": 0,
  //                           "total": -4836.33}),
  //                 AccountDetail(
  //                     name:'3',
  //                     amounts: {
  //                           "1": -40.86,
  //                           "2": -416.55,
  //                           "3": -68.87,
  //                           "4": -3867.52,
  //                           "5": -89.65,
  //                           "6": 0,
  //                           "7": -201.11,
  //                           "8": -111.77,
  //                           "9": 0,
  //                           "10": 0,
  //                           "11": 3,
  //                           "12": 0,
  //                           "total": -4836.33}),
  //                 AccountDetail(
  //                     name:'4',
  //                     amounts: {
  //                           "1": -80.86,
  //                           "2": -416.55,
  //                           "3": -68.87,
  //                           "4": -3867.52,
  //                           "5": -89.65,
  //                           "6": 0,
  //                           "7": -201.11,
  //                           "8": -111.77,
  //                           "9": 0,
  //                           "10": 0,
  //                           "11": 0,
  //                           "12": 0,
  //                           "total": -5836.33}),
  //           ]
  //
  //       ),
  //       BalanceData(
  //           accountType: 'second',
  //           accountDetails: [
  //                 AccountDetail(
  //                     name:'first',
  //                     amounts: {
  //                           "1": -80.86,
  //                           "2": -416.55,
  //                           "3": -68.87,
  //                           "4": -3867.52,
  //                           "5": -89.65,
  //                           "6": 0,
  //                           "7": -201.11,
  //                           "8": -111.77,
  //                           "9": 0,
  //                           "10": 0,
  //                           "11": 0,
  //                           "12": 0,
  //                           "total": -4836.33}),
  //                 AccountDetail(
  //                     name:'second',
  //                     amounts: {
  //                           "1": -80.86,
  //                           "2": -416.55,
  //                           "3": -68.87,
  //                           "4": -3867.52,
  //                           "5": -89.65,
  //                           "6": 0,
  //                           "7": -201.11,
  //                           "8": -111.77,
  //                           "9": 0,
  //                           "10": 0,
  //                           "11": 0,
  //                           "12": 0,
  //                           "total": -4836.33}),
  //                 AccountDetail(
  //                     name:'theird',
  //                     amounts: {
  //                           "1": -80.86,
  //                           "2": -416.55,
  //                           "3": -68.87,
  //                           "4": -3867.52,
  //                           "5": -89.65,
  //                           "6": 0,
  //                           "7": -201.11,
  //                           "8": -111.77,
  //                           "9": 0,
  //                           "10": 0,
  //                           "11": 0,
  //                           "12": 0,
  //                           "total": -4836.33}),
  //                 AccountDetail(
  //                     name:'fourth',
  //                     amounts: {
  //                           "1": -80.86,
  //                           "2": -416.55,
  //                           "3": -68.87,
  //                           "4": -9,
  //                           "5": -89.65,
  //                           "6": 0,
  //                           "7": -201.11,
  //                           "8": -111.77,
  //                           "9": 0,
  //                           "10": 0,
  //                           "11": 0,
  //                           "12": 0,
  //                           "total": -6836.33}),
  //           ]
  //
  //       ),
  //       BalanceData(
  //           accountType: 'theird',
  //           accountDetails: [
  //                 AccountDetail(
  //                     name:'first',
  //                     amounts: {
  //                           "1": -80.86,
  //                           "2": -416.55,
  //                           "3": -68.87,
  //                           "4": -3867.52,
  //                           "5": -89.65,
  //                           "6": 0,
  //                           "7": -201.11,
  //                           "8": -111.77,
  //                           "9": 0,
  //                           "10": 0,
  //                           "11": 0,
  //                           "12": 0,
  //                           "total": -4836.33}),
  //                 AccountDetail(
  //                     name:'second',
  //                     amounts: {
  //                           "1": -80.86,
  //                           "2": -416.55,
  //                           "3": -68.87,
  //                           "4": -3867.52,
  //                           "5": -89.65,
  //                           "6": 0,
  //                           "7": -201.11,
  //                           "8": -111.77,
  //                           "9": 0,
  //                           "10": 0,
  //                           "11": 0,
  //                           "12": 0,
  //                           "total": -4836.33}),
  //                 AccountDetail(
  //                     name:'theird',
  //                     amounts: {
  //                           "1": -80.86,
  //                           "2": -416.55,
  //                           "3": -68.87,
  //                           "4": -3867.52,
  //                           "5": -89.65,
  //                           "6": 0,
  //                           "7": -201.11,
  //                           "8": -111.77,
  //                           "9": 0,
  //                           "10": 0,
  //                           "11": 0,
  //                           "12": 0,
  //                           "total": -4836.33}),
  //                 AccountDetail(
  //                     name:'fourth',
  //                     amounts: {
  //                           "1": -80.86,
  //                           "2": -416.55,
  //                           "3": -68.87,
  //                           "4": -3867.52,
  //                           "5": -89.65,
  //                           "6": 0,
  //                           "7": -201.11,
  //                           "8": -111.77,
  //                           "9": 0,
  //                           "10": 0,
  //                           "11": 0,
  //                           "12": 0,
  //                           "total": -7836.33}),
  //           ]
  //
  //       ),
  //       BalanceData(
  //           accountType: 'fourth',
  //           accountDetails: [
  //                 AccountDetail(
  //                     name:'first',
  //                     amounts: {
  //                           "1": -80.86,
  //                           "2": -416.55,
  //                           "3": -68.87,
  //                           "4": -3867.52,
  //                           "5": -89.65,
  //                           "6": 0,
  //                           "7": -201.11,
  //                           "8": -111.77,
  //                           "9": 0,
  //                           "10": 0,
  //                           "11": 0,
  //                           "12": 0,
  //                           "total": -4836.33}),
  //                 AccountDetail(
  //                     name:'second',
  //                     amounts: {
  //                           "1": -80.86,
  //                           "2": -416.55,
  //                           "3": -68.87,
  //                           "4": -3867.52,
  //                           "5": -89.65,
  //                           "6": 0,
  //                           "7": -201.11,
  //                           "8": -111.77,
  //                           "9": 0,
  //                           "10": 0,
  //                           "11": 0,
  //                           "12": 0,
  //                           "total": -4836.33}),
  //                 AccountDetail(
  //                     name:'theird',
  //                     amounts: {
  //                           "1": -80.86,
  //                           "2": -416.55,
  //                           "3": -68.87,
  //                           "4": -3867.52,
  //                           "5": -89.65,
  //                           "6": 0,
  //                           "7": -201.11,
  //                           "8": -111.77,
  //                           "9": 0,
  //                           "10": 0,
  //                           "11": 0,
  //                           "12": 0,
  //                           "total": -4836.33}),
  //                 AccountDetail(
  //                     name:'fourth',
  //                     amounts: {
  //                           "1": -2,
  //                           "2": -416.55,
  //                           "3": -68.87,
  //                           "4": -3867.52,
  //                           "5": -89.65,
  //                           "6": 0,
  //                           "7": -201.11,
  //                           "8": -111.77,
  //                           "9": 0,
  //                           "10": 0,
  //                           "11": 0,
  //                           "12": 0,
  //                           "total": -8836.33}),
  //           ]
  //
  //       ),
  //       BalanceData(
  //           accountType: 'fifth',
  //           amounts: {
  //                 "1": -80.86,
  //                 "2": -416.55,
  //                 "3": -68.87,
  //                 "4": -3867.52,
  //                 "5": -89.65,
  //                 "6": 0,
  //                 "7": -201.11,
  //                 "8": -111.77,
  //                 "9": 0,
  //                 "10": 0,
  //                 "11": 0,
  //                 "12": 0,
  //                 "total": -9836.33}
  //
  //       ),
  // ];
  bool isClicked = false;
  // void GetProfitSheet(context) async {
  //   emit(GetProfitStateLoading());
  //   Token= await CashHelper.getData(key: 'token');
  //   ProfileCubit.get(context).GetUserprofile();
  //   year= await CashHelper.getData(key: 'year') ?? ProfileCubit.get(context).profile!.data!.intialCompany!.plYears!.first.toString();
  //   idCompany= await CashHelper.getData(key: 'idCompany') ?? ProfileCubit.get(context).profile!.data!.intialCompany!.id.toString();
  //   DioHelper.getData(url: '/api/reports/pl/company/$idCompany/year/$year',token: 'Bearer $Token')
  //       .then((value) {
  //     var valueData = value.data['data'] as List;
  //     valueData.forEach((element) {
  //       Profit.add(BalanceData.fromJson(element));
  //     });
  //     emit(GetProfitStateSuccess());
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(GetProfitStateError(error));
  //   });
  // }
}
// ProjectsData(
// id: 1,
// type: '',
// title: ' ',
// description: '',
// image: '',
// body1: '',
// header1: '',
// body2: '',
// header2: '',
// body3: '',
// header3: '',
// ),
