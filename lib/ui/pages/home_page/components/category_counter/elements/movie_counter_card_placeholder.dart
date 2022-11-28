import 'package:flutter/material.dart';

class MovieCounterCardPlaceholder extends StatelessWidget {
  final String tagHelper;
  const MovieCounterCardPlaceholder({
    super.key,
    required this.tagHelper,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 153 + 16,
      padding: const EdgeInsets.all(8),
      child: Hero(
        tag: tagHelper,
        //Cuerpo
        //No comentaré esto ya que todo son widgets Material decorativos
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 3 / 4,
              child: Material(
                borderRadius: BorderRadius.circular(8),
                clipBehavior: Clip.antiAlias,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 32, bottom: 2),
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
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2),
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
                                  width: double.infinity,
                                  height: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 56,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 2, right: 12),
                            child: Material(
                              borderRadius: BorderRadius.circular(9),
                              child: const SizedBox(
                                width: double.infinity,
                                height: 18,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 2, right: 16),
                            child: Material(
                              borderRadius: BorderRadius.circular(9),
                              child: const SizedBox(
                                width: double.infinity,
                                height: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 56,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 2, right: 8),
                            child: Material(
                              borderRadius: BorderRadius.circular(9),
                              child: const SizedBox(
                                width: double.infinity,
                                height: 18,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 2, right: 32),
                            child: Material(
                              borderRadius: BorderRadius.circular(9),
                              child: const SizedBox(
                                width: double.infinity,
                                height: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 56,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 2, right: 16),
                            child: Material(
                              borderRadius: BorderRadius.circular(9),
                              child: const SizedBox(
                                width: double.infinity,
                                height: 18,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 2, right: 24),
                            child: Material(
                              borderRadius: BorderRadius.circular(9),
                              child: const SizedBox(
                                width: double.infinity,
                                height: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
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
