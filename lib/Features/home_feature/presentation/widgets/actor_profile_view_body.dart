import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/actor_profile_Information.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/actor_profile_background_image.dart';

class ActorProfileViewBody extends StatelessWidget {
  const ActorProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          ActorProfileBackgroundImage(),
          ActorProfileInformation(),
        ],
      ),
    );
  }
}
