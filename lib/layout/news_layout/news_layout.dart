import 'package:abdalla_mansour_course1/layout/news_layout/cubit/cubit.dart';
import 'package:abdalla_mansour_course1/layout/news_layout/cubit/states.dart';
import 'package:abdalla_mansour_course1/modules/search_screen/search_screen.dart';
import 'package:abdalla_mansour_course1/shared/components/components.dart';
import 'package:abdalla_mansour_course1/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener:(context,state) {},
      builder:(context,state){
        var cubit=NewsCubit.get(context);
        return  Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: (){
                 // navigateTo(context, SearchScreen(),);
                  Navigator.push(context,MaterialPageRoute(
                      builder: (context)=>SearchScreen(),
                  ),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.brightness_4_outlined),
                onPressed: (){
                },
              ),
            ],
            title: Text("News App"),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeBottomNavBar(index);
            },
            items: cubit.bottomNavBar,
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      } ,
    );
  }
}


