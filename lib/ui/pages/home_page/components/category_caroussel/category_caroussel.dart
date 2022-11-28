import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:movies_app/ui/pages/category_page/category_page.dart';
import 'package:movies_app/ui/pages/home_page/components/category_caroussel/elements/movie_card.dart';
import 'package:movies_app/ui/pages/home_page/controller/category_controller.dart';
import 'package:movies_app/ui/pages/home_page/components/category_caroussel/elements/caroussel.dart';
import 'package:movies_app/ui/pages/home_page/components/category_caroussel/elements/movie_card_placeholder.dart';

class CategoryCaroussel extends StatefulWidget {
  final String label, requestApiPath;
  const CategoryCaroussel({
    super.key,
    required this.label,
    required this.requestApiPath,
  });

  @override
  State<CategoryCaroussel> createState() => _CategoryCarousselState();
}

class _CategoryCarousselState extends State<CategoryCaroussel> {
  //Se crea una instancia del controller para cada CategoryCaroussel
  late final CategoryController categoryCarousselController;

  @override
  void initState() {
    //Se registra e inicializa la instancia del controller
    categoryCarousselController =
        Get.put(CategoryController(), tag: widget.label);

    //Se comienzan a obtener las películas
    categoryCarousselController.getCategoryMovies(widget.requestApiPath);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Barra del título
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              //Nombre de la categoría
              Expanded(
                child: Hero(
                  tag: widget.label,
                  child: Text(
                    widget.label.toUpperCase(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              //Botón See all
              TextButton(
                onPressed: () {
                  //Se navega a category page
                  Get.to(
                    () => CategoryPage(
                      categoryName: widget.label,
                      pageContent: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 16,
                        ),
                        child:
                            //Se observa el estado
                            Obx(
                          () =>
                              //Se evalua que el estado de hasData sea true
                              categoryCarousselController.hasData
                                  ?
                                  //Si hay data se muestran los Widgets en la
                                  //lista allMovies del controller
                                  StaggeredGrid.count(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 16,
                                      children:
                                          getMovieCardsForGridViewFromData(
                                        categoryCarousselController.finalData,
                                      ),
                                    )
                                  :
                                  //Si no hay data se retorna un Caroussel con 6 MovieCard que
                                  //son una plantilla animada que simula un efecto de carga
                                  StaggeredGrid.count(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 16,
                                      children: List<Widget>.generate(
                                        6,
                                        ((index) => MovieCardPlaceholder(
                                              tagHelper:
                                                  "${widget.label} $index",
                                              fitSpace: true,
                                              fractionCount: 2,
                                            )),
                                      ),
                                    ),
                        ),
                      ),
                    ),
                  );
                },
                child: const Text(
                  "See all",
                ),
              ),
            ],
          ),
        ),
        //Carrusel
        SizedBox(
          height: 225,
          child: Obx(
            //Se observa el estado
            () =>
                //Se evalua que el estado de hasData sea true
                categoryCarousselController.hasData
                    ?
                    //Si hay data se retorna un Caroussel con los widgets en la
                    //lista partialMovies del controller
                    Caroussel(
                        movies: getMovieCardsFromData(
                          categoryCarousselController.finalData,
                        ),
                      )
                    :
                    //Si no hay data se retorna un Caroussel con 6 MovieCard que
                    //son una plantilla animada que simula un efecto de carga
                    Caroussel(
                        movies: List<Widget>.generate(
                          6,
                          ((index) => MovieCardPlaceholder(
                                tagHelper: "${widget.label} $index",
                              )),
                        ),
                      ),
          ),
        ),
      ],
    );
  }

  //Obtener MovieCards para Gridview
  List<Widget> getMovieCardsForGridViewFromData(
    List<dynamic> data,
  ) {
    //Lista que almacenará los MovieCard con su correspondiente data
    List<MovieCard> movies = [];

    //Se recorre la data para generar las MovieCards
    for (var movieData in data) {
      //Se agrega la MovieCard generada a la lista movies
      movies.add(
        MovieCard(
          fitSpace: true,
          fractionCount: 2,
          tagHelper: "${widget.label} ${movieData["title"]}",
          data: movieData,
        ),
      );
    }

    //Se retorna la lista movies
    return movies;
  }

  //Obtener MovieCards para carrusel de preview
  List<Widget> getMovieCardsFromData(
    List<dynamic> data,
  ) {
    //Lista que almacenará los MovieCard con su correspondiente data
    List<MovieCard> movies = [];

    //Se recorren las 6 primeras datas para generar las MovieCards
    for (var movieData in data.sublist(0, 6)) {
      //Se agrega la MovieCard generada a la lista movies
      movies.add(
        MovieCard(
          tagHelper: "${widget.label} ${movieData["title"]}",
          data: movieData,
        ),
      );
    }

    //Se retorna la lista movies
    return movies;
  }
}
