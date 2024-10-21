import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/reviews_model/result.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_reviewer_content.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_reviews_custom_person_photo.dart';

class DetailsReviewItem extends StatelessWidget {
  const DetailsReviewItem({super.key, required this.reviewsModel});

  final ResultReviewsModel reviewsModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DetailsReviewsCustomPersonPhoto(
            reviewsModel: reviewsModel,
            height: 70,
            width: 70,
          ),
          const SizedBox(
            width: 10,
          ),
          DetailsReviewerContent(
            resultReviewsModel: reviewsModel,
          ),
        ],
      ),
    );
  }
}
