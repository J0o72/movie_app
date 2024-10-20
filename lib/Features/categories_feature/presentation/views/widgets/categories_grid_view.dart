import 'package:flutter/material.dart';
import 'package:movie_app/Features/categories_feature/presentation/views/widgets/categories_grid_view_item.dart';
import 'package:movie_app/constants.dart';

class CategoriesGridView extends StatelessWidget {
  const CategoriesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemCount: categoryItem.length,
        itemBuilder: (context, index) {
          return CategoriesGridViewItem(
            categoryItem: categoryItem[index],
            categoryColor: genreColor[index],
          );
        },
      ),
    );
  }
}
