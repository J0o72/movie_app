import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/actor_profile_background_image.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_custom_person_photo.dart';
import 'package:movie_app/constants.dart';

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

class ActorProfileInformation extends StatelessWidget {
  const ActorProfileInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.2,
      left: MediaQuery.of(context).size.width * 0.2,
      child: const Column(
        children: [
          DetailsCustomPersonPhoto(
            width: 250,
            height: 250,
            borderRadius: 150,
          ),
        ],
      ),
    );
  }
}
