import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/core/utils/styles.dart';

class SeasonEpisodesImageTitle extends StatelessWidget {
  const SeasonEpisodesImageTitle({
    super.key,
    required this.episodeNumber,
  });

  final int episodeNumber;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 5,
      bottom: 5,
      child: Container(
        width: 100,
        height: 40,
        decoration: BoxDecoration(
            color: kMainColor.withOpacity(0.9),
            borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Text(
            "Episode $episodeNumber",
            style: Styles.styleText18,
          ),
        ),
      ),
    );
  }
}
