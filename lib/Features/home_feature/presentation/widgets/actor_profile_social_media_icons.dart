import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/actor_social_media_cubit/actor_social_media_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/actor_profile_social_icon.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/core/utils/functions/url_launcher.dart';
import 'package:movie_app/core/widgets/custom_error_failure.dart';
import 'package:movie_app/core/widgets/show_snack_bar.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ActorProfileSocialMediaIcons extends StatelessWidget {
  const ActorProfileSocialMediaIcons({
    super.key,
  });

  final String facebookLink = 'https://www.facebook.com/';
  final String instagramLink = 'https://www.instagram.com/';
  final String xLink = 'https://x.com/';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActorSocialMediaCubit, ActorSocialMediaState>(
      builder: (context, state) {
        if (state is ActorSocialMediaSuccess) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ActorProfileSocialIcon(
                icon: FontAwesomeIcons.facebook,
                iconColor: kMainColor,
                onTap: () async {
                  if (state.actorSocialMedia.facebookId != null) {
                    await urllauncher(context,
                        '$facebookLink${state.actorSocialMedia.facebookId}');
                  } else {
                    showSnackBar(context, 'Doesn\'t have Facebook');
                  }
                },
              ),
              const SizedBox(
                width: 20,
              ),
              ActorProfileSocialIcon(
                icon: FontAwesomeIcons.instagram,
                iconColor: Colors.red,
                onTap: () async {
                  if (state.actorSocialMedia.instagramId != null) {
                    await urllauncher(context,
                        '$instagramLink${state.actorSocialMedia.instagramId}');
                  } else {
                    showSnackBar(context, 'Doesn\'t have Instagram');
                  }
                },
              ),
              const SizedBox(
                width: 20,
              ),
              ActorProfileSocialIcon(
                icon: FontAwesomeIcons.xTwitter,
                iconColor: Colors.grey,
                onTap: () async {
                  if (state.actorSocialMedia.twitterId != null) {
                    await urllauncher(
                        context, '$xLink${state.actorSocialMedia.twitterId}');
                  } else {
                    showSnackBar(context, 'Doesn\'t have Twitter');
                  }
                },
              ),
            ],
          );
        } else if (state is ActorSocialMediaFailure) {
          return const CustomErrorFailure();
        } else {
          return const ActorProfileSocialMediaIconsSkeletonizer();
        }
      },
    );
  }
}

class ActorProfileSocialMediaIconsSkeletonizer extends StatelessWidget {
  const ActorProfileSocialMediaIconsSkeletonizer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Skeletonizer(
      enabled: true,
      child: Row(
        children: [
          Icon(
            Icons.facebook,
            color: Colors.blue,
            size: 36,
          ),
          Icon(
            FontAwesomeIcons.instagram,
            color: Colors.red,
            size: 36,
          ),
          Icon(
            FontAwesomeIcons.xTwitter,
            color: Colors.grey,
            size: 36,
          ),
        ],
      ),
    );
  }
}
