import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_app/Features/home_feature/data/models/actor_model/actor_social_media.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/actor_profile_social_icon.dart';
import 'package:movie_app/constants.dart';

class ActorProfileSocialMediaIcons extends StatelessWidget {
  const ActorProfileSocialMediaIcons({
    super.key,
    required this.actorSocialMedia,
  });

  final ActorSocialMedia actorSocialMedia;

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ActorProfileSocialIcon(
          icon: FontAwesomeIcons.facebook,
          iconColor: kMainColor,
        ),
        SizedBox(
          width: 20,
        ),
        ActorProfileSocialIcon(
          icon: FontAwesomeIcons.instagram,
          iconColor: Colors.red,
        ),
        SizedBox(
          width: 20,
        ),
        ActorProfileSocialIcon(
          icon: FontAwesomeIcons.xTwitter,
          iconColor: Colors.grey,
        ),
      ],
    );
  }
}
