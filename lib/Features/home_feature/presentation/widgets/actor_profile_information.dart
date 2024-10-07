import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/actor_profile_birth_location.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/actor_profile_social_media_icons.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_row.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_custom_person_photo.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_read_more_text.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/now_playing_list_view.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/styles.dart';

class ActorProfileInformation extends StatelessWidget {
  const ActorProfileInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // const DetailsCustomPersonPhoto(
            //   width: 250,
            //   height: 250,
            //   borderRadius: 150,
            // ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Chris Hemsworth",
              style: Styles.styleText26,
            ),
            const ActorProfileBirthLocation(),
            const SizedBox(
              height: 10,
            ),
            const ActorProfileSocialMediaIcons(),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const ReadMoreText(
                  text:
                      "Christopher \"Chris\" Hemsworth was born on August 11, 1983 in Melbourne, Victoria, Australia to Leonie Hemsworth (née van Os), an English teacher & Craig Hemsworth, a social-services counselor. His brothers are actors, Liam Hemsworth & Luke Hemsworth; he is of Dutch (from his immigrant maternal grandfather), Irish, English, Scottish, and German ancestry. His uncle, by marriage, was Rod Ansell, the bushman who inspired the comedy film Crocodile Dundee (1986).Chris saw quite a bit of the country in his youth"),
            ),
            CustomRow(
              leftText: "Known For",
              onTap: () {
                GoRouter.of(context).push(AppRouter.kMovieCollevionView);
              },
              horizontalPadding: 20,
            ),
            const NowPlayingListView(),
          ],
        ),
      ),
    );
  }
}
