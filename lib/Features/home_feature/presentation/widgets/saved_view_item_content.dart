import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/data/models/favorite_model/favorite_model/fav_result.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_genre_shape_saved.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_poster_saved.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_rating.dart';
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
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  favItem.originalTitle != null
                      ? '${favItem.originalTitle}'
                      : '${favItem.originalName}',
                  style: Styles.styleText22,
                ),
              ),
              CustomRating(
                favItem: favItem,
              ),
              const Row(
                children: [
                  CustomGenreShapeSaved(
                    detailsGenre: 'Action',
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  CustomGenreShapeSaved(
                    detailsGenre: 'war',
                  ),
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
