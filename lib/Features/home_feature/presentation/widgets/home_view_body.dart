import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_app_bar.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_carousel_slider.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_circular_loading.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_poster.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_row.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/genre_item.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/genres_list_view.dart';
import 'package:movie_app/core/utils/styles.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(
          appBar: AppBar(),
        ),
        body: const TabBarView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                CustomCarouselSliderView(),
                SizedBox(
                  height: 20,
                ),
                CustomRow(
                  leftText: "Genres",
                ),
                SizedBox(
                  height: 10,
                ),
                GenresListView(),
                SizedBox(
                  height: 20,
                ),
                CustomRow(
                  leftText: "Now Playing",
                ),
                SizedBox(
                  height: 10,
                ),
                NowPlayingItem(),
              ],
            ),
            Center(
              child: Text("TV Shows"),
            ),
          ],
        ),
      ),
    );
  }
}

class NowPlayingItem extends StatelessWidget {
  const NowPlayingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomPoster(),
          Text(
            textAlign: TextAlign.center,
            "Breaking Bad (2020000000)",
            style: Styles.styleText18,
          ),
        ],
      ),
    );
  }
}
