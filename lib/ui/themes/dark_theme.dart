import 'package:flutter/material.dart';

//ThemeData del tema dark

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark, 
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.transparent,
    shadowColor: Colors.transparent,
    iconTheme: IconThemeData(
      color: Colors.white70,
    ),
  ),
  iconTheme: const IconThemeData(
    color: Colors.white70,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      foregroundColor: Colors.white,
      //En el diseño el botón no tiene sombra
      shadowColor: Colors.transparent,
    ),
  ),
  primarySwatch: primarySwatch,
  scaffoldBackgroundColor: const Color(0xff2C3848),
  backgroundColor: const Color(0xFF5A6F89),
  canvasColor: const Color(0xFF3A4A5F),
);

MaterialColor primarySwatch = MaterialColor(0xff6b7480, color);

Map<int, Color> color = {
  50: const Color(0x176b7480),
  100: const Color(0x336b7480),
  200: const Color(0x4b6b7480),
  300: const Color(0x666b7480),
  400: const Color(0x7e6b7480),
  500: const Color(0x996b7480),
  600: const Color(0xb16b7480),
  700: const Color(0xcc6b7480),
  800: const Color(0xe46b7480),
  900: const Color(0xff6b7480),
};
