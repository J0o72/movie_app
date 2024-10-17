import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/data/models/episode_model/episode_navigator.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/season_episode_view_body.dart';

class SeasonEpisodeView extends StatelessWidget {
  const SeasonEpisodeView({super.key, required this.episodeNavigatorHepler});

  final EpisodeNavigatorHepler episodeNavigatorHepler;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SeasonEpisodeViewBody(
        seasonId: episodeNavigatorHepler.seriesId,
        seasonNumber: episodeNavigatorHepler.seasonNumber,
      ),
    );
  }
}
