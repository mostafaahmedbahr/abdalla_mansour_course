import 'package:abdalla_mansour_course1/layout/news_layout/cubit/cubit.dart';
import 'package:abdalla_mansour_course1/layout/news_layout/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:abdalla_mansour_course1/shared/components/components.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ScienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var list = NewsCubit.get(context).science;
        return articleItem(list,context);
      },
    );
  }
}
