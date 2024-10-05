import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/tv_shows_cubits/popular_tv_shows_cubit/popular_tv_shows_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_carousel_slider.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_circular_loading.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_row.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/genres_list_view.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/tv_shows_airing_today_list_view.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/tv_shows_on_the_air_list_view.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/tv_shows_top_rating_list_view.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/widgets/custom_error_failure.dart';

class TvShowsTabContentView extends StatelessWidget {
  const TvShowsTabContentView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        BlocBuilder<PopularTvShowsCubit, PopularTvShowsState>(
          builder: (context, state) {
            if (state is PopularTvShowsSuccess) {
              return CustomCarouselSliderView(
                moviesOrTVShowsModel: state.popularTVShows,
              );
            } else if (state is PopularTvShowsFailure) {
              return const CustomErrorFailure();
            } else {
              return const CustomCircularLoading();
            }
          },
        ),
        const SizedBox(
          height: 20,
        ),
        CustomRow(
          leftText: "Genres",
          onTap: () {
            GoRouter.of(context).push(AppRouter.kGenreView);
          },
        ),
        const SizedBox(
          height: 10,
        ),
        const TvShowGenresListView(),
        const SizedBox(
          height: 20,
        ),
        CustomRow(
          leftText: "On The Air",
          onTap: () {
            GoRouter.of(context).push(AppRouter.kMovieCollevionView);
          },
        ),
        const OnTheAirListView(),
        CustomRow(
          leftText: "Top Rating",
          onTap: () {
            GoRouter.of(context).push(AppRouter.kMovieCollevionView);
          },
        ),
        const TopRatingTvShowsListView(),
        CustomRow(
          leftText: "Airing Today",
          onTap: () {
            GoRouter.of(context).push(AppRouter.kMovieCollevionView);
          },
        ),
        const AiringTodayListView(),
      ],
    );
  }
}
