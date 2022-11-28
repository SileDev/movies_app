import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryPage extends StatelessWidget {
  final String categoryName;
  final Widget pageContent;
  const CategoryPage({
    super.key,
    required this.categoryName,
    required this.pageContent,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.close_rounded,
                  ),
                ),
              ),
              Expanded(
                child: Hero(
                  tag: categoryName,
                  child: Text(
                    categoryName.toUpperCase(),
                    style: Get.theme.textTheme.titleMedium,
                  ),
                ),
              ),
            ],
          ),

          /**/
          Expanded(
            child: pageContent,
          ),
        ],
      ),
    );
  }
}
