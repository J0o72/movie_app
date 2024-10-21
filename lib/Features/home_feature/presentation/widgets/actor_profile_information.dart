import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/Features/home_feature/data/models/actor_model/actor_model.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/actor_profile_birth_location.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/actor_profile_known_for.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/actor_profile_social_media_icons.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_row.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_custom_person_photo.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_read_more_text.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/collection_model.dart';
import 'package:movie_app/core/utils/styles.dart';

class ActorProfileInformation extends StatelessWidget {
  const ActorProfileInformation({
    super.key,
    this.actorDetails,
  });

  final ActorModel? actorDetails;

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
              actorDetails!.name!,
              style: Styles.styleText26,
            ),
            actorDetails!.placeOfBirth != null
                ? ActorProfileBirthLocation(
                    actorBirthLocation: actorDetails!.placeOfBirth!,
                  )
                : Container(),
            const SizedBox(
              height: 20,
            ),
            const ActorProfileSocialMediaIcons(),
            const SizedBox(
              height: 20,
            ),
            actorDetails!.biography != ""
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ReadMoreText(
                      text: actorDetails!.biography!,
                    ),
                  )
                : const Text(''),
            CustomRow(
              leftText: "Known For",
              onTap: () {
                CollectionModel collectionModel = CollectionModel(
                  collectionName: 'actor',
                  collectionTitle: 'Known For',
                  id: actorDetails!.id.toString(),
                );
                GoRouter.of(context).push(AppRouter.kMovieCollevionView,
                    extra: collectionModel);
              },
              horizontalPadding: 20,
            ),
            const ActorProfileKnownFor(),
          ],
        ),
      ),
    );
  }
}
