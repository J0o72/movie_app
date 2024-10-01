import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/styles.dart';

class DetailsDurationTime extends StatelessWidget {
  const DetailsDurationTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.watch_later_rounded,
          size: 32,
          color: Colors.white,
        ),
        SizedBox(
          width: 5,
        ),
        Column(
          children: [
            Text(
              "Duration",
              style: Styles.styleText16,
            ),
            Row(
              children: [
                Text(
                  "125min",
                  style: Styles.styleText20,
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
