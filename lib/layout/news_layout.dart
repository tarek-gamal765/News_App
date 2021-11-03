import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/components/components.dart';
import 'package:news/cubit/cubit.dart';
import 'package:news/cubit/states.dart';
import 'package:news/module/search_screen.dart';
import 'package:news/theme/cubit/cubit.dart';
import 'package:news/theme/cubit/states.dart';


class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsCubit>(
      create: (context) => NewsCubit()..getBusinessData(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          NewsCubit cubit = NewsCubit.get(context);
          return BlocConsumer<ThemeCubit, ThemeStates>(
            listener: (context, state) {},
             builder: (context, state)=> Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                    onPressed: () {
                      navigateTo(context: context, widget: SearchScreen());
                    },
                    icon: const Icon(
                      Icons.search,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                     ThemeCubit.get(context).changeThemeMode();
                    },
                    icon:  Icon(
                     ThemeCubit.get(context).isDark ? Icons.wb_sunny_outlined: Icons.nightlight_rounded ,
                    ),
                  ),
                ],
                title: const Text('News App'),
              ),
              body: cubit.screens[cubit.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                items: cubit.items,
                onTap: (index) {
                  cubit.changeBottomNavIndex(index);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
