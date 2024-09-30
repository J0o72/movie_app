import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';

class CustomBookmarkIcon extends StatelessWidget {
  const CustomBookmarkIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 5,
      top: 5,
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
