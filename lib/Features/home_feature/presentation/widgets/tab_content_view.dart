import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_carousel_slider.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_row.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/genres_list_view.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/now_playing_list_view.dart';
import 'package:movie_app/core/utils/app_routes.dart';

class TabContentView extends StatelessWidget {
  const TabContentView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        const CustomCarouselSliderView(),
        const SizedBox(
          height: 20,
        ),
        CustomRow(
          leftText: "Genres",
          onTap: () {
            GoRouter.of(context).push(AppRouter.kGenreView);
          },
        ),
        const SizedBox(
          height: 10,
        ),
        const GenresHomeListView(),
        const SizedBox(
          height: 20,
        ),
        CustomRow(
          leftText: "Now Playing",
          onTap: () {
            GoRouter.of(context).push(AppRouter.kMovieCollevionView);
          },
        ),
        const NowPlayingListView(),
        CustomRow(
          leftText: "Top Rating",
          onTap: () {
            GoRouter.of(context).push(AppRouter.kMovieCollevionView);
          },
        ),
        const NowPlayingListView(),
        CustomRow(
          leftText: "Upcoming",
          onTap: () {
            GoRouter.of(context).push(AppRouter.kMovieCollevionView);
          },
        ),
        const NowPlayingListView(),
      ],
    );
  }
}
