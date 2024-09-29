import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_app_bar.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_carousel_slider.dart';
import 'package:movie_app/constants.dart';

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
              children: [
                SizedBox(
                  height: 20,
                ),
                CustomCarouselSliderView(),
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
