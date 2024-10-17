import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/season_episodes_custom_image.dart';

class SeasonEpisodesGridView extends StatelessWidget {
  const SeasonEpisodesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1.3 / 2,
        ),
        itemCount: 5,
        itemBuilder: (context, index) {
          return const SeasonEpisodeCustomImage();
        },
      ),
    );
  }
}
