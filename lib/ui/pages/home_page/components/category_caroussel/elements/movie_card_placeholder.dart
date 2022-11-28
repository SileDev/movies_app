import 'package:flutter/material.dart';

class MovieCardPlaceholder extends StatelessWidget {
  final String tagHelper;
  final bool? fitSpace;
  final int? fractionCount;
  const MovieCardPlaceholder({
    super.key,
    required this.tagHelper,
    this.fitSpace,
    this.fractionCount,
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
      child: Hero(
        tag: tagHelper,
        //Cuerpo
        //No comentaré esto ya que todo son widgets Material decorativos
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Imagen
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: AspectRatio(
                    aspectRatio: 3 / 4,
                    child: Material(
                      borderRadius: BorderRadius.circular(8),
                      clipBehavior: Clip.antiAlias,
                      //child: , //AnimatedContainer
                    ),
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Material(
                  borderRadius: BorderRadius.circular(9),
                  child: const SizedBox(
                    width: 108,
                    height: 18,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Material(
                    borderRadius: BorderRadius.circular(9),
                    child: const SizedBox(
                      width: 100,
                      height: 18,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
