import 'dart:math';

import 'package:abdalla_mansour_course1/layout/shop_layout/cubit/cubit.dart';
import 'package:abdalla_mansour_course1/layout/shop_layout/cubit/states.dart';
import 'package:abdalla_mansour_course1/models/shop_app/home_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ProductsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context,state){},
        builder: (context,state){
        //productBuilder(ShopCubit.get(context).homeModel)
          return ConditionalBuilder(
              condition: ShopCubit.get(context).homeModel !=null,
              builder: (context)=>productBuilder(ShopCubit.get(context).homeModel ),
          fallback: (context)=>Center(child: CircularProgressIndicator()),
          );
        },

    );
  }
}
Widget productBuilder(HomeModel model)=>Column(
  children: [
    CarouselSlider(
    items: model.data.banners.map((e) =>Image(
      // ف مشكلة هنا ف استدعاء الصور
      image: NetworkImage("${model.data.banners[0]}"),
      width: double.infinity,
      fit: BoxFit.cover,
    ),).toList(),
      options: CarouselOptions(
        height: 250,
        initialPage: 0,
        viewportFraction: 0.4,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(seconds: 1),
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal,
        enableInfiniteScroll: true,
        reverse: false,
      ),
),
    SizedBox(height: 20,),
    Expanded(
      child:GridView.count(
        crossAxisCount: 2,
        children:List.generate(
          model.data.products.length,
              (index) => Column(
                children: [
                  // Image(image:NetworkImage(model.data.products[index].image),
                  // ),
                ],
              ),
        ),
      ),
    ),
  ],
);