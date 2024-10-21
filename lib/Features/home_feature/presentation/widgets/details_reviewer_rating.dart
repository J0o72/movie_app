import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/reviews_model/result.dart';
import 'package:movie_app/core/utils/styles.dart';

class ReviewerRating extends StatelessWidget {
  const ReviewerRating({super.key, required this.resultReviewsModel});

  final ResultReviewsModel resultReviewsModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: Icon(
            Icons.star_rate_rounded,
            size: 24,
            color: Colors.yellow,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          resultReviewsModel.authorDetails!.rating != null
              ? resultReviewsModel.authorDetails!.rating
                  .toString()
                  .substring(0, 3)
              : '0',
          textAlign: TextAlign.end,
          style: Styles.styleText20,
        ),
        const Text(
          "/10",
          textAlign: TextAlign.end,
        ),
      ],
    );
  }
}
