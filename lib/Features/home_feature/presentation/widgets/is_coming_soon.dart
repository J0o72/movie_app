import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/core/utils/styles.dart';

class IsComingSoon extends StatelessWidget {
  const IsComingSoon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 5,
      left: 5,
      child: Container(
        decoration: BoxDecoration(
          color: kMainColor.withOpacity(0.9),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Text(
            'UpComing',
            style: Styles.styleText16,
          ),
        ),
      ),
    );
  }
}
