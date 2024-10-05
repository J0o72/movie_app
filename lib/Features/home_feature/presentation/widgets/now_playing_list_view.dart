import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/movie_cubits/coming_soon_movie_cubit/coming_soon_movie_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/movie_cubits/now_playing_movie_cubit/now_playing_movie_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/movie_cubits/top_rating_movie_cubit/top_rating_movie_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_circular_loading.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/now_playing_item.dart';
import 'package:movie_app/core/widgets/custom_error_failure.dart';

class NowPlayingListView extends StatelessWidget {
  const NowPlayingListView({super.key, this.horizontalPadding = 20});

  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingMovieCubit, NowPlayingMovieState>(
      builder: (context, state) {
        if (state is NowPlayingMovieSuccess) {
          return SizedBox(
            height: 300,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.nowPlayingMovies.length,
                itemBuilder: (context, index) {
                  return NowPlayingItem(
                    movieModel: state.nowPlayingMovies[index],
                  );
                },
              ),
            ),
          );
        } else if (state is NowPlayingMovieFailure) {
          return const CustomErrorFailure();
        } else {
          return const CustomCircularLoading();
        }
      },
    );
  }
}

class TopRatingListView extends StatelessWidget {
  const TopRatingListView({super.key, this.horizontalPadding = 20});

  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatingMovieCubit, TopRatingMovieState>(
      builder: (context, state) {
        if (state is TopRatingMovieSuccess) {
          return SizedBox(
            height: 300,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.topRatingMovies.length,
                itemBuilder: (context, index) {
                  return NowPlayingItem(
                    movieModel: state.topRatingMovies[index],
                  );
                },
              ),
            ),
          );
        } else if (state is TopRatingMovieFailure) {
          return const CustomErrorFailure();
        } else {
          return const CustomCircularLoading();
        }
      },
    );
  }
}

class ComingSoonListView extends StatelessWidget {
  const ComingSoonListView({super.key, this.horizontalPadding = 20});

  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComingSoonMovieCubit, ComingSoonMovieState>(
      builder: (context, state) {
        if (state is ComingSoonMovieSuccess) {
          return SizedBox(
            height: 300,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.comingSoonMovies.length,
                itemBuilder: (context, index) {
                  return NowPlayingItem(
                    movieModel: state.comingSoonMovies[index],
                  );
                },
              ),
            ),
          );
        } else if (state is ComingSoonMovieFailure) {
          return const CustomErrorFailure();
        } else {
          return const CustomCircularLoading();
        }
      },
    );
  }
}
