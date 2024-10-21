import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DetailsReviewsCustomPersonPhotoSkeletonizer extends StatelessWidget {
  const DetailsReviewsCustomPersonPhotoSkeletonizer({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: SizedBox(
        width: 80,
        height: 80,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              'assets/images/movie_welcome_screen_bg.jpg',
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
