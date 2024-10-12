import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/data/models/actor_model/actor_known_for.dart';
import 'package:movie_app/Features/home_feature/data/models/movie_model/movie_model.dart';
import 'package:movie_app/Features/home_feature/data/models/tv_shows_model/tv_shows_model.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_bookmark_icon.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_circular_loading.dart';
import 'package:movie_app/core/utils/styles.dart';

class CustomPoster extends StatelessWidget {
  const CustomPoster({
    super.key,
    required this.isThereBookmark,
    this.movieModel,
    this.tvShowsModel,
    this.actorCredits,
  });

  final String image = "https://image.tmdb.org/t/p/original";
  final bool isThereBookmark;
  final MovieModel? movieModel;
  final TvShowsModel? tvShowsModel;
  final ActorKnownFor? actorCredits;

  @override
  Widget build(BuildContext context) {
    return movieModel != null
        ? Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: AspectRatio(
                    aspectRatio: 2.8 / 3.5,
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: movieModel!.posterPath != null
                          ? '$image${movieModel!.posterPath}'
                          : "",
                      errorWidget: (context, url, error) => Center(
                        child: Text(
                          "${movieModel?.title}",
                          style:
                              Styles.styleText18.copyWith(color: Colors.white),
                        ),
                      ),
                      placeholder: (context, url) => const Center(
                        child: CustomCircularLoading(),
                      ),
                    ),
                  ),
                ),
              ),
              isThereBookmark
                  ? const CustomBookmarkIcon(
                      rightPos: 5,
                      topPos: 5,
                    )
                  : Container(),
            ],
          )
        : tvShowsModel != null
            ? Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: AspectRatio(
                        aspectRatio: 2.8 / 3.5,
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: tvShowsModel!.posterPath != null
                              ? '$image${tvShowsModel!.posterPath}'
                              : "",
                          errorWidget: (context, url, error) => Center(
                            child: Text(
                              textAlign: TextAlign.center,
                              "${tvShowsModel?.name}",
                              style: Styles.styleText18
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                          placeholder: (context, url) => const Center(
                            child: CustomCircularLoading(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  isThereBookmark
                      ? const CustomBookmarkIcon(
                          rightPos: 5,
                          topPos: 5,
                        )
                      : Container(),
                ],
              )
            : Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: AspectRatio(
                        aspectRatio: 2.8 / 3.5,
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: tvShowsModel!.posterPath != null
                              ? '$image${actorCredits!.posterPath}'
                              : "",
                          errorWidget: (context, url, error) => Center(
                            child: Text(
                              textAlign: TextAlign.center,
                              "${actorCredits?.originalTitle}",
                              style: Styles.styleText18
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                          placeholder: (context, url) => const Center(
                            child: CustomCircularLoading(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  isThereBookmark
                      ? const CustomBookmarkIcon(
                          rightPos: 5,
                          topPos: 5,
                        )
                      : Container(),
                ],
              );
  }
}
