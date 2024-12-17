import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../constants.dart';

ThemeData appThemeData() {
  return ThemeData(
      appBarTheme: const AppBarTheme(
        color: Colors.white,
      ),
      fontFamily: 'jannah',
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: kPrimaryColor),
      scaffoldBackgroundColor: Colors.white,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: kPrimaryColor,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: kPrimaryColor,
      ));
}

ThemeData appdarkThemeData() {
  return ThemeData(
    primarySwatch: Colors.deepOrange,
    scaffoldBackgroundColor: HexColor('333739'),
    appBarTheme: AppBarTheme(
      titleSpacing: 20,
      backgroundColor: HexColor('333739'),
      elevation: 0,
      titleTextStyle: const TextStyle(fontSize: 24),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: HexColor('333739'),
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: HexColor('333739'),
      selectedItemColor: Colors.deepOrange,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      elevation: 20,
    ),
    textTheme: const TextTheme(
        bodyMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    )),
  );
}
