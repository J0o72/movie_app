import 'package:flutter/material.dart';
import 'package:movie_app/Features/categories_feature/presentation/views/widgets/categories_grid_view.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CategoriesGridView(),
    );
  }
}
