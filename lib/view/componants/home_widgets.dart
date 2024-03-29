// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, curly_braces_in_flow_control_structures

import 'package:africa_relief/view/componants/projects_widgets.dart';
import 'package:africa_relief/view/componants/variable.dart';
import 'package:africa_relief/view/screens/categories_screen/categories.dart';
import 'package:africa_relief/view/screens/home_screen/home_cubit/home_cubit.dart';
import 'package:africa_relief/view/screens/navigation_main_screen/app_cubit/app_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../config/themes/colors.dart';
import '../../models/projects_model.dart';
import '../screens/navigation_main_screen/navigation_screen.dart';
import '../screens/single_blog_screen/single_blog.dart';
import '../screens/single_project_screen/project_screen.dart';
import 'images_url.dart';

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
                    child: CachedNetworkImage(
                    imageUrl: 'https://africa-relief.org/wp-content/uploads/2023/09/Sadaqah1-2048x1536.jpeg',
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Center(child: CircularProgressIndicator(color:HexColor('F7F9FA'),)),
                      errorWidget: (context, url, error) => Icon(Icons.error),))
              )
          ),
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
          filter=lapel;
          currantScreen=1;
          Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
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
              child:SvgPicture.asset(imagePath),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(lapel,style: TextStyle(fontSize: 12,),maxLines: 1,overflow: TextOverflow.ellipsis,),
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
          Expanded(child: ProjectsCategories(imagePath: Images.food,lapel: 'Food Aid',)),
          Expanded(child: ProjectsCategories(imagePath: Images.water,lapel: 'Water',)),
          Expanded(child: ProjectsCategories(imagePath: Images.education,lapel: 'Education',)),
          Expanded(child: ProjectsCategories(imagePath: Images.medical,lapel:'Medical' ,)),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => CategoriesScreen(),));
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
                    child:  Icon(Icons.more_horiz,color: AppColors.buttonsColor,),
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
class HeaderAndSeeAllLin extends StatefulWidget{
  final String header;
  final String textButton;
  final bool isProject;
  final bool isBlogs;
   HeaderAndSeeAllLin({super.key, required this.header, required this.textButton,  this.isProject=false,  this.isBlogs=false,});

  @override
  State<HeaderAndSeeAllLin> createState() => _HeaderAndSeeAllLinState();
}

class _HeaderAndSeeAllLinState extends State<HeaderAndSeeAllLin> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 12),
      child: Row(
        children: [
          Text(widget.header,style: TextStyle(fontSize: 20),),
          Spacer(),
          TextButton(
              onPressed: ()async{
                setState(() {
                  if(widget.isProject)
                    currantScreen=1;
                  if(widget.isProject)
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home(),));
                  if(widget.isBlogs)
                    currantScreen=2;
                  if(widget.isBlogs)
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home(),));

                });
              },
              child: Text(widget.textButton,style: TextStyle(color: AppColors.buttonsColor,fontSize: 14),)),
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
        itemBuilder: (context, index) =>GestureDetector(
          onTap: () {
            getType=HomeCubit.get(context).projects[index].type.toString();
            getImage=HomeCubit.get(context).projects[index].image.toString();
            getTitle=HomeCubit.get(context).projects[index].title.toString();
            getH1=HomeCubit.get(context).projects[index].header1.toString();
            getH2=HomeCubit.get(context).projects[index].header2.toString();
            getH3=HomeCubit.get(context).projects[index].header3.toString();
            getB1=HomeCubit.get(context).projects[index].body1.toString();
            getB2=HomeCubit.get(context).projects[index].body2.toString();
            getB3=HomeCubit.get(context).projects[index].body3.toString();
            projectAmountsList=HomeCubit.get(context).projects[index].amounts!.toList();
            amount=HomeCubit.get(context).projects[index].amounts!.first;
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProjectScreen(),));
            print(getType);
          },
          child: Stack(
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
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: HomeCubit.get(context).projects[index].image.toString(),
                  placeholder: (context, url) => Center(child: CircularProgressIndicator(color:HexColor('F7F9FA'),)),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                )
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
        ),
        separatorBuilder: (context, index) => SizedBox(width: 12,),
        itemCount: HomeCubit.get(context).projects.length,
      ),
    );
  }

}
class BlogsRowBuilder extends StatelessWidget{
  final String num;
  final int index;
  final bool isAll;
  final List<ProjectsData> blogs;
  BlogsRowBuilder({super.key, required this.num, required this.index,  this.isAll=false, required this.blogs});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 110,
          width: 110,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10)
          ),
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl:blogs[index].image.toString(),
            placeholder: (context, url) => Center(child: CircularProgressIndicator(color:HexColor('F7F9FA'),)),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
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
                              child: Text(blogs[index].type.toString(),style: TextStyle(color: AppColors.buttonsColor,fontSize: 12),)),
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
                        if(isAll==false)
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
                  Text(blogs[index].title.toString(),style: TextStyle(fontSize: 16),maxLines: 2,overflow: TextOverflow.ellipsis,)                          ],
              ),
            ))
      ],
    );
  }
}
class BlogsList extends StatelessWidget{
  BlogsList({super.key});
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            getBlogsH1=HomeCubit.get(context).blogs[index].header1.toString();
            getBlogsH2=HomeCubit.get(context).blogs[index].header2.toString();
            getBlogsB1=HomeCubit.get(context).blogs[index].body1.toString();
            getBlogsB2=HomeCubit.get(context).blogs[index].body2.toString();
            getBlogsType=HomeCubit.get(context).blogs[index].type.toString();
            getBlogsTitle=HomeCubit.get(context).blogs[index].title.toString();
            blogsImagesList=HomeCubit.get(context).blogs[index].image2!.toList();
            Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => SingleBlogScreen(),));


          },
          child: BlogsRowBuilder(num: '${index+1}',index: index,blogs: HomeCubit.get(context).blogs,)),
      itemCount: HomeCubit.get(context).blogs.length,
    );
  }
}