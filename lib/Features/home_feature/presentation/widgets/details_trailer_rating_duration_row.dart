import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_trailer_player.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_duration_time.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_rating.dart';

class TrailerRatingDurationRow extends StatelessWidget {
  const TrailerRatingDurationRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 15,
        ),
        CustomTrailerPlayer(),
        SizedBox(
          width: 10,
        ),
        DetailsRating(),
        SizedBox(
          width: 10,
        ),
        DetailsDurationTime(),
        // CustomRating(),
        // CustomDurationTime(),
        SizedBox(
          width: 15,
        ),
      ],
    );
  }
}
