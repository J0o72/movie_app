import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/Features/home_feature/data/models/actor_model/actor_known_for.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/details_view_navigator_model.dart';
import 'package:movie_app/Features/home_feature/data/models/movie_model/movie_model.dart';
import 'package:movie_app/Features/home_feature/data/models/tv_shows_model/tv_shows_model.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/save_to_fav_cubit/save_to_fav_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_released_date.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_poster.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_rating.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/styles.dart';

class NowPlayingItem extends StatelessWidget {
  const NowPlayingItem(
      {super.key, this.movieModel, this.tvShowsModel, this.actorCredits});
  final MovieModel? movieModel;
  final TvShowsModel? tvShowsModel;
  final ActorKnownFor? actorCredits;

  @override
  Widget build(BuildContext context) {
    return movieModel != null
        ? Padding(
            padding: const EdgeInsets.only(right: 15),
            child: SizedBox(
              width: 177,
              child: GestureDetector(
                onTap: () {
                  DetailsViewNavigatorModel detailsViewNavigatorModel =
                      DetailsViewNavigatorModel(
                          fromWhere: 'movie', id: movieModel!.id!);
                  GoRouter.of(context).push(AppRouter.kDetailsView,
                      extra: detailsViewNavigatorModel);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomPoster(
                      isThereBookmark: true,
                      movieModel: movieModel!,
                      onPressed: () {
                        print(movieModel!.id);
                        // Map<String, dynamic> body = {
                        //   'media_id': movieModel!.id,
                        //   'media_type': 'movie',
                        //   'favorite': true,
                        // };
                        // BlocProvider.of<SaveToFavCubit>(context)
                        //     .saveToFav(body: body);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      movieModel!.title ?? "",
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
        : tvShowsModel != null
            ? Padding(
                padding: const EdgeInsets.only(right: 15),
                child: SizedBox(
                  width: 177,
                  child: GestureDetector(
                    onTap: () {
                      DetailsViewNavigatorModel detailsViewNavigatorModel =
                          DetailsViewNavigatorModel(
                              fromWhere: 'tv', id: tvShowsModel!.id!);
                      GoRouter.of(context).push(AppRouter.kDetailsView,
                          extra: detailsViewNavigatorModel);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomPoster(
                          isThereBookmark: true,
                          tvShowsModel: tvShowsModel!,
                          onPressed: () {
                            print(tvShowsModel!.id);
                            // Map<String, dynamic> body = {
                            //   'media_id': tvShowsModel!.id,
                            //   'media_type': 'tv',
                            //   'favorite': true,
                            // };
                            // BlocProvider.of<SaveToFavCubit>(context)
                            //     .saveToFav(body: body);
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          tvShowsModel!.name!,
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
              )
            : Padding(
                padding: const EdgeInsets.only(right: 15),
                child: SizedBox(
                  width: 177,
                  child: GestureDetector(
                    onTap: () {
                      DetailsViewNavigatorModel detailsViewNavigatorModel =
                          DetailsViewNavigatorModel(
                              fromWhere: actorCredits!.mediaType!,
                              id: actorCredits!.id!);
                      GoRouter.of(context).push(AppRouter.kDetailsView,
                          extra: detailsViewNavigatorModel);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomPoster(
                          isThereBookmark: true,
                          actorCredits: actorCredits!,
                          onPressed: () {
                            print(actorCredits!.id);
                            // Map<String, dynamic> body = {
                            //   'media_id': actorCredits!.id,
                            //   'media_type': actorCredits!.mediaType,
                            //   'favorite': true,
                            // };
                            // BlocProvider.of<SaveToFavCubit>(context)
                            //     .saveToFav(body: body);
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        actorCredits!.mediaType == 'movie'
                            ? Text(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                actorCredits!.originalTitle!,
                                style: Styles.styleText18,
                              )
                            : Text(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                actorCredits!.name!,
                                style: Styles.styleText18,
                              ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomRating(
                                actorCredits: actorCredits!,
                              ),
                              const Spacer(),
                              CustomReleasedDate(
                                actorCredits: actorCredits!,
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
