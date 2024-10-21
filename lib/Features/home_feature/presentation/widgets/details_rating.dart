import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/details_model/details_model.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/tv_shows_details/tv_shows_details_model.dart';
import 'package:movie_app/core/utils/styles.dart';

class DetailsRating extends StatelessWidget {
  const DetailsRating({
    super.key,
    this.detailsModel,
    this.tvShowsDetailsModel,
  });

  final DetailsModel? detailsModel;
  final TvShowsDetailsModel? tvShowsDetailsModel;

  @override
  Widget build(BuildContext context) {
    return detailsModel != null
        ? Row(
            children: [
              const Icon(
                Icons.star_rate_rounded,
                size: 45,
                color: Colors.yellow,
              ),
              const SizedBox(
                width: 1,
              ),
              Column(
                children: [
                  const Text(
                    "Rating",
                    style: Styles.styleText16,
                  ),
                  Row(
                    children: [
                      Text(
                        detailsModel!.voteAverage.toString().substring(0, 3),
                        style: Styles.styleText20,
                      ),
                      const Text("/10")
                    ],
                  ),
                ],
              )
            ],
          )
        : Row(
            children: [
              const Icon(
                Icons.star_rate_rounded,
                size: 45,
                color: Colors.yellow,
              ),
              const SizedBox(
                width: 1,
              ),
              Column(
                children: [
                  const Text(
                    "Rating",
                    style: Styles.styleText16,
                  ),
                  Row(
                    children: [
                      Text(
                        tvShowsDetailsModel!.voteAverage
                            .toString()
                            .substring(0, 3),
                        style: Styles.styleText20,
                      ),
                      const Text("/10")
                    ],
                  ),
                ],
              )
            ],
          );
  }
}
