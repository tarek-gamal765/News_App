import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubit/states.dart';
import 'package:news/dio%20helper/dio_helper.dart';
import 'package:news/module/business_screen.dart';
import 'package:news/module/science_screen.dart';
import 'package:news/module/sports_screen.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Science',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'Sports',
    ),
  ];
  List<Widget> screens = [
    const BusinessScreen(),
    const ScienceScreen(),
    const SportsScreen(),
  ];

  void changeBottomNavIndex(int index) {
    currentIndex = index;
    if (currentIndex == 1) getScienceData();
    if (currentIndex == 2) getSportsData();
    emit(NewsChangeBottomNavState());
  }

  List<dynamic> business = [];

  void getBusinessData() {
    emit(NewsBusinessLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': 'ab4e68f656574f938a93b24d2c795a39',
    }).then((value) {
      business = value.data['articles'];
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      emit(NewsGetBusinessErrorState());
    });
  }

  List<dynamic> sports = [];

  void getSportsData() {
    emit(NewsSportsLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': 'ab4e68f656574f938a93b24d2c795a39',
    }).then((value) {
      sports = value.data['articles'];
      emit(NewsGetSportsSuccessState());
    }).catchError((error) {
      emit(NewsGetSportsErrorState());
    });
  }

  List<dynamic> science = [];

  void getScienceData() {
    emit(NewsScienceLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'Science',
      'apiKey': 'ab4e68f656574f938a93b24d2c795a39',
    }).then((value) {
      science = value.data['articles'];
      emit(NewsGetScienceSuccessState());
    }).catchError((error) {
      emit(NewsGetScienceErrorState());
    });
  }

  List search = [];

  void getSearchData({required value}) {
    emit(NewsSearchLoadingState());
    DioHelper.getData(url: 'v2/everything', query: {
      'q': '$value',
      'apiKey': 'ab4e68f656574f938a93b24d2c795a39',
    }).then((value) {
      search = value.data['articles'];
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      emit(NewsGetSearchErrorState());
    });
  }
}
