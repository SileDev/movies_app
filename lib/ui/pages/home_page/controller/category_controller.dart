import 'package:get/get.dart';
import 'package:movies_app/api/api_queries/get_movies_query.dart';

class CategoryController extends GetxController {
  //Booleano que nos permite saber si ya hay data
  final _hasData = false.obs;

  //List<String, dynamic>
  var finalData = [];

  //Get para estado de _hastada, retorna el valor
  get hasData => _hasData.value;

  //Obtener peliculas
  getCategoryMovies(String requestApiPath) async {
    //Se inicializa el estado de _hasdata en caso de que haya sido cambiado
    if (_hasData.isTrue) {
      _hasData(false);
    }

    //Instancia de la query GetMovies
    GetMoviesQuery getMoviesQuery = GetMoviesQuery();

    //Lista que contiene las respuestas de getMoviesQuery
    List<dynamic> responseData = await getMoviesQuery.get(requestApiPath);

    //Se procesan aldunos datos para facilitar su representación en la interfaz
    //y se almacenan en una nueva lista
    List<dynamic> processedData = getMoviesQuery.processData(responseData);

    //Se asigna la data procesada a FinalData
    finalData = processedData;

    //Se actualiza el valor de _hasData
    _hasData(true);
  }
}
