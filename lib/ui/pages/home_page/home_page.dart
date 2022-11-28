import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/ui/pages/home_page/components/category_caroussel/category_caroussel.dart';
import 'package:movies_app/ui/pages/home_page/components/category_counter/category_counter.dart';
import 'package:movies_app/ui/pages/search_page/search_page.dart';
import 'package:movies_app/ui/themes/dark_theme.dart';
import 'package:movies_app/ui/themes/light_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          SizedBox(
            width: 56,
            //Botón que alterna el tema de la app
            child: IconButton(
              icon: Icon(
                //Se alternan los iconos según el tema actual
                Get.isDarkMode
                    ? Icons.nightlight_round_rounded
                    : Icons.wb_sunny_rounded,
              ),
              tooltip: "Switch theme",
              onPressed: () {
                //Se cambia el tema de la app
                Get.changeTheme(
                  Get.isDarkMode ? lightTheme : darkTheme,
                );
                //se cambia el ThemeMode de la app
                Get.changeThemeMode(
                  Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
                );
              },
            ),
          ),
        ],
        //Contenido del AppBar
        bottom: PreferredSize(
          preferredSize: const Size(
            double.infinity,
            136,
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              right: 56,
              bottom: 32,
              left: 56,
            ),
            child: Column(
              children: [
                //Titulo
                Container(
                  height: 72,
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Center(
                    child: Text(
                      "Hello, what do you want to watch?",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
                //SearchBar
                GestureDetector(
                  onTap: () {
                    //Se navega a search page
                    Get.to(() => const SearchPage());
                  },
                  child: Hero(
                    tag: "SearchBar",
                    child: Material(
                      borderRadius: BorderRadius.circular(16),
                      clipBehavior: Clip.antiAlias,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 32,
                              height: 32,
                              child: IconButton(
                                padding: const EdgeInsets.all(0),
                                icon: const Icon(
                                  Icons.search_rounded,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SearchPage(),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const Expanded(
                              child: Center(
                                child: SizedBox(
                                  height: 32,
                                  child: TextField(
                                    enabled: false,
                                    expands: true,
                                    minLines: null,
                                    maxLines: null,
                                    decoration: InputDecoration(
                                      hintText: "Search",
                                      border: InputBorder.none,
                                      disabledBorder: null,
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 6),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      //Drawer
      drawer: Padding(
        padding: const EdgeInsets.only(right: 160),
        child: Material(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text.rich(
              style: Theme.of(context).textTheme.bodyMedium,
              TextSpan(
                children: [
                  TextSpan(
                    text: "Movies App, prueba técnica para ",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  TextSpan(
                    text: "Imaginamos",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  TextSpan(
                    text: ".",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      //Body de la página
      body: Material(
        color: Theme.of(context).backgroundColor,
        child: SafeArea(
          child: Material(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            color: Get.theme.scaffoldBackgroundColor,
            clipBehavior: Clip.antiAlias,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                children: const [
                  CategoryCaroussel(
                    label: "trending",
                    requestApiPath: "/3/trending/movie/day",
                  ),
                  CategoryCounter(
                    label: "discover",
                    requestApiPath: "/3/discover/movie",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
