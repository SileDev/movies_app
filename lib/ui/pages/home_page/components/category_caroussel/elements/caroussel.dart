import 'package:flutter/material.dart';

class Caroussel extends StatelessWidget {
  final List<Widget> movies;
  const Caroussel({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(
        top: 8,
        right: 8,
        bottom: 16,
        left: 8,
      ),
      children: movies,
    );
  }
}
