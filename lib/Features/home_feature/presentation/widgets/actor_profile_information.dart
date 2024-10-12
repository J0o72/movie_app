import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/Features/home_feature/data/models/actor_model/actor_known_for.dart';
import 'package:movie_app/Features/home_feature/data/models/actor_model/actor_model.dart';
import 'package:movie_app/Features/home_feature/data/models/actor_model/actor_social_media.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/actor_profile_birth_location.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/actor_profile_social_media_icons.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_row.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_custom_person_photo.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_read_more_text.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/now_playing_item.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/styles.dart';

class ActorProfileInformation extends StatelessWidget {
  const ActorProfileInformation({
    super.key,
    required this.actorDetails,
    required this.actorSocialMedia,
    required this.actorCredits,
  });

  final ActorModel actorDetails;
  final ActorSocialMedia actorSocialMedia;
  final List<ActorKnownFor> actorCredits;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DetailsCustomPersonPhoto(
              width: 250,
              height: 250,
              borderRadius: 150,
              actorDetails: actorDetails,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              actorDetails.name!,
              style: Styles.styleText26,
            ),
            ActorProfileBirthLocation(
              actorBirthLocation: actorDetails.placeOfBirth!,
            ),
            const SizedBox(
              height: 10,
            ),
            ActorProfileSocialMediaIcons(
              actorSocialMedia: actorSocialMedia,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ReadMoreText(
                text: actorDetails.biography!,
              ),
            ),
            CustomRow(
              leftText: "Known For",
              onTap: () {
                GoRouter.of(context).push(AppRouter.kMovieCollevionView);
              },
              horizontalPadding: 20,
            ),
            ActorProfileKnownFor(
              actorCredits: actorCredits,
            ),
          ],
        ),
      ),
    );
  }
}

class ActorProfileKnownFor extends StatelessWidget {
  const ActorProfileKnownFor({super.key, required this.actorCredits});

  final List<ActorKnownFor> actorCredits;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: actorCredits.length,
          itemBuilder: (context, index) {
            return NowPlayingItem(
              // movieModel: actorCredits[index],
              actorCredits: actorCredits[index],
            );
          },
        ),
      ),
    );
  }
}
