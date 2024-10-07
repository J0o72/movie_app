import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';

class CustomBookmarkIcon extends StatelessWidget {
  const CustomBookmarkIcon({
    super.key,
    required this.rightPos,
    required this.topPos,
  });

  final double? rightPos, topPos;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: rightPos,
      top: topPos,
      child: CircleAvatar(
        backgroundColor: kMainColor.withOpacity(0.8),
        child: IconButton(
          padding: EdgeInsets.zero,
          alignment: Alignment.center,
          onPressed: () {},
          icon: const Icon(
            Icons.bookmark_border,
            color: Colors.white,
            size: 32,
          ),
        ),
      ),
    );
  }
}
