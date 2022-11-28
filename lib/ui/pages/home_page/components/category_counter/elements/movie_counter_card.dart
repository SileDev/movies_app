import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/ui/global/rating_bar.dart';
import 'package:movies_app/ui/pages/movie_page/components/production_data_line.dart';
import 'package:movies_app/ui/pages/movie_page/movie_page.dart';

class MovieCounterCard extends StatelessWidget {
  final String tagHelper;
  final Map<String, dynamic> data;
  const MovieCounterCard({
    super.key,
    required this.tagHelper,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 153 + 16,
      padding: const EdgeInsets.all(8),
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
        child: Row(
          children: [
            //Imagen
            Hero(
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
                    errorBuilder: (context, error, stackTrace) => const Center(
                      child: Icon(
                        Icons.error_outline_rounded,
                      ),
                    ),*/
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            //Información
            Expanded(
              child: Hero(
                tag: "$tagHelper info",
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data["title"],
                        style: Theme.of(context).textTheme.labelLarge,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      RatingBar(
                        punctuation: data["vote_average"],
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            data["overview"],
                            style: Theme.of(context).textTheme.bodyMedium,
                            textAlign: TextAlign.left,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      ProductionDataLine(
                        contain: true,
                        label: "Studio",
                        content: data["production_companies"],
                      ),
                      ProductionDataLine(
                        contain: true,
                        label: "Genre",
                        content: data["genres"],
                      ),
                      ProductionDataLine(
                        contain: true,
                        label: "Release",
                        content: data["release_date"],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
