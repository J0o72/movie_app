import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_back_arrow_icon.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_bookmark_icon.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_genre_shape_saved.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_custom_poster.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_trailer_rating_duration_row.dart';
import 'package:movie_app/core/utils/styles.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DetailsViewBodyContent(),
    );
  }
}

class DetailsViewBodyContent extends StatelessWidget {
  const DetailsViewBodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Stack(
          children: [
            DetailsCustomPoster(),
            CustomBookmarkIcon(
              rightPos: 20,
              topPos: 40,
            ),
            CustomBackArrowIcon(),
          ],
        ),
        DetailsViewBodyInformation(),
      ],
    );
  }
}

class DetailsViewBodyInformation extends StatelessWidget {
  const DetailsViewBodyInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "Breaking Bad",
          style: Styles.styleText28,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomGenreShapeSaved(),
            SizedBox(
              width: 10,
            ),
            CustomGenreShapeSaved(),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        TrailerRatingDurationRow(),
      ],
    );
  }
}
