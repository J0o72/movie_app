import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/data/models/movie_model/movie_model.dart';
import 'package:movie_app/Features/home_feature/data/models/tv_shows_model/tv_shows_model.dart';
import 'package:movie_app/core/utils/styles.dart';

class CustomReleasedDate extends StatelessWidget {
  const CustomReleasedDate({
    super.key,
    this.movieModel,
    this.tvShowsModel,
  });

  final MovieModel? movieModel;
  final TvShowsModel? tvShowsModel;

  @override
  Widget build(BuildContext context) {
    return tvShowsModel == null
        ? Row(
            children: [
              Text(
                '(${movieModel!.releaseDate.toString().substring(0, 4)})',
                style: Styles.styleText16,
              ),
            ],
          )
        : Row(
            children: [
              Text(
                tvShowsModel?.firstAirDate.toString() == null
                    ? ""
                    : tvShowsModel!.firstAirDate.toString().substring(0, 4),
                style: Styles.styleText16,
              ),
            ],
          );
  }
}
