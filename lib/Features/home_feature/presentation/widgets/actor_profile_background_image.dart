import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/data/models/actor_model/actor_model.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/Skeletonizer/image_placeholder_skeletonizer.dart';
import 'package:movie_app/core/utils/styles.dart';

class ActorProfileBackgroundImage extends StatelessWidget {
  const ActorProfileBackgroundImage({
    super.key,
    required this.actorDetails,
  });

  final ActorModel actorDetails;
  final String image = "https://image.tmdb.org/t/p/original";

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.3,
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: actorDetails.profilePath != null
              ? '$image${actorDetails.profilePath}'
              : '',
          errorWidget: (context, url, error) => actorDetails.profilePath != null
              ? Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    "${actorDetails.name}",
                    style: Styles.styleText18.copyWith(color: Colors.white),
                  ),
                )
              : Container(),
          placeholder: (context, url) => const Center(
            child: ImagePlaceholderSkeletonizer(
              height: 180,
            ),
          ),
        ),
      ),
    );
  }
}
