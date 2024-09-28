import 'package:flutter/material.dart';

class WelcomeViewBackground extends StatelessWidget {
  const WelcomeViewBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/images/movie_welcome_screen_bg.jpg"),
        ),
      ),
    );
  }
}
