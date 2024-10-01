import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/constants.dart';

class CustomBackArrowIcon extends StatelessWidget {
  const CustomBackArrowIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20,
      top: 40,
      child: CircleAvatar(
        backgroundColor: kMainColor.withOpacity(0.8),
        child: IconButton(
          padding: EdgeInsets.zero,
          alignment: Alignment.center,
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 32,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
