import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/cast_cubit/cast_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/details_cubit/details_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/reviews_cubit/reviews_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/similar_cubit/similar_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_back_arrow_icon.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_bookmark_icon.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_circular_loading.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_custom_poster.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_view_body_information.dart';
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
    } else {
      BlocProvider.of<DetailsCubit>(context).fetchTvShowsDetails(id: widget.id);
      BlocProvider.of<CastCubit>(context)
          .fetchCasts(id: widget.id, fromWhere: 'tv');
      BlocProvider.of<ReviewsCubit>(context)
          .fetchReviews(id: widget.id, fromWhere: 'tv');
      BlocProvider.of<SimilarCubit>(context).fetchSimilarTV(id: widget.id);
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
                          const CustomBookmarkIcon(
                            rightPos: 20,
                            topPos: 40,
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
                          const CustomBookmarkIcon(
                            rightPos: 20,
                            topPos: 40,
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
