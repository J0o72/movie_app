import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/Features/home_feature/data/models/actor_model/actor_known_for.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/details_view_navigator_model.dart';
import 'package:movie_app/Features/home_feature/data/models/favorite_model/favorite_model/fav_result.dart';
import 'package:movie_app/Features/home_feature/data/models/movie_model/movie_model.dart';
import 'package:movie_app/Features/home_feature/data/models/tv_shows_model/tv_shows_model.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_circular_loading.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_poster.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/styles.dart';

class CutsomPosterSaved extends StatelessWidget {
  const CutsomPosterSaved(
      {super.key,
      this.movieModel,
      this.tvShowsModel,
      this.actorCredits,
      this.favItem});

  final String imageUrl = "https://image.tmdb.org/t/p/original";
  final MovieModel? movieModel;
  final TvShowsModel? tvShowsModel;
  final ActorKnownFor? actorCredits;
  final FavoriteResults? favItem;

  @override
  Widget build(BuildContext context) {
    return movieModel != null
        ? InkWell(
            onTap: () {
              DetailsViewNavigatorModel detailsViewNavigatorModel =
                  DetailsViewNavigatorModel(
                      fromWhere: 'movie', id: movieModel!.id!);
              GoRouter.of(context).push(AppRouter.kDetailsView,
                  extra: detailsViewNavigatorModel);
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
                      child: ImagePlaceholderSkeletonizer(
                        height: 180,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        : tvShowsModel != null
            ? InkWell(
                onTap: () {
                  DetailsViewNavigatorModel detailsViewNavigatorModel =
                      DetailsViewNavigatorModel(
                          fromWhere: 'tv', id: tvShowsModel!.id!);
                  GoRouter.of(context).push(AppRouter.kDetailsView,
                      extra: detailsViewNavigatorModel);
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
                            style: Styles.styleText18
                                .copyWith(color: Colors.white),
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
            : actorCredits != null
                ? InkWell(
                    onTap: () {
                      DetailsViewNavigatorModel detailsViewNavigatorModel =
                          DetailsViewNavigatorModel(
                              fromWhere: actorCredits!.mediaType!,
                              id: actorCredits!.id!);
                      GoRouter.of(context).push(AppRouter.kDetailsView,
                          extra: detailsViewNavigatorModel);
                    },
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: AspectRatio(
                          aspectRatio: 2.8 / 3.5,
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: actorCredits!.posterPath != null
                                ? '$imageUrl${actorCredits!.posterPath}'
                                : "",
                            errorWidget: (context, url, error) => Center(
                              child: Text(
                                textAlign: TextAlign.center,
                                "${actorCredits?.originalTitle}",
                                style: Styles.styleText18
                                    .copyWith(color: Colors.white),
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
                      if (favItem!.title != null) {
                        DetailsViewNavigatorModel detailsViewNavigatorModel =
                            DetailsViewNavigatorModel(
                                fromWhere: 'movie', id: favItem!.id!);
                        GoRouter.of(context).push(AppRouter.kDetailsView,
                            extra: detailsViewNavigatorModel);
                      } else {
                        DetailsViewNavigatorModel detailsViewNavigatorModel =
                            DetailsViewNavigatorModel(
                                fromWhere: 'tv', id: favItem!.id!);
                        GoRouter.of(context).push(AppRouter.kDetailsView,
                            extra: detailsViewNavigatorModel);
                      }
                    },
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: AspectRatio(
                          aspectRatio: 2.8 / 3.5,
                          child: CachedNetworkImage(
                            fit: BoxFit.fill,
                            imageUrl: favItem!.posterPath != null
                                ? '$imageUrl${favItem!.posterPath}'
                                : "",
                            errorWidget: (context, url, error) => Center(
                              child: Text(
                                textAlign: TextAlign.center,
                                "${favItem?.originalTitle}",
                                style: Styles.styleText18
                                    .copyWith(color: Colors.white),
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

class CollectionsImage extends StatelessWidget {
  const CollectionsImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
