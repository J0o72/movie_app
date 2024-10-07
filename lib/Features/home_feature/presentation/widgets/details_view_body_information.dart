import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_genre_shape_saved.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_row.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_actors_list_view.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_read_more_text.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_review_list_view.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_trailer_rating_duration_row.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/now_playing_list_view.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/styles.dart';

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
            leftText: "Casts",
            onTap: () {
              GoRouter.of(context).push(AppRouter.kCastView);
            },
            style: Styles.styleText26,
            horizontalPadding: 10,
          ),
          const ActorsListView(),
          const SizedBox(
            height: 10,
          ),
          CustomRow(
            leftText: "Reviews",
            onTap: () {
              GoRouter.of(context).push(AppRouter.kReviewView);
            },
            style: Styles.styleText26,
            horizontalPadding: 10,
          ),
          const SizedBox(
            height: 5,
          ),
          const DetailsReviewListView(),
          const SizedBox(
            height: 10,
          ),
          CustomRow(
            leftText: "More Like This",
            onTap: () {
              GoRouter.of(context).push(AppRouter.kMovieCollevionView);
            },
            style: Styles.styleText26,
            horizontalPadding: 10,
          ),
          // const NowPlayingListView(
          //   horizontalPadding: 10,
          // ),
        ],
      ),
    );
  }
}
