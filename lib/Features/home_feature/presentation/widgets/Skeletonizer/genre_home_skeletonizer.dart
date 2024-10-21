import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:skeletonizer/skeletonizer.dart';

class GenreHomeSkeletonizer extends StatelessWidget {
  const GenreHomeSkeletonizer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          return Skeletonizer(
            enabled: true,
            child: Container(
              width: 130,
              height: 50,
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  "Youssef abdallah",
                  style: Styles.styleText22,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
