import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubit/cubit.dart';
import 'package:news/layout/news_layout.dart';
import 'package:news/theme/cubit/cubit.dart';
import 'package:news/theme/cubit/states.dart';
import 'package:news/theme/themes.dart';
import 'bloc observer/bloc_observer.dart';
import 'cache helper/cache_helper.dart';
import 'dio helper/dio_helper.dart';

bool? isDark;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  isDark = CacheHelper.getBoolean(key: 'isDark');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    isDark = CacheHelper.getBoolean(key: 'isDark');
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsCubit>(
          create: (context) => NewsCubit(),
        ),
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit()..changeThemeMode(fromShared: isDark),
        ),
      ],
      child: BlocConsumer<ThemeCubit , ThemeStates>(
        listener: (context, state) {},
        builder: (context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          darkTheme: darkTheme,
          theme: lightTheme,
          themeMode: ThemeCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
          home: const NewsLayout(),
        ),
      ),
    );
  }
}
