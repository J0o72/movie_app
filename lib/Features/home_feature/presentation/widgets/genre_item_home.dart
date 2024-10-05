import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/Features/home_feature/data/models/genres_model/genres_model.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/styles.dart';

class GenreItemHome extends StatelessWidget {
  const GenreItemHome(
      {super.key, required this.genresModel, required this.gerneColor});

  final GenresModel genresModel;
  final Color gerneColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kMovieCollevionView);
      },
      child: Container(
        width: 130,
        height: 40,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: gerneColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            genresModel.name.toString(),
            style: Styles.styleText18,
          ),
        ),
      ),
    );
  }
}
