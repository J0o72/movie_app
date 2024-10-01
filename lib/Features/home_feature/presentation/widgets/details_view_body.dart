import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_back_arrow_icon.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_bookmark_icon.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_genre_shape_saved.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_row.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_actors_list_view.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_custom_poster.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_read_more_text.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_review_item.dart';
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
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
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
          ),
        ),
      ],
    );
  }
}

class DetailsViewBodyInformation extends StatelessWidget {
  const DetailsViewBodyInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const Text(
            "Breaking Bad",
            style: Styles.styleText28,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomGenreShapeSaved(),
              SizedBox(
                width: 10,
              ),
              CustomGenreShapeSaved(),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const TrailerRatingDurationRow(),
          const SizedBox(
            height: 10,
          ),
          const ReadMoreText(
            text:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque vehicula libero eget felis hendrerit, ut facilisis libero dapibus. Aenean ut odio eros. Curabitur auctor feugiat orci, ac facilisis est interdum nec. Nam commodo ligula at felis tincidunt, et vestibulum enim facilisis. Sed congue non felis a viverra. Donec condimentum lorem eu nisi consequat, a ultricies lorem varius. Vivamus ultricies non arcu a molestie. Donec ut ipsum tortor. Donec ac lorem ac eros scelerisque dictum.',
          ),
          CustomRow(
            leftText: "Actors",
            onTap: () {},
            style: Styles.styleText26,
            horizontalPadding: 10,
          ),
          const ActorsListView(),
          const SizedBox(
            height: 10,
          ),
          CustomRow(
            leftText: "Reviews",
            onTap: () {},
            style: Styles.styleText26,
            horizontalPadding: 10,
          ),
          const DetailsReviewItem(),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
