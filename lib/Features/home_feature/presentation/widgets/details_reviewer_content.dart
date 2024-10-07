import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/reviews_model/result.dart';
import 'package:movie_app/core/utils/styles.dart';

class DetailsReviewerContent extends StatelessWidget {
  const DetailsReviewerContent({
    super.key,
    required this.resultReviewsModel,
  });

  final ResultReviewsModel resultReviewsModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            resultReviewsModel.author!,
            style: Styles.styleText20,
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            resultReviewsModel.content.toString(),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 3,
          ),
          Row(
            children: [
              ReviewerRating(
                resultReviewsModel: resultReviewsModel,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(
                  right: 15,
                ),
                child: Text(
                  resultReviewsModel.createdAt.toString().substring(0, 10),
                  style: Styles.styleText16
                      .copyWith(color: Colors.white.withOpacity(0.5)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

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
          resultReviewsModel.authorDetails!.rating.toString().substring(0, 3),
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
