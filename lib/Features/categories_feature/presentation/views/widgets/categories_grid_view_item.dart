import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/styles.dart';

class CategoriesGridViewItem extends StatelessWidget {
  const CategoriesGridViewItem(
      {super.key,
      required this.categoryName,
      required this.categoryColor,
      required this.categoryImage});

  final String categoryName;
  final Color categoryColor;
  final String categoryImage;

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
        decoration: categoryImage == ''
            ? BoxDecoration(
                color: categoryColor,
                borderRadius: BorderRadius.circular(16),
              )
            : BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: NetworkImage(categoryImage),
                  fit: BoxFit.contain,
                )),
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
