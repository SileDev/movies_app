//Api de la app
class MoviesApi {

  //Datos globales persistentes de la Api
  final String

      //Esquema de la Api
      apiScheme = "https",

      //Ruta de la Api
      apiHost = "api.themoviedb.org",

      //Key de la Api
      apiKey = "e279916a26ccb85f9d21ce726b549f9d";

  //-------------------------------------------------------------------------
  //---------------------  Metodos de utilidad general  ---------------------
  //-------------------------------------------------------------------------

  //Procesar la data que se requerirá para los widgets
  List<dynamic> processData(
    List<dynamic> obtainedData,
  ) {
    //Lista que almacenará el resultado final
    List<dynamic> newList = [];
    for (var movieData in obtainedData) {
      //Se extraen los datos de producción y se reemplazan por un string sencillo
      movieData["production_companies"] =
          extractValues(movieData["production_companies"], "name");
      movieData["genres"] = extractValues(movieData["genres"], "name");

      //Se filtra la fecha para obtener el año
      movieData["release_date"] =
          "${movieData["release_date"].toString().split("-").first}.";

      //Se agrega la data procesada a newList
      newList.add(movieData);
    }

    //Se retorna la lista con la data procesada
    return newList;
  }

  //Extraer los datos requeridos de un array a un String con formato
  String extractValues(
    var valuesArray,
    String valueName,
  ) {
    //String que lmacenará el resultado final
    String extractedValues = "";

    //Se recorre el array
    for (var value in valuesArray) {
      extractedValues += "${value[valueName]}, ";
    }

    //Se valida que
    if (extractedValues.isNotEmpty) {
      //
      extractedValues =
          "${extractedValues.substring(0, extractedValues.length - 2)}.";
    } else {
      extractedValues = "<<unknown>>";
    }

    //Se retorna el String con el resultado
    return extractedValues;
  }
}
