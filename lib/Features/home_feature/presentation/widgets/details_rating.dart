import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/styles.dart';

class DetailsRating extends StatelessWidget {
  const DetailsRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.star_rate_rounded,
          size: 45,
          color: Colors.yellow,
        ),
        SizedBox(
          width: 1,
        ),
        Column(
          children: [
            Text(
              "Rating",
              style: Styles.styleText16,
            ),
            Row(
              children: [
                Text(
                  "8.5",
                  style: Styles.styleText20,
                ),
                Text("/10")
              ],
            ),
          ],
        )
      ],
    );
  }
}
