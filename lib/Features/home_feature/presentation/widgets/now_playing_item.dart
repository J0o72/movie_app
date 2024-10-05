import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/Features/home_feature/data/models/movie_model/movie_model.dart';
import 'package:movie_app/Features/home_feature/data/models/tv_shows_model/tv_shows_model.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_released_date.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_poster.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_rating.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/styles.dart';

class NowPlayingItem extends StatelessWidget {
  const NowPlayingItem({super.key, this.movieModel, this.tvShowsModel});
  final MovieModel? movieModel;
  final TvShowsModel? tvShowsModel;

  @override
  Widget build(BuildContext context) {
    return tvShowsModel == null
        ? Padding(
            padding: const EdgeInsets.only(right: 15),
            child: SizedBox(
              width: 177,
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kDetailsView);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomPoster(
                      isThereBookmark: true,
                      movieModel: movieModel!,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      movieModel!.originalTitle ?? "",
                      style: Styles.styleText18,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomRating(
                            movieModel: movieModel!,
                          ),
                          const Spacer(),
                          CustomReleasedDate(
                            movieModel: movieModel!,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(right: 15),
            child: SizedBox(
              width: 177,
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kDetailsView);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomPoster(
                      isThereBookmark: true,
                      tvShowsModel: tvShowsModel!,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      tvShowsModel!.name ?? "",
                      style: Styles.styleText18,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomRating(
                            tvShowsModel: tvShowsModel!,
                          ),
                          const Spacer(),
                          CustomReleasedDate(
                            tvShowsModel: tvShowsModel!,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
