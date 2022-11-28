import 'dart:convert';

import 'package:movies_app/api/api_queries/get_movie_data_query.dart';
import 'package:movies_app/api/movies_api.dart';
import 'package:http/http.dart' as http;

class GetMoviesQuery extends MoviesApi {
  //Get de data de peliculas
  Future<List> get(String requestApiPath //Path especifico para la solicitud
      ) async {
    //Body con los parámetros requeridos para la consulta
    final Map<String, dynamic> body = {
      "api_key": apiKey,
    };

    //Uri con el esquema de la solicitud
    final Uri apiPath = Uri(
      scheme: apiScheme,
      host: apiHost,
      path: requestApiPath,
      queryParameters: body,
    );

    //Solicitud tipo Get
    final List<String> getResponse = await http.get(
      apiPath,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    ).then((response) async {
      //Se procede a obtener la data de las peliculas

      //Lista que almacena la data de las peliculas a obtener
      List<String> moviesData = [];

      //Instancia de la query GetMovie
      GetMovieDataQuery getMovieDataQuery = GetMovieDataQuery();

      //Se recorre el listado de peliculas obtenido
      for (var movie in jsonDecode(response.body)["results"]) {
        //Se obtiene la data de cada pelicula en el response mediante su id
        //que es tipo int
        String fetchedMovie = await getMovieDataQuery.get(movie["id"]);
        //Evaluamos que el resultado almacenado en fetchedMovie sea distinto a
        //"error response", que es una respuesta de error general
        if (fetchedMovie != "error response") {
          //Dado que es una respuesta válida se agrega a MoviesData
          moviesData.add(fetchedMovie);
        }
      }

      //Una vez se han obtenido todos los datos de las peliculas se retorna
      //la lista con las data
      return moviesData;
    });

    //Se retorna la respuesta del get codificada como json
    return jsonDecode(getResponse.toString()); //jsonDecode() requiere String
  }
}
