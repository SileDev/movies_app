import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/ui/pages/search_page/components/movie_search_result.dart';
import 'package:movies_app/ui/pages/search_page/components/movie_search_result_placeholder.dart';
import 'package:movies_app/ui/pages/search_page/controller/search_controller.dart';

//Esta pagina quedó incompleta y falla algunas veces

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  //Se crea una instancia del controller para busqueda
  late final SearchController searchController;

  //Boolean que servirá para manejar el estado del contenido
  bool isSearching = false;

  @override
  void initState() {
    //Se registra e inicializa la instancia del controller
    searchController = Get.put(SearchController(), tag: "search");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //SafeArea pare evitad errores de constrains ya que habrá un teclado en pantalla
      body: SafeArea(
        //Cuerpo
        child: Column(
          children: [
            //"AppBar"
            Container(
              height: 56,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              //Barra de busqueda
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
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.close_rounded,
                            ),
                            padding: const EdgeInsets.all(0),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: SizedBox(
                              height: 24,
                              child: TextField(
                                autofocus: true,
                                maxLines: 1,
                                decoration: const InputDecoration(
                                  hintText: "Search",
                                  border: InputBorder.none,
                                  disabledBorder: null,
                                ),
                                onChanged: (value) {
                                  //Se evalua que el valor de busqueda no esté vacio
                                  if (value.isNotEmpty) {
                                    //
                                    searchController.discardSearch();

                                    //
                                    if (!isSearching) {
                                      //
                                      setState(
                                        () {
                                          isSearching = true;
                                        },
                                      );
                                    }

                                    //
                                    searchController.getSearchResults(value);
                                  } else {
                                    //
                                    setState(() {
                                      isSearching = false;
                                    });
                                  }
                                },
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
            //Resultados
            Expanded(
              //Se observa
              child: Obx(
                () =>
                    //Se evalua si se realiza busqueda y hay datos de respuesta
                    searchController.hasData && isSearching
                        ?
                        //Si se realiza busqueda y hay datos de respuesta se muestran
                        //los resultados
                        ListView(
                            padding: const EdgeInsets.all(8),
                            children: getSearchResultsCardsFromData(
                              searchController.finalData,
                            ),
                          )
                        :
                        //Si unicamente se está buscando se muestran los holders
                        isSearching
                            ?
                            //Los widgets de contenido se generan automaticamente
                            ListView(
                                padding: const EdgeInsets.all(8),
                                children: List.generate(
                                  6,
                                  (index) =>
                                      const MovieSearchResultPlaceholder(),
                                ),
                              )
                            :
                            //Si no se realiza busqueda ni hay datos se muestra un mensaje
                            Column(
                                children: [
                                  Text(
                                    "Type something to search...",
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                ],
                              ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Se construyen los widgets con los resultados
  List<Widget> getSearchResultsCardsFromData(
    List<dynamic> data,
  ) {
    List<Widget> movies = [];

    for (var movieData in data) {
      movies.add(
        MovieSearchResult(
          tagHelper: "search result ${movieData["title"]}",
          data: movieData,
        ),
      );
    }

    return movies;
  }
}
