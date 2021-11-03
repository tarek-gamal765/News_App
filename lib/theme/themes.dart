import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lightTheme = ThemeData(
  //hintColor: Colors.grey,
  primarySwatch: Colors.teal,
  fontFamily: 'Lato',
  scaffoldBackgroundColor: Colors.white,
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    subtitle1: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.teal,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white54,
  ),
  appBarTheme: const AppBarTheme(
    actionsIconTheme: IconThemeData(
      color: Colors.white,
    ),
    titleTextStyle: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    elevation: 0.0,
    backgroundColor: Colors.teal,
    //  backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.teal,
      statusBarIconBrightness: Brightness.light,
    ),
  ),
);
ThemeData darkTheme = ThemeData(
  hintColor: Colors.grey,
  primarySwatch: Colors.grey,
  scaffoldBackgroundColor: HexColor('222831'),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: HexColor('EDEDED'),
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: HexColor('222831'),
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.grey,
  ),
  appBarTheme: AppBarTheme(
    actionsIconTheme: IconThemeData(
      color: HexColor('EDEDED'),
    ),
    titleTextStyle: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: HexColor('EDEDED'),
    ),
    elevation: 0.0,
    backgroundColor: HexColor('222831'),
    //backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarColor: HexColor('222831'),
      statusBarIconBrightness: Brightness.light,
    ),
  ),
);
