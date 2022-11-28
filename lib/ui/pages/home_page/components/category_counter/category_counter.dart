import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/ui/pages/category_page/category_page.dart';
import 'package:movies_app/ui/pages/home_page/components/category_counter/elements/movie_counter_card.dart';
import 'package:movies_app/ui/pages/home_page/components/category_counter/elements/movie_counter_card_placeholder.dart';
import 'package:movies_app/ui/pages/home_page/controller/category_controller.dart';

class CategoryCounter extends StatefulWidget {
  final String label, requestApiPath;
  const CategoryCounter({
    super.key,
    required this.label,
    required this.requestApiPath,
  });

  @override
  State<CategoryCounter> createState() => _CategoryCounterState();
}

class _CategoryCounterState extends State<CategoryCounter> {
//Se crea una instancia del controller para cada CategoryCounter
  late final CategoryController categoryCounterController;

  @override
  void initState() {
    //Se registra e inicializa la instancia del controller
    categoryCounterController =
        Get.put(CategoryController(), tag: widget.label);

    //Se comienzan a obtener las películas
    categoryCounterController.getCategoryMovies(widget.requestApiPath);
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
                      pageContent: Obx(
                        () =>
                            //Se evalua que el estado de hasData sea true
                            categoryCounterController.hasData
                                ?
                                //Si hay data se muestran los Widgets en la
                                //lista allMovies del controller
                                ListView(
                                    physics: const BouncingScrollPhysics(),
                                    padding: const EdgeInsets.all(8),
                                    children: getMovieCounterCardsFromData(
                                      categoryCounterController.finalData,
                                    ),
                                  )
                                :
                                //Si no hay data se retorna un Caroussel con 6 MovieCard que
                                //son una plantilla animada que simula un efecto de carga
                                ListView(
                                    physics: const BouncingScrollPhysics(),
                                    padding: const EdgeInsets.all(8),
                                    children: List.generate(
                                      3,
                                      ((index) => MovieCounterCardPlaceholder(
                                            tagHelper: "${widget.label} $index",
                                          )),
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
        //Preview

        Padding(
          padding: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
          child: //Se observa el estado
              Obx(
            () =>
                //Se evalua que el estado de hasData sea true
                categoryCounterController.hasData
                    ?
                    //Si hay data se muestran los Widgets en la
                    //lista allMovies del controller
                    Column(
                        children: getMovieCounterCardsFromData(
                          categoryCounterController.finalData,
                        ).sublist(0, 3),
                      )
                    :
                    //Si no hay data se retorna un Caroussel con 6 MovieCard que
                    //son una plantilla animada que simula un efecto de carga
                    Column(
                        children: List.generate(
                          3,
                          ((index) => MovieCounterCardPlaceholder(
                                tagHelper: "${widget.label} $index",
                              )),
                        ),
                      ),
          ),
        ),
      ],
    );
  }

  //Se construyen los widgets con los resultados
  List<Widget> getMovieCounterCardsFromData(
    List<dynamic> data,
  ) {
    List<Widget> movies = [];

    for (var movieData in data) {
      movies.add(
        MovieCounterCard(
          tagHelper: "${widget.label} ${movieData["title"]}",
          data: movieData,
        ),
      );
    }

    return movies;
  }
}
