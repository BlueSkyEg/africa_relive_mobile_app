// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:africa_relief/view/screens/projects_screen/projects_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../config/themes/colors.dart';

class SliderCard extends StatelessWidget{
   SliderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Padding(
          padding:  EdgeInsets.all(0.0),
          child: Container(
            height: 115,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: HexColor('#E5E5E5')
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 130,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: HexColor('#BFBFBF')
            ),
          ),
        ),
        Padding(
          padding:  EdgeInsets.all(12.0),
          child: Container(
              height: 170,
              width: double.infinity,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0), // Set border radius here
                ),
                child: Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Image.asset('assets/images/Zabiha.jpg',fit: BoxFit.cover)),
              )),
        ),
      ],
    );
  }

}
class ProjectsCategories extends StatelessWidget{
  final String imagePath;
  final String lapel;
   ProjectsCategories({super.key, required this.imagePath, required this.lapel});
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10.0),
      child: GestureDetector(
        onTap: () {
        },
        child: Column(
          children: [
            Container(
              height: 56,
              width: 56,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: HexColor('F7F9FA')
              ),
              child: SvgPicture.asset(imagePath,),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(lapel,style: TextStyle(fontSize: 12,),maxLines: 1,),
            )
          ],
        ),
      ),
    );
  }

}
class ProjectsCategoriesRow extends StatelessWidget{
   ProjectsCategoriesRow({super.key,});
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.only(top: 16.0),
      child: Row(
        children: [
          Expanded(child: ProjectsCategories(imagePath: 'assets/images/cart.svg',lapel: 'Food Aid',)),
          Expanded(child: ProjectsCategories(imagePath: 'assets/images/water.svg',lapel: 'Water',)),
          Expanded(child: ProjectsCategories(imagePath: 'assets/images/book.svg',lapel: 'Education',)),
          Expanded(child: ProjectsCategories(imagePath: 'assets/images/hospital.svg',lapel:'Medical' ,)),
          Expanded(child: ProjectsCategories(imagePath: 'assets/images/More.svg',lapel:'More' ,)),
        ],
      ),
    );
  }

}
class HeaderAndSeeAllLin extends StatelessWidget{
  final String header;
  final String textButton;

   HeaderAndSeeAllLin({super.key, required this.header, required this.textButton,});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 12),
      child: Row(
        children: [
          Text(header,style: TextStyle(fontSize: 20),),
          Spacer(),
          TextButton(
              onPressed: ()async{
                Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => ProjectsScreen(),));
              },
              child: Text(textButton,style: TextStyle(color: buttonsColor,fontSize: 14),)),
        ],
      ),
    );
  }

}
class ProjectList extends StatelessWidget{
   ProjectList({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>Container(
          width: 180,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30)
          ),
          child: SvgPicture.asset('assets/images/card.svg',fit: BoxFit.fill,),
        ),
        separatorBuilder: (context, index) => SizedBox(width: 12,),
        itemCount: 10,
      ),
    );
  }

}
class UpdatesRow extends StatelessWidget{
  final String num;
  UpdatesRow({super.key, required this.num});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 104,
          width: 90,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10)
          ),
          child: SvgPicture.asset('assets/images/postCard.svg',fit: BoxFit.fill,),
        ),
        Expanded(
            child: Padding(
              padding:  EdgeInsets.only(left: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(bottom: 12.0),
                    child: Row(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(right: 8.0),
                          child: Container(
                              padding: EdgeInsets.all(8),
                              decoration:BoxDecoration(
                                  color: HexColor('F1F7F3'),
                                  borderRadius: BorderRadius.circular(50)
                              ),
                              child: Text('Education',style: TextStyle(color: buttonsColor,fontSize: 12),)),
                        ),
                        Container(
                          height: 24,
                          width: 1,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left: 8.0),
                          child: Text('Nov 22, 2023',style: TextStyle(color: HexColor('86898E'),fontSize: 12)),
                        ),
                        Spacer(),
                        Padding(
                          padding:  EdgeInsets.only(right: 8),
                          child: Container(
                            padding: EdgeInsets.only(top: 2,right: 5,left: 5,bottom: 2),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(.1),
                              borderRadius: BorderRadius.circular(50),
                            ),
                              child: Text(num,style: TextStyle(color: Colors.black12.withOpacity(.2)),)),
                        )
                      ],
                    ),
                  ),
                  Text('Starting Small Businesses for Families',style: TextStyle(fontSize: 16),maxLines: 2,overflow: TextOverflow.ellipsis,)                          ],
              ),
            ))
      ],
    );
  }
}
class UpdatesList extends StatelessWidget{
  UpdatesList({super.key});
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) => UpdatesRow(num: '${index+1}',),
      itemCount: 10,
    );
  }
}