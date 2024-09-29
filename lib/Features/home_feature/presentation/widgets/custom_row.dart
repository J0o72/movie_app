import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/core/utils/styles.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({
    super.key,
    required this.leftText,
  });

  final String leftText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftText,
            style: Styles.styleText28,
          ),
          GestureDetector(
            onTap: () {},
            child: const Text(
              "See All",
              style: Styles.styleText20,
            ),
          ),
        ],
      ),
    );
  }
}
