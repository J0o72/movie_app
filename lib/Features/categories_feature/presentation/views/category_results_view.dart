import 'package:flutter/material.dart';
import 'package:movie_app/Features/categories_feature/presentation/views/widgets/category_results_view_body.dart';
import 'package:movie_app/core/utils/collection_model.dart';

class CategoryResultsView extends StatelessWidget {
  const CategoryResultsView({super.key, required this.collectionModel});

  final CollectionModel collectionModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CategoryResultsViewBody(
        collectionModel: collectionModel,
      ),
    );
  }
}
