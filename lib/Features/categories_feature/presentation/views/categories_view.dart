import 'package:flutter/material.dart';
import 'package:movie_app/Features/categories_feature/presentation/views/widgets/categories_view_body.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: CategoriesViewBody());
  }
}
