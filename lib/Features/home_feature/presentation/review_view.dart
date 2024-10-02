import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/review_view_body.dart';

class ReviewView extends StatelessWidget {
  const ReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: ReviewViewBody(),
    );
  }
}
