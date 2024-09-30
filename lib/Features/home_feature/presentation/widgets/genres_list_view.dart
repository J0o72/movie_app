import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/genre_item.dart';

class GenresListView extends StatelessWidget {
  const GenresListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return const GenreItem();
          },
        ),
      ),
    );
  }
}
