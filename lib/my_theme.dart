import 'package:flutter/material.dart';

class MyTheme {
  static Color blackColor = const Color(0xff242424);
  static Color primaryLight = const Color(0xffB7935F);
  static Color primaryDark = const Color(0xff141A2E);
  static Color whiteColor = const Color(0xffF8F8F8);
  static Color yellowColor = const Color(0xffFACC1D);

  static ThemeData lightMode = ThemeData(
      textTheme: TextTheme(
          titleMedium: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 25, color: blackColor),
          titleSmall: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 25, color: blackColor),
          titleLarge: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          )),
      primaryColor: primaryLight,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: blackColor,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: blackColor,
          showUnselectedLabels: false,
          backgroundColor: primaryLight));
  static ThemeData darkMode = ThemeData(
      textTheme: TextTheme(
          titleMedium: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 25, color: whiteColor),
          titleSmall: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 25, color: whiteColor),
          titleLarge: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: whiteColor,
          )),
      primaryColor: primaryDark,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: whiteColor,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: yellowColor,
          showUnselectedLabels: false,
          backgroundColor: primaryDark));
}
