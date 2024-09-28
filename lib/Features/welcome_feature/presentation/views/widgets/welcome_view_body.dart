import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/Features/welcome_feature/presentation/views/widgets/custom_blurred_container.dart';
import 'package:movie_app/Features/welcome_feature/presentation/views/widgets/custom_welcome_view_bg.dart';

class WelcomeViewBody extends StatelessWidget {
  const WelcomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        WelcomeViewBackground(),
        CustomBlurredContainer(),
      ],
    );
  }
}
