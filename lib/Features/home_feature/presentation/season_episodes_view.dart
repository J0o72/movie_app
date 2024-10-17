import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/season_episode_view_body.dart';

class SeasonEpisodeView extends StatelessWidget {
  const SeasonEpisodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SeasonEpisodeViewBody(),
    );
  }
}
