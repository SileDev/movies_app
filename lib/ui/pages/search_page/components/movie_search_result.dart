import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/ui/global/rating_bar.dart';
import 'package:movies_app/ui/pages/movie_page/movie_page.dart';

class MovieSearchResult extends StatelessWidget {
  final String tagHelper;
  final Map<String, dynamic> data;
  const MovieSearchResult({
    super.key,
    required this.tagHelper,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () {
          Get.to(
            () => MoviePage(
              tagHelper: "$tagHelper cover",
              data: data,
            ),
          );
        },
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
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Text(
                      data["release_date"],
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .color!
                                .withOpacity(0.75),
                          ),
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
}
