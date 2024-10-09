import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/Features/home_feature/data/models/genres_model/genres_model.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/collection_model.dart';
import 'package:movie_app/core/utils/styles.dart';

class GenreItemGenres extends StatelessWidget {
  const GenreItemGenres(
      {super.key,
      required this.genre,
      required this.genreColor,
      required this.fromWhere});
  final GenresModel genre;
  final Color genreColor;
  final String fromWhere;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        CollectionModel collectionModel = CollectionModel(
            collectionName: fromWhere,
            collectionTitle: genre.name!,
            id: genre.id.toString());
        GoRouter.of(context)
            .push(AppRouter.kMovieCollevionView, extra: collectionModel);
      },
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: genreColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            textAlign: TextAlign.center,
            genre.name.toString(),
            style: Styles.styleText28,
          ),
        ),
      ),
    );
  }
}
