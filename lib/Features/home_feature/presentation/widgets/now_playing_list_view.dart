import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/movie_cubits/now_playing_movie_cubit/now_playing_movie_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_circular_loading.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/now_playing_item.dart';
import 'package:movie_app/core/widgets/custom_error_failure.dart';

class NowPlayingListView extends StatefulWidget {
  const NowPlayingListView({super.key, this.horizontalPadding = 20});

  final double horizontalPadding;

  @override
  State<NowPlayingListView> createState() => _NowPlayingListViewState();
}

class _NowPlayingListViewState extends State<NowPlayingListView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingMovieCubit, NowPlayingMovieState>(
      builder: (context, state) {
        if (state is NowPlayingMovieSuccess) {
          return SizedBox(
            height: 300,
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: widget.horizontalPadding),
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
          return const ListViewSkeletonizer();
        }
      },
    );
  }
}

class ListViewSkeletonizer extends StatelessWidget {
  const ListViewSkeletonizer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return const CustomCircularLoading();
          },
        ),
      ),
    );
  }
}
