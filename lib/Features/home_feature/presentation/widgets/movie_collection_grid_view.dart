import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_poster_saved.dart';

class MovieCollectionGridView extends StatelessWidget {
  const MovieCollectionGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1.3 / 2,
        ),
        itemCount: 15,
        itemBuilder: (context, index) {
          return const CutsomPosterSaved();
        },
      ),
    );
  }
}
