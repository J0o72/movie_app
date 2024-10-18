import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/tv_shows_details/season.dart';
import 'package:movie_app/Features/home_feature/data/models/episode_model/episode_navigator.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_poster.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/season_custom_rating.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/seasons_title.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/styles.dart';

class SeasonsCutomImage extends StatelessWidget {
  const SeasonsCutomImage({
    super.key,
    required this.seasonModel,
    required this.seriesId,
  });

  final SeasonModel seasonModel;
  final String image = "https://image.tmdb.org/t/p/original";
  final num seriesId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        EpisodeNavigatorHepler episodeNavigatorHepler = EpisodeNavigatorHepler(
            seriesId: seriesId, seasonNumber: seasonModel.seasonNumber!);
        GoRouter.of(context)
            .push(AppRouter.kSeasonEpisodesView, extra: episodeNavigatorHepler);
      },
      child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: AspectRatio(
                aspectRatio: 2.8 / 3.5,
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: seasonModel.posterPath != null
                      ? '$image${seasonModel.posterPath}'
                      : '',
                  errorWidget: (context, url, error) => Center(
                    child: Text(
                      "${seasonModel.name}",
                      style: Styles.styleText18.copyWith(color: Colors.white),
                    ),
                  ),
                  placeholder: (context, url) => const Center(
                    child: ImagePlaceholderSkeletonizer(
                      height: 250,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SeasonsTitle(
            seasonNumber: '${seasonModel.name}',
          ),
          SeasonCutsomRating(seasonModel: seasonModel),
        ],
      ),
    );
  }
}
