import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/movie_collection_view_body.dart';

class MovieCollecionView extends StatelessWidget {
  const MovieCollecionView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: MovieCollecionViewBody(),
    );
  }
}
