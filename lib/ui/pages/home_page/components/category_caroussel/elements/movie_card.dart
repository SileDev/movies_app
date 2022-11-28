import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/ui/global/rating_bar.dart';
import 'package:movies_app/ui/pages/movie_page/movie_page.dart';

class MovieCard extends StatelessWidget {
  final String tagHelper;
  final double? customHeight;
  final bool? fitSpace;
  final int? fractionCount;
  final Map<String, dynamic> data;
  const MovieCard({
    super.key,
    required this.tagHelper,
    this.customHeight,
    this.fitSpace,
    this.fractionCount,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: fitSpace == null ? 131 : null,
      height: fitSpace != null
          ? (MediaQuery.of(context).size.width / fractionCount! - 24) / 0.75 +
              46
          : null,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: () {
          //Se navega a movie page
          Get.to(
            () => MoviePage(
              tagHelper: "$tagHelper cover",
              data: data,
            ),
          );
        },
        //Cuerpo
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Imagen
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Hero(
                    tag: "$tagHelper cover",
                    child: AspectRatio(
                      aspectRatio: 3 / 4,
                      child: Material(
                        borderRadius: BorderRadius.circular(8),
                        clipBehavior: Clip.antiAlias,
                        child: Image.network(
                          "https://image.tmdb.org/t/p/w500/${data["poster_path"]}",
                          /*loadingBuilder: (context, child, loadingProgress) =>
                              const Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorBuilder: (context, error, stackTrace) =>
                              const Center(
                            child: Icon(
                              Icons.error_outline_rounded,
                            ),
                          ),*/
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //Información
            //La animación de este Hero falla debido a la transformación
            //que hace la animación de transición pero no representa ningún
            //problema real
            Hero(
              tag: "$tagHelper title",
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data["title"],
                    style: Theme.of(context).textTheme.labelLarge,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  //Barra de puntuación
                  RatingBar(
                    punctuation: data["vote_average"],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
