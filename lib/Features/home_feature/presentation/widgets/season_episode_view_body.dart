import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/data/repos/season_repo/season_repo_impl.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/cubit/season_episode_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/seasons_episodes_grid_view.dart';
import 'package:movie_app/core/utils/service_locator.dart';
import 'package:movie_app/core/utils/styles.dart';

class SeasonEpisodeViewBody extends StatelessWidget {
  const SeasonEpisodeViewBody(
      {super.key,
      this.seriesPoster,
      required this.seasonId,
      required this.seasonNumber});
  final num seasonId, seasonNumber;
  final String? seriesPoster;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SeasonEpisodeCubit(getIt.get<SeasonRepoImpl>())
        ..fetchSeasonEpisodes(seasonId: seasonId, seasonNumber: seasonNumber),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Season Episodes',
            style: Styles.styleText28.copyWith(color: Colors.red),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SeasonEpisodesGridView(
          seriesPoster: seriesPoster,
        ),
      ),
    );
  }
}
