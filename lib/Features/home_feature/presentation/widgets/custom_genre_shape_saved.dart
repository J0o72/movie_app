import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/core/utils/styles.dart';

class CustomGenreShapeSaved extends StatelessWidget {
  const CustomGenreShapeSaved({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: kMainColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(32),
      ),
      child: const Text(
        "Fantasy",
        style: Styles.styleText16,
      ),
    );
  }
}