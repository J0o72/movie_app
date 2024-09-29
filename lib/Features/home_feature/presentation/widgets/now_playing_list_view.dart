import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/now_playing_item.dart';

class NowPlayingListView extends StatelessWidget {
  const NowPlayingListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
