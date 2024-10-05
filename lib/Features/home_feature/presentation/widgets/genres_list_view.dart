import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/movie_cubits/genre_movie_cubit/genre_movie_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_circular_loading.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/genre_item_home.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/core/widgets/custom_error_failure.dart';

class GenresHomeListView extends StatelessWidget {
  const GenresHomeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenreMovieCubit, GenreMovieState>(
      builder: (context, state) {
        if (state is GenreMovieSuccess) {
          return SizedBox(
            height: 40,
            child: Padding(
              padding: const EdgeInsets.only(left: 25),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.genre.length - 9,
                itemBuilder: (context, index) {
                  return GenreItemHome(
                    genresModel: state.genre[index],
                    gerneColor: genreColor[index],
                  );
                },
              ),
            ),
          );
        } else if (state is GenreMovieFailure) {
          return const CustomErrorFailure();
        } else {
          return const CustomCircularLoading();
        }
      },
    );
  }
}
