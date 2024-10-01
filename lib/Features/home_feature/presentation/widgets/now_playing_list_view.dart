import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/now_playing_item.dart';

class NowPlayingListView extends StatelessWidget {
  const NowPlayingListView({super.key, this.horizontalPadding = 20});

  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return const NowPlayingItem();
          },
        ),
      ),
    );
  }
}
