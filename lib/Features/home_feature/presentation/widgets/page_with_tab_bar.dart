import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/data/repos/movie_repo/movie_repo_impl.dart';
import 'package:movie_app/Features/home_feature/data/repos/tv_shows_repo/tv_shows_repo_impl.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/movie_cubits/coming_soon_movie_cubit/coming_soon_movie_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/movie_cubits/now_playing_movie_cubit/now_playing_movie_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/movie_cubits/popular_movie_cubit/popular_movie_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/movie_cubits/top_rating_movie_cubit/top_rating_movie_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/tv_shows_cubits/airing_today_tv_shows_cubit/airing_today_tv_shows_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/tv_shows_cubits/on_the_air_tv_shows_cubit/on_the_air_tv_shows_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/tv_shows_cubits/popular_tv_shows_cubit/popular_tv_shows_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/tv_shows_cubits/top_rating_tv_shows_cubit/top_rating_tv_shows_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_app_bar.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/movie_tab_content_view.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/tv_shows_tab_content_view.dart';
import 'package:movie_app/core/utils/service_locator.dart';

class PageWithTabBarView extends StatelessWidget {
  const PageWithTabBarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return
        // MultiBlocProvider(
        // providers: [
        // BlocProvider(
        //   create: (context) => ComingSoonMovieCubit(getIt.get<MovieRepoImpl>())
        //     ..fetchComingSoonMovies(),
        // ),
        // BlocProvider(
        //   create: (context) => PopularMovieCubit(getIt.get<MovieRepoImpl>())
        //     ..fetchPopularMovies(),
        // ),
        // BlocProvider(
        //   create: (context) => TopRatingMovieCubit(getIt.get<MovieRepoImpl>())
        //     ..fetchTopRatingMovies(),
        // ),
        // BlocProvider(
        //   create: (context) => NowPlayingMovieCubit(getIt.get<MovieRepoImpl>())
        //     ..fetchNowPlayingMovies(),
        // ),
        // BlocProvider(
        //   create: (context) =>
        //       OnTheAirTvShowsCubit(getIt.get<TVShowsRepoImpl>())
        //         ..fetchOnTheAirTVShows(),
        // ),
        // BlocProvider(
        //   create: (context) => PopularTvShowsCubit(getIt.get<TVShowsRepoImpl>())
        //     ..fetchPopularTvShows(),
        // ),
        // BlocProvider(
        //   create: (context) =>
        //       TopRatingTvShowsCubit(getIt.get<TVShowsRepoImpl>())
        //         ..fetchTopRatingTVShows(),
        // ),
        // BlocProvider(
        //   create: (context) =>
        //       AiringTodayTvShowsCubit(getIt.get<TVShowsRepoImpl>())
        //         ..fetchAiringTodayTVShows(),
        // ),
        // ],
        DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(
          appBar: AppBar(),
        ),
        body: TabBarView(
          children: [
            MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) =>
                      ComingSoonMovieCubit(getIt.get<MovieRepoImpl>())
                        ..fetchComingSoonMovies(),
                ),
                BlocProvider(
                  create: (context) =>
                      PopularMovieCubit(getIt.get<MovieRepoImpl>()),
                ),
                BlocProvider(
                  create: (context) =>
                      TopRatingMovieCubit(getIt.get<MovieRepoImpl>())
                        ..fetchTopRatingMovies(),
                ),
                BlocProvider(
                  create: (context) =>
                      NowPlayingMovieCubit(getIt.get<MovieRepoImpl>())
                        ..fetchNowPlayingMovies(),
                ),
              ],
              child: const CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: MovieTabContentView(),
                  ),
                ],
              ),
            ),
            MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) =>
                      OnTheAirTvShowsCubit(getIt.get<TVShowsRepoImpl>())
                        ..fetchOnTheAirTVShows(),
                ),
                BlocProvider(
                  create: (context) =>
                      PopularTvShowsCubit(getIt.get<TVShowsRepoImpl>()),
                ),
                BlocProvider(
                  create: (context) =>
                      TopRatingTvShowsCubit(getIt.get<TVShowsRepoImpl>())
                        ..fetchTopRatingTVShows(),
                ),
                BlocProvider(
                  create: (context) =>
                      AiringTodayTvShowsCubit(getIt.get<TVShowsRepoImpl>())
                        ..fetchAiringTodayTVShows(),
                ),
              ],
              child: const CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: TvShowsTabContentView(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
