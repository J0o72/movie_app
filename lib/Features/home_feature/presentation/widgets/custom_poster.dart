import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/data/models/actor_model/actor_known_for.dart';
import 'package:movie_app/Features/home_feature/data/models/movie_model/movie_model.dart';
import 'package:movie_app/Features/home_feature/data/models/tv_shows_model/tv_shows_model.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/Skeletonizer/image_placeholder_skeletonizer.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_bookmark_icon.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/is_coming_soon.dart';
import 'package:movie_app/core/utils/styles.dart';

class CustomPoster extends StatelessWidget {
  const CustomPoster({
    super.key,
    required this.isThereBookmark,
    this.movieModel,
    this.tvShowsModel,
    this.actorCredits,
    this.onPressed,
    this.isBookmarked = false,
  });

  final String image = "https://image.tmdb.org/t/p/original";
  final bool isThereBookmark;
  final MovieModel? movieModel;
  final TvShowsModel? tvShowsModel;
  final ActorKnownFor? actorCredits;
  final Function()? onPressed;
  final bool? isBookmarked;

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
                                style: Styles.styleText18
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                        placeholder: (context, url) {
                          return ImagePlaceholderSkeletonizer(
                            height: MediaQuery.of(context).size.height * 0.13,
                          );
                        }),
                  ),
                ),
              ),
              isThereBookmark
                  ? CustomBookmarkIcon(
                      rightPos: 10,
                      topPos: 5,
                      onPressed: onPressed,
                      isBookmarked: isBookmarked,
                    )
                  : Container(),
              movieModel!.releaseDate != ''
                  ? DateTime.parse(movieModel!.releaseDate!)
                          .isAfter(DateTime.now())
                      ? const IsComingSoon()
                      : Container()
                  : const IsComingSoon(),
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
                            child: ImagePlaceholderSkeletonizer(
                              height: 180,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  isThereBookmark
                      ? CustomBookmarkIcon(
                          rightPos: 10,
                          topPos: 5,
                          onPressed: onPressed,
                          isBookmarked: isBookmarked,
                        )
                      : Container(),
                  tvShowsModel!.firstAirDate != ''
                      ? DateTime.parse(tvShowsModel!.firstAirDate!)
                              .isAfter(DateTime.now())
                          ? const IsComingSoon()
                          : Container()
                      : const IsComingSoon(),
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
                          imageUrl: actorCredits!.posterPath != null
                              ? '$image${actorCredits!.posterPath}'
                              : "",
                          errorWidget: (context, url, error) => Center(
                            child: Text(
                              textAlign: TextAlign.center,
                              "${actorCredits?.originalTitle ?? actorCredits?.originalName}",
                              style: Styles.styleText18
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                          placeholder: (context, url) => const Center(
                            child: ImagePlaceholderSkeletonizer(
                              height: 200,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  isThereBookmark
                      ? CustomBookmarkIcon(
                          rightPos: 5,
                          topPos: 5,
                          onPressed: onPressed,
                          isBookmarked: isBookmarked,
                        )
                      : Container(),
                  actorCredits!.releaseDate != null
                      ? actorCredits!.releaseDate != ""
                          ? DateTime.parse(actorCredits!.releaseDate!)
                                  .isAfter(DateTime.now())
                              ? const IsComingSoon()
                              : Container()
                          : const IsComingSoon()
                      : actorCredits!.firstAirDate != ""
                          ? DateTime.parse(actorCredits!.firstAirDate!)
                                  .isAfter(DateTime.now())
                              ? const IsComingSoon()
                              : Container()
                          : const IsComingSoon(),
                ],
              );
  }
}
