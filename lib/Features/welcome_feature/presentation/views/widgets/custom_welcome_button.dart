import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/styles.dart';

class CustomWelcomeButton extends StatelessWidget {
  const CustomWelcomeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: ElevatedButton(
        onPressed: () {
          GoRouter.of(context).push(AppRouter.kHomeView);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: kMainColor,
          padding: const EdgeInsets.all(15),
          // side: const BorderSide(color: Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Enter Now",
              style: Styles.styleText20,
            ),
            Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 26,
            ),
          ],
        ),
      ),
    );
  }
}
