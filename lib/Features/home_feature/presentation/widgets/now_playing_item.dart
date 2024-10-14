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
import 'package:movie_app/constants.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/shared_preference.dart';
import 'package:movie_app/core/utils/styles.dart';

class NowPlayingItem extends StatefulWidget {
  const NowPlayingItem(
      {super.key, this.movieModel, this.tvShowsModel, this.actorCredits});
  final MovieModel? movieModel;
  final TvShowsModel? tvShowsModel;
  final ActorKnownFor? actorCredits;

  @override
  State<NowPlayingItem> createState() => _NowPlayingItemState();
}

class _NowPlayingItemState extends State<NowPlayingItem> {
  @override
  Widget build(BuildContext context) {
    return widget.movieModel != null
        ? Padding(
            padding: const EdgeInsets.only(right: 15),
            child: SizedBox(
              width: 177,
              child: GestureDetector(
                onTap: () {
                  DetailsViewNavigatorModel detailsViewNavigatorModel =
                      DetailsViewNavigatorModel(
                          fromWhere: 'movie', id: widget.movieModel!.id!);
                  GoRouter.of(context).push(AppRouter.kDetailsView,
                      extra: detailsViewNavigatorModel);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomPoster(
                      isThereBookmark: true,
                      movieModel: widget.movieModel!,
                      isBookmarked: savedMovies.contains(widget.movieModel!.id),
                      onPressed: () {
                        // print(widget.movieModel!.id);
                        if (savedMovies.contains(widget.movieModel!.id)) {
                          Map<String, dynamic> body = {
                            'media_id': widget.movieModel!.id,
                            'media_type': 'movie',
                            'favorite': false,
                          };
                          BlocProvider.of<SaveToFavCubit>(context)
                              .saveToFav(body: body);
                          savedMovies.remove(widget.movieModel!.id);
                          saveItems();
                          print('${widget.movieModel!.id} removed');
                          setState(() {});
                        } else {
                          Map<String, dynamic> body = {
                            'media_id': widget.movieModel!.id,
                            'media_type': 'movie',
                            'favorite': true,
                          };
                          BlocProvider.of<SaveToFavCubit>(context)
                              .saveToFav(body: body);
                          savedMovies.add(widget.movieModel!.id!);
                          saveItems();
                          print('${widget.movieModel!.id} added');
                          setState(() {});
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      widget.movieModel!.title ?? "",
                      style: Styles.styleText18,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomRating(
                            movieModel: widget.movieModel!,
                          ),
                          const Spacer(),
                          CustomReleasedDate(
                            movieModel: widget.movieModel!,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        : widget.tvShowsModel != null
            ? Padding(
                padding: const EdgeInsets.only(right: 15),
                child: SizedBox(
                  width: 177,
                  child: GestureDetector(
                    onTap: () {
                      DetailsViewNavigatorModel detailsViewNavigatorModel =
                          DetailsViewNavigatorModel(
                              fromWhere: 'tv', id: widget.tvShowsModel!.id!);
                      GoRouter.of(context).push(AppRouter.kDetailsView,
                          extra: detailsViewNavigatorModel);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomPoster(
                          isThereBookmark: true,
                          tvShowsModel: widget.tvShowsModel!,
                          isBookmarked:
                              savedTvShows.contains(widget.tvShowsModel!.id),
                          onPressed: () {
                            // print(widget.tvShowsModel!.id);
                            if (savedTvShows
                                .contains(widget.tvShowsModel!.id)) {
                              Map<String, dynamic> body = {
                                'media_id': widget.tvShowsModel!.id,
                                'media_type': 'tv',
                                'favorite': false,
                              };
                              BlocProvider.of<SaveToFavCubit>(context)
                                  .saveToFav(body: body);
                              savedTvShows.remove(widget.tvShowsModel!.id);
                              saveItems();

                              print('${widget.tvShowsModel!.id} removed');
                              setState(() {});
                            } else {
                              Map<String, dynamic> body = {
                                'media_id': widget.tvShowsModel!.id,
                                'media_type': 'tv',
                                'favorite': true,
                              };
                              BlocProvider.of<SaveToFavCubit>(context)
                                  .saveToFav(body: body);
                              savedTvShows.add(widget.tvShowsModel!.id!);
                              saveItems();

                              print('${widget.tvShowsModel!.id} added');
                              setState(() {});
                            }
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          widget.tvShowsModel!.name!,
                          style: Styles.styleText18,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomRating(
                                tvShowsModel: widget.tvShowsModel!,
                              ),
                              const Spacer(),
                              CustomReleasedDate(
                                tvShowsModel: widget.tvShowsModel!,
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
                              fromWhere: widget.actorCredits!.mediaType!,
                              id: widget.actorCredits!.id!);
                      GoRouter.of(context).push(AppRouter.kDetailsView,
                          extra: detailsViewNavigatorModel);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomPoster(
                          isThereBookmark: true,
                          actorCredits: widget.actorCredits!,
                          isBookmarked: savedMovies
                                  .contains(widget.actorCredits!.id) ||
                              savedTvShows.contains(widget.actorCredits!.id),
                          onPressed: () {
                            if (savedMovies.contains(widget.actorCredits!.id) ||
                                savedTvShows
                                    .contains(widget.actorCredits!.id)) {
                              Map<String, dynamic> body = {
                                'media_id': widget.actorCredits!.id,
                                'media_type': widget.actorCredits!.mediaType,
                                'favorite': false,
                              };
                              BlocProvider.of<SaveToFavCubit>(context)
                                  .saveToFav(body: body);
                              savedMovies.remove(widget.actorCredits!.id);
                              savedTvShows.remove(widget.actorCredits!.id);
                              saveItems();

                              print('${widget.actorCredits!.id} removed');
                              setState(() {});
                            } else {
                              Map<String, dynamic> body = {
                                'media_id': widget.actorCredits!.id,
                                'media_type': widget.actorCredits!.mediaType,
                                'favorite': true,
                              };
                              BlocProvider.of<SaveToFavCubit>(context)
                                  .saveToFav(body: body);
                              savedMovies.add(widget.actorCredits!.id!);
                              savedTvShows.add(widget.actorCredits!.id!);
                              saveItems();

                              print('${widget.actorCredits!.id} added');
                              setState(() {});
                            }
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        widget.actorCredits!.mediaType == 'movie'
                            ? Text(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                widget.actorCredits!.originalTitle!,
                                style: Styles.styleText18,
                              )
                            : Text(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                widget.actorCredits!.name!,
                                style: Styles.styleText18,
                              ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomRating(
                                actorCredits: widget.actorCredits!,
                              ),
                              const Spacer(),
                              CustomReleasedDate(
                                actorCredits: widget.actorCredits!,
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
