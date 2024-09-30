import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/genre_item_genres.dart';

class GenreGirdViewGenres extends StatelessWidget {
  const GenreGirdViewGenres({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 32,
        horizontal: 18,
      ),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          return const GenreItemGenres();
        },
      ),
    );
  }
}
