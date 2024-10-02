import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/styles.dart';

class GenreItemGenres extends StatelessWidget {
  const GenreItemGenres({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kMovieCollevionView);
      },
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: kMainColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Center(
          child: Text(
            "Action",
            style: Styles.styleText28,
          ),
        ),
      ),
    );
  }
}
