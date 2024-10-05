import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/Features/home_feature/data/models/movie_model/movie_model.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_bookmark_icon.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_circular_loading.dart';
import 'package:movie_app/core/utils/app_routes.dart';

class MovieCustomImageCarouselItem extends StatelessWidget {
  const MovieCustomImageCarouselItem({super.key, required this.movie});

  final String imageUrl = "https://image.tmdb.org/t/p/original";
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kDetailsView);
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.4,
              errorWidget: (context, url, error) => const Icon(Icons.error),
              placeholder: (context, url) => const CustomCircularLoading(),
              imageUrl: "$imageUrl${movie.posterPath}",
            ),
          ),
        ),
        const CustomBookmarkIcon(
          rightPos: 5,
          topPos: 5,
        ),
      ],
    );
  }
}
