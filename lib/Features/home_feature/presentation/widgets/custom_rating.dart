import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/styles.dart';

class CustomRating extends StatelessWidget {
  const CustomRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: Icon(
            Icons.star_rate_rounded,
            size: 24,
            color: Colors.yellow,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          "8.5",
          textAlign: TextAlign.end,
          style: Styles.styleText20,
        ),
        Text(
          "/10",
          textAlign: TextAlign.end,
        ),
      ],
    );
  }
}
