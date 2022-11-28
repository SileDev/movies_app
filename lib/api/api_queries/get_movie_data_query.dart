import 'package:movies_app/api/movies_api.dart';
import 'package:http/http.dart' as http;

class GetMovieDataQuery extends MoviesApi {
  //Get de data de una pelicula
  get(
    final int movieId,
  ) async {
    //Path especifico para la solicitud
    String requestApiPath = "/3/movie/";

    //Body con los parámetros requeridos para la consulta
    final Map<String, dynamic> body = {
      "api_key": apiKey,
    };

    //Uri con el esquema de la solicitud que contiene el id de la pelicula
    //que se requiere obtener la data
    final Uri apiPath = Uri(
      scheme: apiScheme,
      host: apiHost,
      path: "$requestApiPath$movieId",
      queryParameters: body,
    );

    //Solicitud tipo Get
    final dynamic getResponse = await http.get(
      apiPath,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    ).then((response) {
      //Evaluamos que se obtenga un response con statusCode válido, en este
      //caso esperamos el statusCode 200 "Ok response"
      if (response.statusCode == 200) {
        //Una vez que se obtienen los datos de la pelicula se retornan
        return response.body;
      } else {
        //Al obtener un statusCode distindo retornamos un error response general
        return "error response";
      }
    });

    //Retornamos la respuesta del get
    return getResponse;
  }
}
