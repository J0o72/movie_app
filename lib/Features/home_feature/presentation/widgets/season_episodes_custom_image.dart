import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/data/models/episode_model/episode_model.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_poster.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/season_episode_rating.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/season_episodes_image_title.dart';
import 'package:movie_app/core/utils/styles.dart';

class SeasonEpisodeCustomImage extends StatelessWidget {
  const SeasonEpisodeCustomImage({super.key, required this.episodeModel});

  final String image = "https://image.tmdb.org/t/p/original";
  final EpisodeModel episodeModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: AspectRatio(
              aspectRatio: 2.8 / 3.5,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: episodeModel.stillPath != null
                    ? '$image${episodeModel.stillPath}'
                    : '',
                errorWidget: (context, url, error) => Center(
                  child: Text(
                    "${episodeModel.name}",
                    style: Styles.styleText18.copyWith(color: Colors.white),
                  ),
                ),
                placeholder: (context, url) => const Center(
                  child: ImagePlaceholderSkeletonizer(
                    height: 180,
                  ),
                ),
              ),
            ),
          ),
        ),
        SeasonEpisodesImageTitle(
          episodeNumber: episodeModel.episodeNumber!,
        ),
        SeasonEpisodeRating(
          episodeModel: episodeModel,
        )
      ],
    );
  }
}
