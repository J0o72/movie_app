import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_circular_loading.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/seasons_title.dart';
import 'package:movie_app/core/utils/styles.dart';

class SeasonsCutomImage extends StatelessWidget {
  const SeasonsCutomImage({
    super.key,
  });

  final String image = "https://image.tmdb.org/t/p/original/";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: AspectRatio(
                aspectRatio: 2.8 / 3.5,
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: '$image' '1BP4xYv9ZG4ZVHkL7ocOziBbSYH.jpg',
                  errorWidget: (context, url, error) => Center(
                    child: Text(
                      "Season 1",
                      style: Styles.styleText18.copyWith(color: Colors.white),
                    ),
                  ),
                  placeholder: (context, url) => const Center(
                    child: CustomCircularLoading(),
                  ),
                ),
              ),
            ),
          ),
          const SeasonsTitle(),
        ],
      ),
    );
  }
}
