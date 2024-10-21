import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/reviews_model/result.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_reviewer_rating.dart';
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
