import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/data/models/movie_model/movie_model.dart';
import 'package:movie_app/Features/home_feature/data/models/tv_shows_model/tv_shows_model.dart';
import 'package:movie_app/core/utils/styles.dart';

class CustomRating extends StatelessWidget {
  const CustomRating({
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
              const Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Icon(
                  Icons.star_rate_rounded,
                  size: 24,
                  color: Colors.yellow,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                movieModel!.voteAverage.toString().substring(0, 3),
                textAlign: TextAlign.end,
                style: Styles.styleText20,
              ),
              const Text(
                "/10",
                textAlign: TextAlign.end,
              ),
            ],
          )
        : Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Icon(
                  Icons.star_rate_rounded,
                  size: 24,
                  color: Colors.yellow,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                tvShowsModel!.voteAverage.toString().substring(0, 3),
                textAlign: TextAlign.end,
                style: Styles.styleText20,
              ),
              const Text(
                "/10",
                textAlign: TextAlign.end,
              ),
            ],
          );
  }
}
