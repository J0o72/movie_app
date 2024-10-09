import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/genre_cubit/genre_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_circular_loading.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/genre_item_genres.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/core/widgets/custom_error_failure.dart';

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
            return const CustomCircularLoading();
          }
        },
      ),
    );
  }
}
