import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/details_model/details_model.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_trailer_player.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_duration_time.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_rating.dart';

class TrailerRatingDurationRow extends StatelessWidget {
  const TrailerRatingDurationRow({super.key, required this.detailsModel});

  final DetailsModel detailsModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          width: 5,
        ),
        const CustomTrailerPlayer(),
        const SizedBox(
          width: 10,
        ),
        DetailsRating(
          detailsModel: detailsModel,
        ),
        const SizedBox(
          width: 10,
        ),
        DetailsDurationTime(
          detailsModel: detailsModel,
        ),
      ],
    );
  }
}
