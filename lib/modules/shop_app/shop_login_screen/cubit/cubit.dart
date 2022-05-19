import 'package:abdalla_mansour_course1/models/shop_app/shop_app_model.dart';
import 'package:abdalla_mansour_course1/modules/shop_app/shop_login_screen/cubit/states.dart';
import 'package:abdalla_mansour_course1/shared/network/end_points.dart';
import 'package:abdalla_mansour_course1/shared/network/remote/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates>{
  ShopLoginCubit() : super(ShopLoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);

  ShopLoginModel loginModel;
  void userLogin({
  @required String email,
    @required String password,
}){
    emit(ShopLoginLoadingState());
    DioHelper.postDate(
      url: LOGIN,
        data: {
        "email":email,
          "password":password,
        },
    ).then((value){
      print(value.data);
      loginModel=ShopLoginModel.fromJson(value.data);
      emit(ShopLoginSuccessState(loginModel));
    },).catchError((error){
      print("error ${error.toString()}");
      emit(ShopLoginErrorState(error));
    });
  }
}