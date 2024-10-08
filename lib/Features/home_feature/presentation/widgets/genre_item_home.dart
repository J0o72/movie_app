import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/Features/home_feature/data/models/genres_model/genres_model.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/collection_model.dart';
import 'package:movie_app/core/utils/styles.dart';

class GenreItemHome extends StatelessWidget {
  const GenreItemHome(
      {super.key,
      required this.genresModel,
      required this.gerneColor,
      required this.whichTab});

  final GenresModel genresModel;
  final Color gerneColor;
  final String whichTab;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        CollectionModel collectionModel = CollectionModel(
          collectionName: whichTab,
          collectionTitle: genresModel.name!,
          id: genresModel.id.toString(),
        );
        GoRouter.of(context)
            .push(AppRouter.kMovieCollevionView, extra: collectionModel);
      },
      child: Container(
        width: 130,
        height: 50,
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: gerneColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            genresModel.name.toString(),
            style: Styles.styleText18,
          ),
        ),
      ),
    );
  }
}
