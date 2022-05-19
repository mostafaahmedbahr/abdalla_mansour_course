import 'dart:math';

import 'package:abdalla_mansour_course1/layout/shop_layout/cubit/cubit.dart';
import 'package:abdalla_mansour_course1/modules/shop_app/search/search_screen.dart';
import 'package:abdalla_mansour_course1/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ShopLayoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = ShopCubit.get(context);
    return  Scaffold(
      appBar: AppBar(title:Text("Salla"),
      actions: [
        IconButton(
        icon: Icon(Icons.search,),
        onPressed: (){
          Navigator.push(context,
          MaterialPageRoute(builder: (context)=>SearchScreen(),
          ),
          );
        },
        ),
      ],),
      body: cubit.bottomScreens[cubit.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: cubit.currentIndex,
        onTap: (index){
          cubit.changeBottom(index);
        },
        items: [
          BottomNavigationBarItem(
              label: "Products",
              icon:Icon(Icons.production_quantity_limits_sharp),
          ),
          BottomNavigationBarItem(
            label: "Category",
            icon:Icon(Icons.category_outlined),
          ),
          BottomNavigationBarItem(
            label: "Favorite",
            icon:Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            label: "Settings",
            icon:Icon(Icons.settings),
          ),
        ],
      ),

    );
  }
}
