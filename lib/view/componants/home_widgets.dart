// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:africa_relief/view/screens/home_screen/home_cubit/home_cubit.dart';
import 'package:africa_relief/view/screens/projects_screen/projects_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
              child:   Image(image: NetworkImage(imagePath)),
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
          Expanded(child: ProjectsCategories(imagePath: 'https://s3-alpha-sig.figma.com/img/9b61/9bb0/d64e343a9284caffdc9718f4af5015a3?Expires=1707696000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Gy~mrw1yAMcdCBv1D9~FRyqmOZTmtM5K~vHvUE9dzmu-fjzwG5zgbeaV-z1u7ydF3ip3-8mSMdAeOo52HcWoayolNJAj73NxicZEoYYrSwg1s~c08wHj~lm8C-joeLUYTcsqUCiHIO-BZ2VHWnJdOsk3xJ9Y0GE7uOgujr6iKZry8BpEvK5KfuRu1JWThEumwYpqkFJKWssN-w70B9X7WQMazWkr-gsmSKTibvZLnGpkZ53tEjdDtBNyWhttunhdcSzrNy31oK9GtZYWDNvYNZ9wSqkvlREuZAaomGBCidb8PhIgZGYkoe3VGU6sGFxafsmiBRAbtBY33UnvHbhTZA__',lapel: 'Food Aid',)),
          Expanded(child: ProjectsCategories(imagePath: 'https://s3-alpha-sig.figma.com/img/6085/b066/98e6046c0632ac81061b8fb7f9c49249?Expires=1707696000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=UndlQe09UvLpeTDASbBOZ-BfMqnGsUn3TJwkBxtsmgP~ZiGyWmd5bWs3anvE3L1H7ydB8bPs6ygMNRuc44hNfZchXQeq-8veCDdyRK-H8Qb1atg9t2Eg5lPDNzJzSIfYYgFBWMDuty1U4DOk2DmwmwA7XR8FipxukyZOL7-aOwv6Yqenh7zcqzDB2oO0KWVCmuyWAsADgnndmhIZlz0kU2iMzZIz~eEe7maorKaapfz~DmVVD527A1Hd1xXyj90jSVCQcDwf6Z6CbdJAXkYC-q-DbzsOO6JPZKXpRhGaN8LlOgbqcLHtfFh31x0MYAF6KQwg9eMj2unBG55UP~dwhg__',lapel: 'Water',)),
          Expanded(child: ProjectsCategories(imagePath: 'https://s3-alpha-sig.figma.com/img/6e9e/bc79/9e68f8d05d4083038e8b0bd8c037e739?Expires=1707696000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=mQZtL1pfZpjR5Rz3z3mIcW-Q10eWuEJq4vSf7MfQsfMfuCWDXLn8WaXUV01FaeNcfgkg16ezwIsk7EXsfOs3z0A7Da~MLxWUYexV9k-9VD06wQckpbsciZbsqJaQKpV4hii~BDmrbEszbGBZh9VrqPk3osVn6T5qnns48-ys-j~iYif32uu-ktcqJkHWaIeilsghVD0hoVfLshYF7ycC9cwl580ACMvrxyvkl~uR8zAfGtaf39UfyPqMUBKH~bcpLC3ypOQZhl4uqGCvOIl82i5iZPe52w0oqCDb-fzg~nwE1Uytu3U4eIOwzP-PsC60SLMlfjz0xqQEUGZKb0PxLQ__',lapel: 'Education',)),
          Expanded(child: ProjectsCategories(imagePath: 'https://s3-alpha-sig.figma.com/img/17f2/8201/40805018a62a7becda6df7df852403cf?Expires=1707696000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=VV~JiW0Hu6c-dUk7W7K3jrwCm7PuRPjwI7jbae44LIwyVzp9-NSfWfarAO9g13V0ds4v3jxPn4uhnqbOcjK7xFxuViWL7i2ltguth5bUhKggwtqZAj7HVvgeyHD0vZ0zEZ91D9iBkgcPn0pFL49di10uMBPbQvPJZ0YBQX~EcswGf6-haeFiROnnVyhXhggZ9yXtIGAqAG9T-7h~1MeR3p-E~RFMDxg2wBRd41b3t-b258r5~bnIrHoRtndIr5xWke3j-VdL1FFT6yn9efJ262VEVgVG26zKMMOurEVxze-FvTGUpOuU63PqKBoPo6iSlbd3RBcMRYPYIx6oSs4YHQ__',lapel:'Medical' ,)),
          Padding(
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
                    child:  Icon(Icons.more_horiz,color: buttonsColor,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text('More',style: TextStyle(fontSize: 12,),maxLines: 1,),
                  )
                ],
              ),
            ),
          ),
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
                Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => ProjectsScreen(),));
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
        padding: EdgeInsetsDirectional.zero,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Container(
              height: 230,
              width: 180,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.05),
                  borderRadius: BorderRadius.circular(30)
              ),
              child: Image(image: NetworkImage(HomeCubit.get(context).projects[index].image.toString()),fit: BoxFit.fill,),
            ),
            Padding(
              padding:  EdgeInsets.only(bottom: 12.0,left: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width:90,
                    padding: EdgeInsets.all(8),
                    decoration:BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.topLeft,
                          colors:  [
                            Colors.black26,
                            HexColor('1AFFFFFFF'),                            ],
                        ),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.grey.withOpacity(.1))
                    ),
                      child: Center(child: Text(HomeCubit.get(context).projects[index].type.toString(),style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w600),maxLines: 1,))),
                  Padding(
                    padding:  EdgeInsets.only(top:8.0),
                    child: Container(
                      padding: EdgeInsets.all(0),
                      width:150,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(color: Colors.black.withOpacity(.05),borderRadius: BorderRadius.circular(5)),
                        child: Text(HomeCubit.get(context).projects[index].title.toString(),style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w600),maxLines: 2,)),
                  ),
                ],
              ),
            )
          ],
        ),
        separatorBuilder: (context, index) => SizedBox(width: 12,),
        itemCount: HomeCubit.get(context).projects.length,
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
          child: Image(image: NetworkImage('https://s3-alpha-sig.figma.com/img/9852/c686/1545cdc2e519047f3297730cf3c27e18?Expires=1707696000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Ujwj-kGZ5dtPRSe94XUapjwDQPI6vLEw8TbF9L9idd887TY0mjerwWCTdFivGvnljqscbXsOSf4XvYHuvDTFMIGpIG-QhDVCrdEm5qJxdE9ZGp7J2hraDy0dOJ6y9g8mnzMmwLjfs3H8NNHs1C~RYtBome-OTLfNpRI1KWEL9I~rnmIcoLAxqIUo-V3VZb2iH3s2CslNWhlqLXMLbnET4K9AoCuk9CzkQNNvzFLrO6pOhtLap0KP~ehYOCSq7i7OEb5UtbcNvSLGRpxZr7f06w7sqWfWp9fF9OSegnZhFBfp1CZmYix-HjLhvkP7Na2PeT1uZ-~O3n9gf3qPukeRKg__',),fit: BoxFit.fill),
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