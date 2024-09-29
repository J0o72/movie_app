import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_app_bar.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_carousel_slider.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_row.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/genres_list_view.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/now_playing_list_view.dart';

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
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
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
                      NowPlayingListView(),
                      CustomRow(
                        leftText: "Top Rating",
                      ),
                      NowPlayingListView(),
                      CustomRow(
                        leftText: "Upcoming",
                      ),
                      NowPlayingListView(),
                    ],
                  ),
                ),
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
