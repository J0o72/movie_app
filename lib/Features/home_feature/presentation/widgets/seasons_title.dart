import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/styles.dart';

class SeasonsTitle extends StatelessWidget {
  const SeasonsTitle({
    super.key,
    required this.seasonNumber,
  });

  final String seasonNumber;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 2,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1),
        decoration: const BoxDecoration(
          color: Colors.black,
          boxShadow: [
            BoxShadow(
              blurRadius: 25,
              color: Colors.black,
              offset: Offset(0, 0),
              spreadRadius: 30,
            ),
          ],
        ),
        child: Center(
          child: Text(
            seasonNumber,
            style: Styles.styleText22.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
