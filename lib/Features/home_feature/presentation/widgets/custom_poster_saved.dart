import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/Features/home_feature/data/models/movie_model/movie_model.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_circular_loading.dart';
import 'package:movie_app/core/utils/app_routes.dart';

class CutsomPosterSaved extends StatelessWidget {
  const CutsomPosterSaved({super.key, required this.movieModel});

  final String imageUrl = "https://image.tmdb.org/t/p/original";
  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kDetailsView);
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.25,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: AspectRatio(
            aspectRatio: 2.8 / 3.5,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: '$imageUrl${movieModel.posterPath}',
              errorWidget: (context, url, error) => const Icon(Icons.error),
              placeholder: (context, url) => const Center(
                child: CustomCircularLoading(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
