import 'package:abdalla_mansour_course1/layout/news_layout/cubit/cubit.dart';
import 'package:abdalla_mansour_course1/layout/news_layout/cubit/states.dart';
import 'package:abdalla_mansour_course1/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var list = NewsCubit.get(context).search;
        return  Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                  controller: searchController,
                  type: TextInputType.text,
                  change: (value)
                  {
                    NewsCubit.get(context).getSearch(value);
                  },
                  validate: (String value)
                  {
                    if(value.isEmpty)
                    {
                      return "must not be empty";
                    }
                    return null;
                  },
                  text: "Search Screen",
                  icon: Icons.search,
                ),
              ),
              Expanded(
                child: articleItem(list, context),
              ),
            ],
          ),
        );
      },
    );
  }
}
