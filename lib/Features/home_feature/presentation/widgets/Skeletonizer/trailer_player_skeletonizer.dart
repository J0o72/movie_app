import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TrailerPlayerSkeletonizer extends StatelessWidget {
  const TrailerPlayerSkeletonizer({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff7c889f).withOpacity(0.3),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              alignment: Alignment.centerLeft,
              onPressed: () {},
              icon: const Icon(
                Icons.play_arrow_rounded,
                size: 55,
                color: Colors.red,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 12),
              child: Text(
                "Trailer",
                style: Styles.styleText22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
