import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RatingBar extends StatefulWidget {
  final double punctuation;
  const RatingBar({super.key, required this.punctuation});

  @override
  State<RatingBar> createState() => _RatingBarState();
}

class _RatingBarState extends State<RatingBar> {
  //Lista de widgets
  List<Widget> evaluationWidgets = [];

  //Evaluar puntuación y
  evaluatePunctuation(double evaluatedPunctuation) {
    //Se evalúa que exista una calificación, en principio se deduce que si no hay
    //ninguna la Api entrega un valor de 0

    if (evaluatedPunctuation != 0.0) {
      //Color de las estrellas
      Color starsColor = const Color(0xfffcd307);

      //Cantidad de estrellas evaluadas y agregadas
      int evaluatedStars = 0;

      //Agregar 1 estrella por cada unidad de puntuación completa
      for (int i = 0; i < evaluatedPunctuation.toInt(); i++) {
        //Se agrega la estrella a stars[]
        evaluationWidgets.add(
          Icon(
            Icons.star_rate_rounded,
            size: 20,
            color: starsColor,
          ),
        );
        //Se actualiza la cantidad de estrellas evaluadas
        evaluatedStars = i + 1;
      }

      //Se evalúa si hay puntuación pendiente de representar con estrellas
      if (evaluatedPunctuation > evaluatedStars) {
        //Se agrega una estrella que representa valor restante no evaluado, esta
        //representación se hace mediante la opacidad de su color
        evaluationWidgets.add(
          Icon(
            Icons.star_rate_rounded,
            size: 20,
            //El valor en cuestión se puede tomar como porcentaje para la opacidad
            //del color de la estrella
            color:
                starsColor.withOpacity(evaluatedPunctuation - evaluatedStars),
          ),
        );
      }
    } else {
      //Dado que no existe calificación, se agregará un texto informativo
      evaluationWidgets.add(
        //El widget SizedBox es necesario para no alterar el diseño de MovieCard
        //El widget Expanded es necesario para que el texto no genere conflicto al estar dentro de una fila
        SizedBox(
          height: 20,
          child: Text(
            "Unrated",
            style: Get.theme.textTheme.bodyMedium!.copyWith(
              color: const Color(0xfffcd307).withOpacity(0.5),
            ),
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    evaluatePunctuation(widget.punctuation / 2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: evaluationWidgets,
    );
  }
}
