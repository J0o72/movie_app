import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/cubit/season_episode_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_circular_loading.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/season_episodes_custom_image.dart';
import 'package:movie_app/core/widgets/custom_error_failure.dart';

class SeasonEpisodesGridView extends StatelessWidget {
  const SeasonEpisodesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeasonEpisodeCubit, SeasonEpisodeState>(
      builder: (context, state) {
        if (state is SeasonEpisodeSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.3 / 2,
              ),
              itemCount: state.episodes.length,
              itemBuilder: (context, index) {
                return SeasonEpisodeCustomImage(
                  episodeModel: state.episodes[index],
                );
              },
            ),
          );
        } else if (state is SeasonEpisodeFailure) {
          return const CustomErrorFailure();
        } else {
          return const CustomCircularLoading();
        }
      },
    );
  }
}
