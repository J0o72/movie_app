import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/tv_shows_details/season.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_circular_loading.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/seasons_title.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/styles.dart';

class SeasonsCutomImage extends StatelessWidget {
  const SeasonsCutomImage({
    super.key,
    required this.seasonModel,
  });

  final SeasonModel seasonModel;
  final String image = "https://image.tmdb.org/t/p/original";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kSeasonEpisodesView);
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
                  imageUrl: '$image' '${seasonModel.posterPath}',
                  errorWidget: (context, url, error) => Center(
                    child: Text(
                      "${seasonModel.name}",
                      style: Styles.styleText18.copyWith(color: Colors.white),
                    ),
                  ),
                  placeholder: (context, url) => const Center(
                    child: CustomCircularLoading(),
                  ),
                ),
              ),
            ),
          ),
          SeasonsTitle(
            seasonNumber: '${seasonModel.name}',
          ),
        ],
      ),
    );
  }
}
