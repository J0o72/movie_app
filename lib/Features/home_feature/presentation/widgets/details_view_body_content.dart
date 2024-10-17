import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/cast_cubit/cast_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/cubit/trailler_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/details_cubit/details_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/reviews_cubit/reviews_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/save_to_fav_cubit/save_to_fav_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/saved_cubit/saved_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/similar_cubit/similar_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_back_arrow_icon.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_bookmark_icon.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_circular_loading.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_custom_poster.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_view_body_information.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/core/utils/shared_preference.dart';
import 'package:movie_app/core/widgets/custom_error_failure.dart';

class DetailsViewBodyContent extends StatefulWidget {
  const DetailsViewBodyContent(
      {super.key, required this.fromWhere, required this.id});
  final String fromWhere;
  final int id;

  @override
  State<DetailsViewBodyContent> createState() => _DetailsViewBodyContentState();
}

class _DetailsViewBodyContentState extends State<DetailsViewBodyContent> {
  @override
  void initState() {
    super.initState();
    if (widget.fromWhere == 'movie') {
      BlocProvider.of<DetailsCubit>(context).fetchDetails(id: widget.id);
      BlocProvider.of<CastCubit>(context)
          .fetchCasts(id: widget.id, fromWhere: 'movie');

      BlocProvider.of<ReviewsCubit>(context)
          .fetchReviews(id: widget.id, fromWhere: 'movie');
      BlocProvider.of<SimilarCubit>(context).fetchSimilar(id: widget.id);
      BlocProvider.of<TraillerCubit>(context)
          .fetchTrailler(id: widget.id, fromWhere: 'movie');
    } else {
      BlocProvider.of<DetailsCubit>(context).fetchTvShowsDetails(id: widget.id);
      BlocProvider.of<CastCubit>(context)
          .fetchCasts(id: widget.id, fromWhere: 'tv');
      BlocProvider.of<ReviewsCubit>(context)
          .fetchReviews(id: widget.id, fromWhere: 'tv');
      BlocProvider.of<SimilarCubit>(context).fetchSimilarTV(id: widget.id);
      BlocProvider.of<TraillerCubit>(context)
          .fetchTrailler(id: widget.id, fromWhere: 'tv');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        if (state is DetailsSuccess) {
          if (state.detailsModel != null) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          DetailsCustomPoster(
                            detailsModel: state.detailsModel!,
                          ),
                          CustomBookmarkIcon(
                            rightPos: 20,
                            topPos: 40,
                            isBookmarked:
                                savedMovies.contains(state.detailsModel!.id),
                            onPressed: () {
                              // print(widget.movieModel!.id);
                              if (savedMovies
                                  .contains(state.detailsModel!.id)) {
                                Map<String, dynamic> body = {
                                  'media_id': state.detailsModel!.id,
                                  'media_type': 'movie',
                                  'favorite': false,
                                };
                                BlocProvider.of<SaveToFavCubit>(context)
                                    .saveToFav(body: body);
                                BlocProvider.of<SavedCubit>(context)
                                    .fetchFavList();

                                savedMovies.remove(state.detailsModel!.id);
                                saveItems();
                                print('${state.detailsModel!.id} removed');
                                setState(() {});
                              } else {
                                Map<String, dynamic> body = {
                                  'media_id': state.detailsModel!.id,
                                  'media_type': 'movie',
                                  'favorite': true,
                                };
                                BlocProvider.of<SaveToFavCubit>(context)
                                    .saveToFav(body: body);
                                BlocProvider.of<SavedCubit>(context)
                                    .fetchFavList();

                                savedMovies.add(state.detailsModel!.id!);
                                saveItems();
                                print('${state.detailsModel!.id} added');
                                setState(() {});
                              }
                            },
                          ),
                          const CustomBackArrowIcon(),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 150,
                              color: Colors.black,
                              offset: Offset(0, 0),
                              spreadRadius: 70,
                            ),
                          ],
                        ),
                        child: DetailsViewBodyInformation(
                          detailsModel: state.detailsModel!,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          DetailsCustomPoster(
                            tvShowsDetailsModel: state.tvShowsDetailsModel,
                          ),
                          CustomBookmarkIcon(
                            rightPos: 20,
                            topPos: 40,
                            isBookmarked: savedTvShows
                                .contains(state.tvShowsDetailsModel!.id),
                            onPressed: () {
                              // print(widget.tvShowsModel!.id);
                              if (savedTvShows
                                  .contains(state.tvShowsDetailsModel!.id)) {
                                Map<String, dynamic> body = {
                                  'media_id': state.tvShowsDetailsModel!.id,
                                  'media_type': 'tv',
                                  'favorite': false,
                                };
                                BlocProvider.of<SaveToFavCubit>(context)
                                    .saveToFav(body: body);
                                BlocProvider.of<SavedCubit>(context)
                                    .fetchFavList();

                                savedTvShows
                                    .remove(state.tvShowsDetailsModel!.id);
                                saveItems();

                                print(
                                    '${state.tvShowsDetailsModel!.id} removed');
                                setState(() {});
                              } else {
                                Map<String, dynamic> body = {
                                  'media_id': state.tvShowsDetailsModel!.id,
                                  'media_type': 'tv',
                                  'favorite': true,
                                };
                                BlocProvider.of<SaveToFavCubit>(context)
                                    .saveToFav(body: body);
                                BlocProvider.of<SavedCubit>(context)
                                    .fetchFavList();

                                savedTvShows
                                    .add(state.tvShowsDetailsModel!.id!);
                                saveItems();

                                print('${state.tvShowsDetailsModel!.id} added');
                                setState(() {});
                              }
                            },
                          ),
                          const CustomBackArrowIcon(),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 150,
                              color: Colors.black,
                              offset: Offset(0, 0),
                              spreadRadius: 70,
                            ),
                          ],
                        ),
                        child: DetailsViewBodyInformation(
                          tvShowsDetailsModel: state.tvShowsDetailsModel,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        } else if (state is DetailsFailure) {
          print(state.errorMessage);
          return const CustomErrorFailure();
        } else {
          return const CustomCircularLoading();
        }
      },
    );
  }
}
