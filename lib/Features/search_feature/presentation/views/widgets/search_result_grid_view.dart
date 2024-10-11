import 'package:flutter/material.dart';
import 'package:movie_app/Features/search_feature/presentation/views/widgets/custom_search_image.dart';

class SearchResultGridView extends StatelessWidget {
  const SearchResultGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.5 / 2,
      ),
      itemCount: 30,
      itemBuilder: (context, index) {
        return const CustomSearchImage();
      },
    );
  }
}
