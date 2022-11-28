import 'package:flutter/material.dart';

class MovieSearchResultPlaceholder extends StatelessWidget {
  const MovieSearchResultPlaceholder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          //Imagen
          AspectRatio(
            aspectRatio: 3 / 4,
            child: Material(
              borderRadius: BorderRadius.circular(8),
              clipBehavior: Clip.antiAlias,
            ),
          ),
          //Información
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 64, bottom: 2),
                    child: Material(
                      borderRadius: BorderRadius.circular(9),
                      child: const SizedBox(
                        width: double.infinity,
                        height: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Material(
                      borderRadius: BorderRadius.circular(9),
                      child: const SizedBox(
                        width: 100,
                        height: 18,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 2,
                              right: 16,
                              bottom: 2,
                            ),
                            child: Material(
                              borderRadius: BorderRadius.circular(9),
                              child: const SizedBox(
                                width: double.infinity,
                                height: 18,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 2,
                              right: 32,
                              bottom: 2,
                            ),
                            child: Material(
                              borderRadius: BorderRadius.circular(9),
                              child: const SizedBox(
                                width: double.infinity,
                                height: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Material(
                      borderRadius: BorderRadius.circular(9),
                      child: const SizedBox(
                        width: 58,
                        height: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
