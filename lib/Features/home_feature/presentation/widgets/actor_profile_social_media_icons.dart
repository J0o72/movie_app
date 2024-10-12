import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_app/Features/home_feature/data/models/actor_model/actor_social_media.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/actor_profile_social_icon.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/core/utils/functions/url_launcher.dart';

class ActorProfileSocialMediaIcons extends StatelessWidget {
  const ActorProfileSocialMediaIcons({
    super.key,
    required this.actorSocialMedia,
  });

  final ActorSocialMedia actorSocialMedia;
  final String facebookLink = 'https://www.facebook.com/';
  final String instagramLink = 'https://www.instagram.com/';
  final String xLink = 'https://x.com/';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ActorProfileSocialIcon(
          icon: FontAwesomeIcons.facebook,
          iconColor: kMainColor,
          onTap: () async {
            await urllauncher(
                context, '$facebookLink${actorSocialMedia.facebookId}');
          },
        ),
        const SizedBox(
          width: 20,
        ),
        ActorProfileSocialIcon(
          icon: FontAwesomeIcons.instagram,
          iconColor: Colors.red,
          onTap: () async {
            await urllauncher(
                context, '$instagramLink${actorSocialMedia.instagramId}');
          },
        ),
        const SizedBox(
          width: 20,
        ),
        ActorProfileSocialIcon(
          icon: FontAwesomeIcons.xTwitter,
          iconColor: Colors.grey,
          onTap: () async {
            await urllauncher(context, '$xLink${actorSocialMedia.twitterId}');
          },
        ),
      ],
    );
  }
}
