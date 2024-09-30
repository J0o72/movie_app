import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/styles.dart';

class GenreItemHome extends StatelessWidget {
  const GenreItemHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 40,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: const Color(0xff7c889f),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: Text(
          "Action",
          style: Styles.styleText18,
        ),
      ),
    );
  }
}
