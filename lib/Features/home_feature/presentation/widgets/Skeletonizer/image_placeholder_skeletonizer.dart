import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImagePlaceholderSkeletonizer extends StatelessWidget {
  const ImagePlaceholderSkeletonizer({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: SizedBox(
        height: height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: AspectRatio(
            aspectRatio: 2.8 / 3.5,
            child: Container(
              width: 50,
              height: 50,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
