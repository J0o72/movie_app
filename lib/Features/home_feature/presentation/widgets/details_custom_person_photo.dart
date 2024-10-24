import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/data/models/actor_model/actor_model.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/casts_model.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/Skeletonizer/details_reviews_custom_person_photo_skeletonizer.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/core/utils/styles.dart';

class DetailsCustomPersonPhoto extends StatelessWidget {
  const DetailsCustomPersonPhoto({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 50,
    this.castsModel,
    this.actorDetails,
  });

  final double width, height, borderRadius;
  final CastsModel? castsModel;
  final ActorModel? actorDetails;

  final String image = "https://image.tmdb.org/t/p/original";

  @override
  Widget build(BuildContext context) {
    return castsModel != null
        ? Container(
            decoration: BoxDecoration(
              border: Border.all(color: kMainColor),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            width: width,
            height: height,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: castsModel!.profilePath != null
                    ? '$image' '${castsModel!.profilePath}'
                    : "",
                errorWidget: (context, url, error) => Center(
                  child: Text(
                    "${castsModel!.name?.substring(0, 2)}",
                    style: Styles.styleText18.copyWith(color: Colors.white),
                  ),
                ),
                placeholder: (context, url) => const Center(
                  child: DetailsReviewsCustomPersonPhotoSkeletonizer(),
                ),
              ),
            ),
          )
        : Container(
            decoration: BoxDecoration(
              border: Border.all(color: kMainColor),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            width: width,
            height: height,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: actorDetails!.profilePath != null
                    ? '$image' '${actorDetails!.profilePath}'
                    : "",
                errorWidget: (context, url, error) => Center(
                  child: Text(
                    "${actorDetails!.name?.substring(0, 2)}",
                    style: Styles.styleText18.copyWith(color: Colors.white),
                  ),
                ),
                placeholder: (context, url) => const Center(
                  child: DetailsReviewsCustomPersonPhotoSkeletonizer(),
                ),
              ),
            ),
          );
  }
}
