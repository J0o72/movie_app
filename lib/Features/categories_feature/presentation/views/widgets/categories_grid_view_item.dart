import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/styles.dart';

class CategoriesGridViewItem extends StatelessWidget {
  const CategoriesGridViewItem(
      {super.key, required this.categoryName, required this.categoryColor});

  final String categoryName;
  final Color categoryColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // CollectionModel collectionModel = CollectionModel(
        //     collectionName: fromWhere,
        //     collectionTitle: genre.name!,
        //     id: genre.id.toString());
        // GoRouter.of(context)
        //     .push(AppRouter.kMovieCollevionView, extra: collectionModel);
      },
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: categoryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            textAlign: TextAlign.center,
            categoryName,
            style: Styles.styleText28,
          ),
        ),
      ),
    );
  }
}
