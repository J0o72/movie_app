import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/genre_cubit/genre_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/genre_item_genres.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:movie_app/core/widgets/custom_error_failure.dart';
import 'package:skeletonizer/skeletonizer.dart';

class GenreGirdViewGenres extends StatefulWidget {
  const GenreGirdViewGenres(
      {super.key, required this.id, required this.fromWhere});

  final int id;
  final String fromWhere;
  @override
  State<GenreGirdViewGenres> createState() => _GenreGirdViewGenresState();
}

class _GenreGirdViewGenresState extends State<GenreGirdViewGenres> {
  @override
  void initState() {
    super.initState();

    if (widget.id == 1) {
      BlocProvider.of<GenreCubit>(context).fetchGenreMovies();
    } else {
      BlocProvider.of<GenreCubit>(context).fetchGenresTVShows();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 32,
        horizontal: 18,
      ),
      child: BlocBuilder<GenreCubit, GenreState>(
        builder: (context, state) {
          if (state is GenreSuccess) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: state.genre.length,
              itemBuilder: (context, index) {
                return GenreItemGenres(
                  genre: state.genre[index],
                  genreColor: genreColor[index],
                  fromWhere: widget.fromWhere,
                );
              },
            );
          } else if (state is GenreFailure) {
            return const CustomErrorFailure();
          } else {
            return const HomeGenresGridViewSkeletonizer();
          }
        },
      ),
    );
  }
}

class HomeGenresGridViewSkeletonizer extends StatelessWidget {
  const HomeGenresGridViewSkeletonizer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        return Skeletonizer(
          enabled: true,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Center(
              child: Text(
                textAlign: TextAlign.center,
                "Action",
                style: Styles.styleText28,
              ),
            ),
          ),
        );
      },
    );
  }
}
