import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_back_arrow_icon.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_bookmark_icon.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_circular_loading.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_genre_shape_saved.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_trailer_player.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_custom_poster.dart';
import 'package:movie_app/constants.dart';
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
        CustomTrailerPlayer(),
      ],
    );
  }
}
