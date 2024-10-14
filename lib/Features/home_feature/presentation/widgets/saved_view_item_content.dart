import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/data/models/favorite_model/favorite_model/fav_result.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_genre_shape_saved.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_poster_saved.dart';
import 'package:movie_app/core/utils/styles.dart';

class SavedViewItemContent extends StatelessWidget {
  const SavedViewItemContent({super.key, required this.favItem});

  final FavoriteResults favItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CutsomPosterSaved(
            favItem: favItem,
          ),
          const SizedBox(
            width: 10,
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Breaking Bad (2020)",
                style: Styles.styleText18,
              ),
              // CustomRating(),
              Row(
                children: [
                  // CustomGenreShapeSaved(),
                  SizedBox(
                    width: 5,
                  ),
                  // CustomGenreShapeSaved(),
                ],
              ),
              // CustomDurationTime(),
            ],
          )
        ],
      ),
    );
  }
}
