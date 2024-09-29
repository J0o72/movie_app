import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/styles.dart';

class CustomDurationTime extends StatelessWidget {
  const CustomDurationTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.access_time,
          color: Colors.white,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          "125min",
          style: Styles.styleText16,
        ),
      ],
    );
  }
}
