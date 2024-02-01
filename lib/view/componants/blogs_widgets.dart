// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, sized_box_for_whitespace

import 'package:africa_relief/view/componants/singel_project_widgets.dart';
import 'package:africa_relief/view/componants/variable.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../config/themes/colors.dart';
import '../screens/home_screen/home_cubit/home_cubit.dart';
import '../screens/single_blog_screen/single_blog.dart';
import 'home_widgets.dart';


dynamic BlogImagesSlider(context){
  return CarouselOptions(
    height: 200,
    viewportFraction: 1,
    enlargeCenterPage: false,
    initialPage: 0,
    enableInfiniteScroll: true,
    reverse: true,
    autoPlay: blogsImagesList.length>1?true:false,
    autoPlayInterval: Duration(seconds:10),
    autoPlayAnimationDuration: Duration(seconds: 2),
    autoPlayCurve: Curves.linear,
    scrollDirection: Axis.horizontal,
  );
}
class ProjectsList extends StatelessWidget{
  const ProjectsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: HomeCubit.get(context).blogs.length,
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
          child: UpdatesRow(index: index,num: '1',isAll: true)),
      separatorBuilder: (context, index) => SizedBox(height: 16,),
    );
  }
}
class HeaderOfSingleBlog extends StatelessWidget{
   HeaderOfSingleBlog({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 12.0),
      child: Container(
        width: double.infinity,
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
                        child: Text(getBlogsType,style: TextStyle(color: buttonsColor,fontSize: 12),)),
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
                ],
              ),
            ),
            Text(getBlogsTitle,style: TextStyle(fontSize: 24),maxLines: 3,overflow: TextOverflow.ellipsis,)                          ],
        ),
      ),
    );
  }
}
class ImagesSlider extends StatefulWidget{
  final CarouselController controller;
  ImagesSlider({super.key, required this.controller});

  @override
  State<ImagesSlider> createState() => _ImagesSliderState();
}
class _ImagesSliderState extends State<ImagesSlider> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 14.0),
      child: Container(
        height: 200,
        width: double.infinity,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30)
        ),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Stack(
              alignment: Alignment.centerRight,
              children: [
                CarouselSlider(
                  carouselController: widget.controller,
                  items: blogsImagesList.map(
                        (e) => Container(
                      padding: EdgeInsets.all(4),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child:  CachedNetworkImage(
                        width: double.infinity,
                        fit: BoxFit.cover,
                        imageUrl: e,
                        placeholder: (context, url) => CircularProgressIndicator(color: Colors.white,),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  )
                      .toList(),
                  options: BlogImagesSlider(context),
                ),
                IconButton(onPressed: () {
                  setState(() {
                    widget.controller.nextPage();
                  });
                }, icon:Icon( Icons.arrow_forward_ios,color: Colors.white,size: 25,))
              ],
            ),
            IconButton(onPressed: () {
              setState(() {
                widget.controller.previousPage();
              });
            }, icon:Icon( Icons.arrow_back_ios,color: Colors.white,size: 25,))
          ],
        ),
      ),
    );
  }
}
class BlogParagraph extends StatelessWidget{
  BlogParagraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProjectHeaderRow(header: getBlogsH1,isProjectHeadColor: false),
        SizedBox(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Text(getBlogsB1,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: HexColor('525866')),),
              ],
            ),
          ),
        ),
        ProjectHeaderRow(header: getBlogsH2,isProjectHeadColor: false),
        SizedBox(
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(getBlogsB2,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: HexColor('525866')),)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
