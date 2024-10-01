import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/core/utils/styles.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({
    super.key,
    required this.leftText,
    required this.onTap,
    this.style = Styles.styleText28,
    this.horizontalPadding = 15,
  });

  final String leftText;
  final Function() onTap;
  final TextStyle style;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftText,
            style: style,
          ),
          GestureDetector(
            onTap: onTap,
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
