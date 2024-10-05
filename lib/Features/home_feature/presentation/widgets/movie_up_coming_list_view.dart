import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/movie_cubits/coming_soon_movie_cubit/coming_soon_movie_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_circular_loading.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/now_playing_item.dart';
import 'package:movie_app/core/widgets/custom_error_failure.dart';

class UpComingListView extends StatelessWidget {
  const UpComingListView({super.key, this.horizontalPadding = 20});

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
