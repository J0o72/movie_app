import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Features/welcome_feature/presentation/views/widgets/custom_welcome_button.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/core/utils/styles.dart';

class CustomBlurredContainer extends StatelessWidget {
  const CustomBlurredContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Container(
        color: Colors.black.withOpacity(0.5),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome To ',
                  style: Styles.styleText28,
                ),
                Text(
                  'Movie App',
                  style: Styles.styleText28.copyWith(
                    color: mainColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  'Browser All Movies/Series and more',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomWelcomeButton(),
          ],
        ).frosted(
          blur: 3,
          frostColor: Colors.black,
        ),
      ),
    );
  }
}
