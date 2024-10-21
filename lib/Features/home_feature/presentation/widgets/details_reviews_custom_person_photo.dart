import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/reviews_model/result.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/Skeletonizer/details_reviews_custom_person_photo_skeletonizer.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/core/utils/styles.dart';

class DetailsReviewsCustomPersonPhoto extends StatelessWidget {
  const DetailsReviewsCustomPersonPhoto(
      {super.key,
      required this.width,
      required this.height,
      this.borderRadius = 50,
      required this.reviewsModel});

  final double width, height, borderRadius;
  final ResultReviewsModel reviewsModel;

  final String image = "https://image.tmdb.org/t/p/original";

  @override
  Widget build(BuildContext context) {
    return Container(
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
          imageUrl: reviewsModel.authorDetails?.avatarPath != null
              ? '$image' '${reviewsModel.authorDetails?.avatarPath}'
              : "",
          errorWidget: (context, url, error) => Center(
            child: Text(
              "${reviewsModel.author?.substring(0, 2)}",
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
