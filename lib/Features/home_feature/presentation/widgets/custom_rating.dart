import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/data/models/actor_model/actor_known_for.dart';
import 'package:movie_app/Features/home_feature/data/models/favorite_model/favorite_model/fav_result.dart';
import 'package:movie_app/Features/home_feature/data/models/movie_model/movie_model.dart';
import 'package:movie_app/Features/home_feature/data/models/tv_shows_model/tv_shows_model.dart';
import 'package:movie_app/core/utils/styles.dart';

class CustomRating extends StatelessWidget {
  const CustomRating({
    super.key,
    this.movieModel,
    this.tvShowsModel,
    this.actorCredits,
    this.favItem,
  });

  final MovieModel? movieModel;
  final TvShowsModel? tvShowsModel;
  final ActorKnownFor? actorCredits;
  final FavoriteResults? favItem;

  @override
  Widget build(BuildContext context) {
    return movieModel != null
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
        : tvShowsModel != null
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
                    tvShowsModel!.voteAverage.toString().substring(0, 3),
                    textAlign: TextAlign.end,
                    style: Styles.styleText20,
                  ),
                  const Text(
                    "/10",
                    textAlign: TextAlign.end,
                  ),
                ],
              )
            : actorCredits != null
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
                        actorCredits!.voteAverage.toString().substring(0, 3),
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
                        favItem!.voteAverage.toString().substring(0, 3),
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
