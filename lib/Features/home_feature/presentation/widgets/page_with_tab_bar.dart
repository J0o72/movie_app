import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/data/repos/movie_repo/movie_repo_impl.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/movie_cubits/coming_soon_movie_cubit/coming_soon_movie_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/movie_cubits/now_playing_movie_cubit/now_playing_movie_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/movie_cubits/popular_movie_cubit/popular_movie_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/movie_cubits/top_rating_movie_cubit/top_rating_movie_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_app_bar.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/tab_content_view.dart';
import 'package:movie_app/core/utils/service_locator.dart';

class PageWithTabBarView extends StatelessWidget {
  const PageWithTabBarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ComingSoonMovieCubit(getIt.get<MovieRepoImpl>())
            ..fetchComingSoonMovies(),
        ),
        BlocProvider(
          create: (context) => PopularMovieCubit(getIt.get<MovieRepoImpl>())
            ..fetchPopularMovies(),
        ),
        BlocProvider(
          create: (context) => TopRatingMovieCubit(getIt.get<MovieRepoImpl>())
            ..fetchTopRatingMovies(),
        ),
        BlocProvider(
          create: (context) => NowPlayingMovieCubit(getIt.get<MovieRepoImpl>())
            ..fetchNowPlayingMovies(),
        ),
      ],
      child: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: CustomAppBar(
            appBar: AppBar(),
          ),
          body: const TabBarView(
            children: [
              CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: TabContentView(),
                  ),
                ],
              ),
              CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: TabContentView(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
