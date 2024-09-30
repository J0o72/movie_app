import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/genre_item_home.dart';

class GenresHomeListView extends StatelessWidget {
  const GenresHomeListView({super.key});

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
            return const GenreItemHome();
          },
        ),
      ),
    );
  }
}
