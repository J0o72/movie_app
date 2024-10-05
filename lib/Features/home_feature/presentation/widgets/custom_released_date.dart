import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/data/models/movie_model/movie_model.dart';
import 'package:movie_app/core/utils/styles.dart';

class CustomReleasedDate extends StatelessWidget {
  const CustomReleasedDate({
    super.key,
    required this.movieModel,
  });

  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '(${movieModel.releaseDate.toString().substring(0, 4)})',
          style: Styles.styleText16,
        ),
      ],
    );
  }
}
