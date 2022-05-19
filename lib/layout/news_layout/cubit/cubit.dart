import 'package:abdalla_mansour_course1/layout/news_layout/cubit/states.dart';
import 'package:abdalla_mansour_course1/modules/business/business_screen.dart';
import 'package:abdalla_mansour_course1/modules/science/science_screen.dart';
import 'package:abdalla_mansour_course1/modules/sports/sports_screen.dart';
import 'package:abdalla_mansour_course1/shared/network/remote/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit():super(NewsInitialState());

  static NewsCubit get(context)=>BlocProvider.of(context);
int currentIndex=0;
  List<BottomNavigationBarItem> bottomNavBar=[
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: "Business",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: "Sports",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: "Science",
    ),
  ];

  List<Widget> screens =[
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  void changeBottomNavBar(int index){
    currentIndex=index;
    if(index==0){
      getBusiness();
    }
    if(index==1){
      getSports();
    }
    if(index==2)
    {
      getScience();
    }
    emit(BottomNavBarState());
  }
  List<dynamic> business=[];

  void getBusiness(){
    emit(NewsGetBusinessLoadingState());
   if(business.length==0){
     DioHelper.getDate(
       url: 'v2/top-headlines',
       query: {
         "country":"eg",
         "category":"business",
         "apikey":"65f7f556ec76449fa7dc7c0069f040ca",
       },
     ).then((value){
       business=value.data['articles'];
     }).catchError((error)
     {
       print(error.toString());
     }).then((value){
       print(value);
       emit(NewsGetBusinessSuccessState());
     }).catchError((error){
       print(error.toString());
       emit(NewsGetBusinessErrorState(error.toString()));
     });
   }
   else{
     emit(NewsGetBusinessSuccessState());
   }
  }

// sports
  List<dynamic> sports=[];

  void getSports(){
    emit(NewsGetSportsLoadingState());
   if(sports.length==0)
   {
     DioHelper.getDate(
       url: 'v2/top-headlines',
       query: {
         "country":"eg",
         "category":"sports",
         "apikey":"65f7f556ec76449fa7dc7c0069f040ca",
       },
     ).then((value){
       sports=value.data['articles'];
     }).catchError((error)
     {
       print(error.toString());
     }).then((value){
       print(value);
       emit(NewsGetSportsSuccessState());
     }).catchError((error){
       print(error.toString());
       emit(NewsGetSportsErrorState(error.toString()));
     });
   }
   else
   {
     emit(NewsGetSportsSuccessState());
   }
  }

// Science
  List<dynamic> science=[];

  void getScience(){
    emit(NewsGetScienceLoadingState());
   if(science.length==0)
   {
     DioHelper.getDate(
       url: 'v2/top-headlines',
       query: {
         "country":"eg",
         "category":"science",
         "apikey":"65f7f556ec76449fa7dc7c0069f040ca",
       },
     ).then((value){
       science=value.data['articles'];
     }).catchError((error)
     {
       print(error.toString());
     }).then((value){
       print(value);
       emit(NewsGetScienceSuccessState());
     }).catchError((error){
       print(error.toString());
       emit(NewsGetScienceErrorState(error.toString()));
     });
   }
   else
   {
     emit(NewsGetScienceSuccessState());

   }
  }

  List<dynamic> search=[];

  void getSearch(String value){
    emit(NewsGetSearchLoadingState());
    search=[];
    DioHelper.getDate(
      url: 'v2/everything',
      query: {
        "q":"$value",
        "apikey":"65f7f556ec76449fa7dc7c0069f040ca",
      },
    ).then((value){
      search=value.data['articles'];
    }).catchError((error)
    {
      print(error.toString());
    }).then((value){
      print(value);
      emit(NewsGetSearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });

  }
}