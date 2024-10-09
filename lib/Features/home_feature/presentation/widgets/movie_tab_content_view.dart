import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/details_view_navigator_model.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/movie_cubits/popular_movie_cubit/popular_movie_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_carousel_slider.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_circular_loading.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_row.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/genres_list_view.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/movie_top_rating_list_view.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/movie_up_coming_list_view.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/now_playing_list_view.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/collection_model.dart';
import 'package:movie_app/core/widgets/custom_error_failure.dart';

class MovieTabContentView extends StatelessWidget {
  const MovieTabContentView({
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
        BlocBuilder<PopularMovieCubit, PopularMovieState>(
          builder: (context, state) {
            if (state is PopularMovieSuccess) {
              return CustomCarouselSliderView(
                moviesOrTVShowsModel: state.popularMovies,
              );
            } else if (state is PopularMovieFailure) {
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
            DetailsViewNavigatorModel detailsViewNavigatorModel =
                DetailsViewNavigatorModel(fromWhere: 'genreMovie', id: 1);
            GoRouter.of(context)
                .push(AppRouter.kGenreView, extra: detailsViewNavigatorModel);
          },
        ),
        const SizedBox(
          height: 10,
        ),
        const GenresHomeListView(
          whichTab: 'movie',
        ),
        const SizedBox(
          height: 20,
        ),
        CustomRow(
          leftText: "Now Playing",
          onTap: () {
            CollectionModel collectionModel = CollectionModel(
                collectionName: 'now_playing', collectionTitle: 'Now Playing');
            GoRouter.of(context)
                .push(AppRouter.kMovieCollevionView, extra: collectionModel);
          },
        ),
        const NowPlayingListView(),
        const SizedBox(
          height: 20,
        ),
        CustomRow(
          leftText: "Top Rating",
          onTap: () {
            CollectionModel collectionModel = CollectionModel(
                collectionName: 'top_rated', collectionTitle: 'Top Rating');
            GoRouter.of(context)
                .push(AppRouter.kMovieCollevionView, extra: collectionModel);
          },
        ),
        const TopRatingListView(),
        const SizedBox(
          height: 20,
        ),
        CustomRow(
          leftText: "Upcoming",
          onTap: () {
            CollectionModel collectionModel = CollectionModel(
                collectionName: 'upcoming', collectionTitle: 'Upcoming');
            GoRouter.of(context)
                .push(AppRouter.kMovieCollevionView, extra: collectionModel);
          },
        ),
        const UpComingListView(),
      ],
    );
  }
}
