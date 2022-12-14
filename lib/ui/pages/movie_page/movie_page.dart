import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/ui/global/rating_bar.dart';
import 'package:movies_app/ui/pages/movie_page/components/production_data_line.dart';

class MoviePage extends StatelessWidget {
  final String tagHelper;
  final Map<String, dynamic> data;
  const MoviePage({
    super.key,
    required this.tagHelper,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Imagen
          Hero(
            tag: tagHelper,
            child: AspectRatio(
              aspectRatio: 4 / 3,
              child: Material(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  children: [
                    Image.network(
                      "https://image.tmdb.org/t/p/w500/${data["poster_path"]}",
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    SafeArea(
                      child: SizedBox(
                        height: 72,
                        child: Row(
                          children: [
                            Material(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(36),
                                bottomRight: Radius.circular(36),
                              ),
                              color: Theme.of(context)
                                  .backgroundColor
                                  .withOpacity(0.8),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 16, right: 12, bottom: 16, left: 16),
                                child: IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: const Icon(
                                    Icons.close_rounded,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          //Barra
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        data["title"],
                        style: Get.theme.textTheme.titleLarge,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Icon(Icons.hd_rounded),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "watch now".toUpperCase(),
                        ),
                      ),
                      //Rating Bar
                      RatingBar(
                        punctuation: data["vote_average"],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //Contenido
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                //Sinopsis
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    data["overview"],
                    style: Get.theme.textTheme.bodyMedium,
                  ),
                ),
                //Producci??n
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      ProductionDataLine(
                        label: "Studio",
                        content: data["production_companies"],
                      ),
                      ProductionDataLine(
                        label: "Genre",
                        content: data["genres"],
                      ),
                      ProductionDataLine(
                        label: "Release",
                        content: data["release_date"],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
