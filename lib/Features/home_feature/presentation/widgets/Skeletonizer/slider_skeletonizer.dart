import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SliderSkeletonizer extends StatelessWidget {
  const SliderSkeletonizer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.2,
          child: Image.asset(
            'assets/images/movie_welcome_screen_bg.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
