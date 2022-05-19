import 'package:abdalla_mansour_course1/layout/shop_layout/cubit/states.dart';
import 'package:abdalla_mansour_course1/models/shop_app/home_model.dart';
import 'package:abdalla_mansour_course1/modules/shop_app/categories/categories_screen.dart';
import 'package:abdalla_mansour_course1/modules/shop_app/favourites/fav_screen.dart';
import 'package:abdalla_mansour_course1/modules/shop_app/products/products_screen.dart';
import 'package:abdalla_mansour_course1/modules/shop_app/settings/settings_screen.dart';
import 'package:abdalla_mansour_course1/shared/components/constants.dart';
import 'package:abdalla_mansour_course1/shared/network/end_points.dart';
import 'package:abdalla_mansour_course1/shared/network/remote/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopCubit extends Cubit<ShopStates>{

  ShopCubit():super(ShopInitialStates());

  static ShopCubit get(context)=>BlocProvider.of(context);
  int currentIndex=0;
  List<Widget> bottomScreens=[
    ProductsScreen(),
    CategoriesScreen(),
    FavScreen(),
    SettingsScreen(),

  ];

  void changeBottom(int index){
    currentIndex=index;
    emit(ShopChangeNavBarState());
  }
HomeModel homeModel;
  void getHomeData(){
    emit(ShopLoadingStates());
    DioHelper.getDate(url: HOME,token: token,  ).then((value)
    {
      homeModel=HomeModel.fromJson(value.data);
      print(homeModel.data.banners);
      print(homeModel.status);
      emit(ShopSuccessStates());
    }).catchError((error)
    {
      print("errorrrrreeeeeeee ${error.toString()}");
      emit(ShopErrorStates());
    });
  }
}