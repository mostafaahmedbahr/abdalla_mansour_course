import 'package:abdalla_mansour_course1/layout/news_layout/cubit/cubit.dart';
import 'package:abdalla_mansour_course1/layout/news_layout/cubit/states.dart';
import 'package:abdalla_mansour_course1/layout/shop_layout/cubit/cubit.dart';
import 'package:abdalla_mansour_course1/layout/shop_layout/cubit/states.dart';
import 'package:abdalla_mansour_course1/layout/todo_layout/home_layout.dart';
import 'package:abdalla_mansour_course1/modules/bmi_result/bmi_result.dart';
import 'package:abdalla_mansour_course1/modules/bmi/bmi_screen.dart';
import 'package:abdalla_mansour_course1/modules/counter/counter.dart';
import 'package:abdalla_mansour_course1/modules/login/loginscreen.dart';
import 'package:abdalla_mansour_course1/modules/messenger/messenger.dart';
import 'package:abdalla_mansour_course1/modules/shop_app/onboarding/on_boaeding_screen.dart';
import 'package:abdalla_mansour_course1/modules/shop_app/shop_login_screen/shop_login_screen.dart';
import 'package:abdalla_mansour_course1/shared/bloc_observer.dart';
import 'package:abdalla_mansour_course1/shared/components/constants.dart';
import 'package:abdalla_mansour_course1/shared/network/local/cache_helper.dart';
import 'package:abdalla_mansour_course1/shared/network/remote/dio_helper.dart';
import 'package:abdalla_mansour_course1/styles/themes.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'layout/news_layout/news_layout.dart';

 void main() async {
   //
   WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer =MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool onBoarding = CacheHelper.getData(key: "onBoarding");
  token =CacheHelper.getData(key: "token");
  print(onBoarding);
  runApp(MyApp(
    onBoarding: onBoarding,
  ));
}
 class MyApp extends StatelessWidget {
final bool onBoarding;

  const MyApp({this.onBoarding});
   @override
   Widget build(BuildContext context) {
     return MultiBlocProvider(
       providers: [
         BlocProvider(
           create: (BuildContext context)=>ShopCubit()..getHomeData(),//NewsCubit()..getBusiness()..getSports()..getScience(),
         ),
       ], child:  BlocConsumer<ShopCubit,ShopStates>(
       listener: (context,state){},
       builder: (context,state){
         return MaterialApp(
           debugShowCheckedModeBanner: false,
           theme: lightTheme,
           darkTheme: darkTheme,
           themeMode: ThemeMode.light,
           home: onBoarding? ShopLoginScreen():OnBoardingScreen(),
         );
       },
     ),
     );
   }
 }