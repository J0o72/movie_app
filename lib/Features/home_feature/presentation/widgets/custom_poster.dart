import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/data/models/movie_model/movie_model.dart';
import 'package:movie_app/Features/home_feature/data/models/tv_shows_model/tv_shows_model.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_bookmark_icon.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_circular_loading.dart';

class CustomPoster extends StatelessWidget {
  const CustomPoster({
    super.key,
    required this.isThereBookmark,
    this.movieModel,
    this.tvShowsModel,
  });

  final String image = "https://image.tmdb.org/t/p/original";
  final bool isThereBookmark;
  final MovieModel? movieModel;
  final TvShowsModel? tvShowsModel;

  @override
  Widget build(BuildContext context) {
    return tvShowsModel == null
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
                      imageUrl: '$image${movieModel!.posterPath}',
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
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
                      imageUrl: '$image${tvShowsModel!.posterPath}',
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
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
