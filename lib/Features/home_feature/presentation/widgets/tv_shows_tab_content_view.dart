import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/details_view_navigator_model.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/tv_shows_cubits/popular_tv_shows_cubit/popular_tv_shows_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/Skeletonizer/slider_skeletonizer.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_carousel_slider.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_row.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/genres_list_view.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/tv_shows_airing_today_list_view.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/tv_shows_on_the_air_list_view.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/tv_shows_top_rating_list_view.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/collection_model.dart';
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
              return const SliderSkeletonizer();
            }
          },
        ),
        const SizedBox(
          height: 20,
        ),
        CustomRow(
          leftText: "Genres",
          onTap: () {
            DetailsViewNavigatorModel detailsViewNavigatorModel =
                DetailsViewNavigatorModel(fromWhere: 'genreTv', id: 2);
            GoRouter.of(context)
                .push(AppRouter.kGenreView, extra: detailsViewNavigatorModel);
          },
        ),
        const SizedBox(
          height: 10,
        ),
        const GenresHomeListView(
          whichTab: 'TvShows',
        ),
        const SizedBox(
          height: 20,
        ),
        CustomRow(
          leftText: "On The Air",
          onTap: () {
            CollectionModel collectionModel = CollectionModel(
                collectionName: 'on_the_air', collectionTitle: 'On The Air');
            GoRouter.of(context)
                .push(AppRouter.kMovieCollevionView, extra: collectionModel);
          },
        ),
        const OnTheAirListView(),
        CustomRow(
          leftText: "Top Rating",
          onTap: () {
            CollectionModel collectionModel = CollectionModel(
                collectionName: 'tv_top_rated', collectionTitle: 'Top Rating');
            GoRouter.of(context)
                .push(AppRouter.kMovieCollevionView, extra: collectionModel);
          },
        ),
        const TopRatingTvShowsListView(),
        CustomRow(
          leftText: "Popular",
          onTap: () {
            CollectionModel collectionModel = CollectionModel(
                collectionName: 'popular', collectionTitle: 'Popular');
            GoRouter.of(context)
                .push(AppRouter.kMovieCollevionView, extra: collectionModel);
          },
        ),
        const AiringTodayListView(),
      ],
    );
  }
}
