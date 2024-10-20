import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/Features/categories_feature/data/models/category_item.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/collection_model.dart';
import 'package:movie_app/core/utils/styles.dart';

class CategoriesGridViewItem extends StatelessWidget {
  const CategoriesGridViewItem({
    super.key,
    required this.categoryItem,
    required this.categoryColor,
  });

  final CategoryItem categoryItem;
  final Color categoryColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        CollectionModel collectionModel = CollectionModel(
            collectionName: categoryItem.name!,
            collectionTitle: categoryItem.name!,
            id: categoryItem.searchKey);
        GoRouter.of(context)
            .push(AppRouter.kMovieCollevionView, extra: collectionModel);
      },
      child: Container(
        width: 200,
        height: 200,
        decoration: categoryItem.image == null
            ? BoxDecoration(
                color: categoryColor,
                borderRadius: BorderRadius.circular(16),
              )
            : BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: NetworkImage(categoryItem.image!),
                  fit: BoxFit.contain,
                )),
        child: Center(
          child: categoryItem.image == null
              ? Text(
                  textAlign: TextAlign.center,
                  categoryItem.name!,
                  style: Styles.styleText28,
                )
              : Container(),
        ),
      ),
    );
  }
}
