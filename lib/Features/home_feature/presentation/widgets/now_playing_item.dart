import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_duration_time.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_poster.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_rating.dart';
import 'package:movie_app/core/utils/styles.dart';

class NowPlayingItem extends StatelessWidget {
  const NowPlayingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 15),
      child: SizedBox(
        width: 177,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomPoster(),
            Text(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              "Breaking Bad (2020)",
              style: Styles.styleText18,
            ),
            Row(
              children: [
                CustomRating(),
                Spacer(),
                CustomDurationTime(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
