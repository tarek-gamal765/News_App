import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/components/components.dart';
import 'package:news/cubit/cubit.dart';
import 'package:news/cubit/states.dart';
import 'package:news/theme/cubit/cubit.dart';
import 'package:news/theme/cubit/states.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, states) {},
      builder: (context, states) {
        var cubit = NewsCubit.get(context);
        return BlocConsumer<ThemeCubit, ThemeStates>(
          listener: (context, states) {},
          builder: (context, states) => Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    controller: searchController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '';
                      }
                    },
                    onChanged: (value) {
                      cubit.getSearchData(value: value);
                    },
                    style: TextStyle(
                      color: ThemeCubit.get(context).isDark
                          ? Colors.white
                          : Colors.black,
                    ),
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle:
                          Theme.of(context).textTheme.subtitle1!.copyWith(
                                color: Colors.grey[700],
                              ),
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.red , width: 20),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder: (context, index) => myDivider(),
                    itemBuilder: (context, index) {
                      return buildNewsItem(
                          context: context, articles: cubit.search[index]);
                    },
                    itemCount: cubit.search.length,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
