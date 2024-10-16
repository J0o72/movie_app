import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/details_model/details_model.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/details_view_navigator_model.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/tv_shows_details/tv_shows_details_model.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/details_cubit/details_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/similar_cubit/similar_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_circular_loading.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_genre_shape_saved.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_row.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_actors_list_view.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_read_more_text.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_review_list_view.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_trailer_rating_duration_row.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/now_playing_item.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/collection_model.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:movie_app/core/widgets/custom_error_failure.dart';

class DetailsViewBodyInformation extends StatelessWidget {
  const DetailsViewBodyInformation(
      {super.key, this.detailsModel, this.tvShowsDetailsModel});

  final DetailsModel? detailsModel;
  final TvShowsDetailsModel? tvShowsDetailsModel;

  @override
  Widget build(BuildContext context) {
    return detailsModel != null
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Text(
                  textAlign: TextAlign.center,
                  detailsModel!.title!,
                  style: Styles.styleText28,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    detailsModel!.genres!.isNotEmpty
                        ? CustomGenreShapeSaved(
                            detailsGenre: detailsModel!.genres![0].name!,
                          )
                        : Container(),
                    const SizedBox(
                      width: 10,
                    ),
                    detailsModel!.genres!.length >= 2
                        ? CustomGenreShapeSaved(
                            detailsGenre: detailsModel!.genres![1].name!,
                          )
                        : Container(),
                    const SizedBox(
                      width: 10,
                    ),
                    detailsModel!.genres!.length >= 3
                        ? CustomGenreShapeSaved(
                            detailsGenre: detailsModel!.genres![2].name!,
                          )
                        : Container(),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TrailerRatingDurationRow(
                  detailsModel: detailsModel!,
                ),
                const SizedBox(
                  height: 10,
                ),
                ReadMoreText(
                  text: detailsModel!.overview!,
                ),
                CustomRow(
                  leftText: "Casts",
                  onTap: () {
                    DetailsViewNavigatorModel detailsViewNavigatorModel =
                        DetailsViewNavigatorModel(
                            fromWhere: 'movie', id: detailsModel!.id!);
                    GoRouter.of(context).push(AppRouter.kCastView,
                        extra: detailsViewNavigatorModel);
                  },
                  style: Styles.styleText26,
                  horizontalPadding: 10,
                ),
                const ActorsListView(),
                const SizedBox(
                  height: 10,
                ),
                CustomRow(
                  leftText: "Reviews",
                  onTap: () {
                    DetailsViewNavigatorModel detailsViewNavigatorModel =
                        DetailsViewNavigatorModel(
                            fromWhere: 'movie', id: detailsModel!.id!);
                    GoRouter.of(context).push(AppRouter.kReviewView,
                        extra: detailsViewNavigatorModel);
                  },
                  style: Styles.styleText26,
                  horizontalPadding: 10,
                ),
                const SizedBox(
                  height: 5,
                ),
                const DetailsReviewListView(),
                const SizedBox(
                  height: 10,
                ),
                CustomRow(
                  leftText: "More Like This",
                  onTap: () {
                    CollectionModel collectionModel = CollectionModel(
                        collectionName: 'moreMovieLikeThis',
                        collectionTitle: 'More Like This',
                        id: detailsModel!.id.toString());
                    GoRouter.of(context).push(AppRouter.kMovieCollevionView,
                        extra: collectionModel);
                  },
                  style: Styles.styleText26,
                  horizontalPadding: 10,
                ),
                const DetailsSimilarListView(
                  horizontalPadding: 10,
                ),
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Text(
                  textAlign: TextAlign.center,
                  tvShowsDetailsModel!.name!,
                  style: Styles.styleText28,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  tvShowsDetailsModel!.genres!.isNotEmpty
                      ? CustomGenreShapeSaved(
                          detailsGenre: tvShowsDetailsModel!.genres![0].name!,
                        )
                      : Container(),
                  const SizedBox(
                    width: 10,
                  ),
                  tvShowsDetailsModel!.genres!.length >= 2
                      ? CustomGenreShapeSaved(
                          detailsGenre: tvShowsDetailsModel!.genres![1].name!,
                        )
                      : Container(),
                ]),
                const SizedBox(
                  height: 10,
                ),
                TrailerRatingDurationRow(
                  tvShowsDetailsModel: tvShowsDetailsModel!,
                ),
                const SizedBox(
                  height: 10,
                ),
                ReadMoreText(
                  text: tvShowsDetailsModel!.overview!,
                ),
                CustomRow(
                  leftText: "Casts",
                  onTap: () {
                    DetailsViewNavigatorModel detailsViewNavigatorModel =
                        DetailsViewNavigatorModel(
                            fromWhere: 'tv', id: tvShowsDetailsModel!.id!);
                    GoRouter.of(context).push(AppRouter.kCastView,
                        extra: detailsViewNavigatorModel);
                  },
                  style: Styles.styleText26,
                  horizontalPadding: 10,
                ),
                const ActorsListView(),
                const SizedBox(
                  height: 10,
                ),
                CustomRow(
                  leftText: "Reviews",
                  onTap: () {
                    DetailsViewNavigatorModel detailsViewNavigatorModel =
                        DetailsViewNavigatorModel(
                            fromWhere: 'tv', id: tvShowsDetailsModel!.id!);
                    GoRouter.of(context).push(AppRouter.kReviewView,
                        extra: detailsViewNavigatorModel);
                  },
                  style: Styles.styleText26,
                  horizontalPadding: 10,
                ),
                const SizedBox(
                  height: 5,
                ),
                const DetailsReviewListView(),
                const SizedBox(
                  height: 10,
                ),
                CustomRow(
                  leftText: "More Like This",
                  onTap: () {
                    CollectionModel collectionModel = CollectionModel(
                        collectionName: 'moreTvLikeThis',
                        collectionTitle: 'More Like This',
                        id: tvShowsDetailsModel!.id.toString());
                    GoRouter.of(context).push(AppRouter.kMovieCollevionView,
                        extra: collectionModel);
                  },
                  style: Styles.styleText26,
                  horizontalPadding: 10,
                ),
                const DetailsSimilarListView(
                  horizontalPadding: 10,
                ),
              ],
            ),
          );
  }
}

class DetailsSimilarListView extends StatelessWidget {
  const DetailsSimilarListView({super.key, required this.horizontalPadding});

  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarCubit, SimilarState>(
      builder: (context, state) {
        if (state is SimilarSuccess) {
          if (state.similartMovies != null) {
            if (state.similartMovies!.isNotEmpty) {
              return SizedBox(
                height: state.similartMovies!.isNotEmpty ? 300 : 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.similartMovies!.length,
                    itemBuilder: (context, index) {
                      return NowPlayingItem(
                        movieModel: state.similartMovies![index],
                      );
                    },
                  ),
                ),
              );
            } else {
              return const Padding(
                padding: EdgeInsets.all(22),
                child: Center(
                    child: Text(
                  'Sorry, No More Like This',
                  style: Styles.styleText20,
                )),
              );
            }
          } else {
            if (state.similartTv!.isNotEmpty) {
              return SizedBox(
                height: state.similartTv!.isNotEmpty ? 300 : 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.similartTv!.length,
                    itemBuilder: (context, index) {
                      return NowPlayingItem(
                        tvShowsModel: state.similartTv![index],
                      );
                    },
                  ),
                ),
              );
            } else {
              return const Padding(
                padding: EdgeInsets.all(22),
                child: Center(
                    child: Text(
                  'Sorry, No More Like This',
                  style: Styles.styleText20,
                )),
              );
            }
          }
        } else if (state is DetailsFailure) {
          return const CustomErrorFailure();
        } else {
          return const CustomCircularLoading();
        }
      },
    );
  }
}
