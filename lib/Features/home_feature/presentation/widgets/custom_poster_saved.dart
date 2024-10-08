import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/Features/home_feature/data/models/movie_model/movie_model.dart';
import 'package:movie_app/Features/home_feature/data/models/tv_shows_model/tv_shows_model.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_circular_loading.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/styles.dart';

class CutsomPosterSaved extends StatelessWidget {
  const CutsomPosterSaved({super.key, this.movieModel, this.tvShowsModel});

  final String imageUrl = "https://image.tmdb.org/t/p/original";
  final MovieModel? movieModel;
  final TvShowsModel? tvShowsModel;

  @override
  Widget build(BuildContext context) {
    return tvShowsModel == null
        ? InkWell(
            onTap: () {
              GoRouter.of(context).push(AppRouter.kDetailsView);
            },
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: AspectRatio(
                  aspectRatio: 2.8 / 3.5,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: movieModel!.posterPath != null
                        ? '$imageUrl${movieModel!.posterPath}'
                        : "",
                    errorWidget: (context, url, error) => Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        "${movieModel?.title}",
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
          )
        : InkWell(
            onTap: () {
              GoRouter.of(context).push(AppRouter.kDetailsView);
            },
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: AspectRatio(
                  aspectRatio: 2.8 / 3.5,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: tvShowsModel!.posterPath != null
                        ? '$imageUrl${tvShowsModel!.posterPath}'
                        : "",
                    errorWidget: (context, url, error) => Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        "${tvShowsModel?.name}",
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
          );
  }
}
