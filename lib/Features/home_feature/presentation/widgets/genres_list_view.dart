import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/genre_cubit/genre_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/Skeletonizer/genre_home_skeletonizer.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/genre_item_home.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/core/widgets/custom_error_failure.dart';

class GenresHomeListView extends StatelessWidget {
  const GenresHomeListView({super.key, required this.whichTab});

  final String whichTab;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenreCubit, GenreState>(
      builder: (context, state) {
        if (state is GenreSuccess) {
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
                    whichTab: whichTab,
                  );
                },
              ),
            ),
          );
        } else if (state is GenreFailure) {
          return const CustomErrorFailure();
        } else {
          return const GenreHomeSkeletonizer();
        }
      },
    );
  }
}
