import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/data/models/actor_model/actor_known_for.dart';
import 'package:movie_app/Features/home_feature/data/models/movie_model/movie_model.dart';
import 'package:movie_app/Features/home_feature/data/models/tv_shows_model/tv_shows_model.dart';
import 'package:movie_app/core/utils/styles.dart';

class CustomReleasedDate extends StatelessWidget {
  const CustomReleasedDate({
    super.key,
    this.movieModel,
    this.tvShowsModel,
    this.actorCredits,
  });

  final MovieModel? movieModel;
  final TvShowsModel? tvShowsModel;
  final ActorKnownFor? actorCredits;

  @override
  Widget build(BuildContext context) {
    return movieModel != null
        ? Row(
            children: [
              movieModel!.releaseDate.toString() != ""
                  ? Text(
                      '(${movieModel!.releaseDate.toString().substring(0, 4)})',
                      style: Styles.styleText16,
                    )
                  : const Text(
                      "",
                    )
            ],
          )
        : tvShowsModel != null
            ? Row(
                children: [
                  tvShowsModel!.firstAirDate.toString() == ""
                      ? const Text(
                          "",
                        )
                      : Text(
                          '(${tvShowsModel!.firstAirDate.toString().substring(0, 4)})',
                          style: Styles.styleText16,
                        ),
                ],
              )
            : Row(
                children: [
                  actorCredits!.mediaType == "movie"
                      ? actorCredits!.releaseDate.toString() != ''
                          ? Text(
                              '(${actorCredits!.releaseDate.toString().substring(0, 4)})',
                              style: Styles.styleText16,
                            )
                          : const Text('')
                      : actorCredits!.mediaType == 'tv'
                          ? actorCredits!.firstAirDate.toString() != ''
                              ? Text(
                                  '(${actorCredits!.firstAirDate.toString().substring(0, 4)})',
                                  style: Styles.styleText16,
                                )
                              : const Text('')
                          : const Text(""),
                ],
              );
  }
}
