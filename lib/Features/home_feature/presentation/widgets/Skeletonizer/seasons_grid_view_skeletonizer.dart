import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SeasonsGridViewSkeletonizer extends StatelessWidget {
  const SeasonsGridViewSkeletonizer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(left: 15),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.4 / 2,
      ),
      itemBuilder: (context, index) {
        return Skeletonizer(
          enabled: true,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: AspectRatio(
                  aspectRatio: 2.8 / 3.5,
                  child: Image.asset(
                    'assets/images/movie_welcome_screen_bg.jpg',
                    fit: BoxFit.cover,
                  )),
            ),
          ),
        );
      },
    );
  }
}