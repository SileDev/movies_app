import 'package:flutter/material.dart';
//ThemeData del tema light

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.transparent,
    shadowColor: Colors.transparent,
    iconTheme: IconThemeData(
      color: Colors.black87,
    ),
  ),
  iconTheme: const IconThemeData(
    color: Colors.black87,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      foregroundColor: const Color(0xffefefef),
      //En el diseño el botón no tiene sombra
      shadowColor: Colors.transparent,
    ),
  ),
  primarySwatch: primarySwatch,
  scaffoldBackgroundColor: const Color(0xffefefef),
  backgroundColor: const Color(0xffd0d0d0),
  canvasColor: const Color(0xffdfdfdf),
);

MaterialColor primarySwatch = MaterialColor(0xff7f7f7f, color);

Map<int, Color> color = {
  50: const Color(0x177f7f7f),
  100: const Color(0x337f7f7f),
  200: const Color(0x4b7f7f7f),
  300: const Color(0x667f7f7f),
  400: const Color(0x7e7f7f7f),
  500: const Color(0x997f7f7f),
  600: const Color(0xb17f7f7f),
  700: const Color(0xcc7f7f7f),
  800: const Color(0xe47f7f7f),
  900: const Color(0xff7f7f7f),
};
