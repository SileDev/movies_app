import 'package:get/get.dart';
import 'package:movies_app/api/api_queries/get_search_movie_data_query.dart';

class SearchController extends GetxController {
  //Booleano que nos permite saber si ya hay data
  final RxBool _hasData = false.obs;

  //List<String, dynamic>
  var finalData = [];

  //Get para estado de _hastada, retorna el valor
  get hasData => _hasData.value;

  //Obtener peliculas
  getSearchResults(
    String searchParameter,
  ) async {
    //Se inicializa el estado de _hasdata en caso de que haya sido cambiado
    if (_hasData.isTrue) {
      _hasData(false);
    }

    //Instancia de la query GetMovies
    GetSearchMovieDataQuery getSearchMovieDataQuery = GetSearchMovieDataQuery();

    //Lista que contiene las respuestas de getMoviesQuery
    List<dynamic> responseData =
        await getSearchMovieDataQuery.get(searchParameter);

    //Se procesan aldunos datos para facilitar su representación en la interfaz
    //y se almacenan en una nueva lista
    //List<dynamic>
    var processedData = getSearchMovieDataQuery.processData(responseData);

    //Se asigna la data procesada a FinalData
    finalData = processedData;

    //Se actualiza el valor de _hasData
    _hasData(true);
  }

  discardSearch() {
    _hasData(false);
    finalData.clear();
  }
}
