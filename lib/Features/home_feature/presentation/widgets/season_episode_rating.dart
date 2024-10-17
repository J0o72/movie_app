import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/data/models/episode_model/episode_model.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/core/utils/styles.dart';

class SeasonEpisodeRating extends StatelessWidget {
  const SeasonEpisodeRating({super.key, required this.episodeModel});

  final EpisodeModel episodeModel;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 5,
      top: 5,
      child: Container(
        width: 70,
        height: 40,
        decoration: BoxDecoration(
            color: kMainColor.withOpacity(0.9),
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.star_rate_rounded,
              size: 26,
              color: Colors.amber,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, right: 5),
              child: Text(
                '${episodeModel.voteAverage}',
                style: Styles.styleText20.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
