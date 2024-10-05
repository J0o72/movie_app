import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/movie_cubits/popular_movie_cubit/popular_movie_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_carousel_slider.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_circular_loading.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_row.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/genres_list_view.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/now_playing_list_view.dart';
import 'package:movie_app/core/utils/app_routes.dart';

class MovieTabContentView extends StatefulWidget {
  const MovieTabContentView({
    super.key,
  });

  @override
  State<MovieTabContentView> createState() => _MovieTabContentViewState();
}

class _MovieTabContentViewState extends State<MovieTabContentView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PopularMovieCubit>(context).fetchPopularMovies();
  }

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
              return const Center(
                child: Text(
                  "Error",
                  textAlign: TextAlign.center,
                ),
              );
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
        const GenresHomeListView(),
        const SizedBox(
          height: 20,
        ),
        CustomRow(
          leftText: "Now Playing",
          onTap: () {
            GoRouter.of(context).push(AppRouter.kMovieCollevionView);
          },
        ),
        const NowPlayingListView(),
        CustomRow(
          leftText: "Top Rating",
          onTap: () {
            GoRouter.of(context).push(AppRouter.kMovieCollevionView);
          },
        ),
        const NowPlayingListView(),
        CustomRow(
          leftText: "Upcoming",
          onTap: () {
            GoRouter.of(context).push(AppRouter.kMovieCollevionView);
          },
        ),
        const NowPlayingListView(),
      ],
    );
  }
}
