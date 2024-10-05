import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/tv_shows_cubits/popular_tv_shows_cubit/popular_tv_shows_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_carousel_slider.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_circular_loading.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_row.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/genres_list_view.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/now_playing_list_view.dart';
import 'package:movie_app/core/utils/app_routes.dart';

class TvShowsTabContentView extends StatefulWidget {
  const TvShowsTabContentView({
    super.key,
  });

  @override
  State<TvShowsTabContentView> createState() => _TvShowsTabContentViewState();
}

class _TvShowsTabContentViewState extends State<TvShowsTabContentView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PopularTvShowsCubit>(context).fetchPopularTvShows();
  }

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
              print(state.errorMessage);
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
