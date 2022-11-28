import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/ui/pages/home_page/home_page.dart';
import 'package:movies_app/ui/themes/dark_theme.dart';
import 'package:movies_app/ui/themes/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      //Se asignan los temas de la app
      theme: lightTheme,
      darkTheme: darkTheme,
      //No se requiere del parámetro ThemeMode ya que Getx Lo gestiona internamente
      home: const HomePage(),
    );
  }
}
