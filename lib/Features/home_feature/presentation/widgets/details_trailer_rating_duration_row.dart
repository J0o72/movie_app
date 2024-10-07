import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/details_model/details_model.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/tv_shows_details/tv_shows_details_model.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_trailer_player.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_duration_time.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_rating.dart';

class TrailerRatingDurationRow extends StatelessWidget {
  const TrailerRatingDurationRow(
      {super.key, this.detailsModel, this.tvShowsDetailsModel});

  final DetailsModel? detailsModel;
  final TvShowsDetailsModel? tvShowsDetailsModel;

  @override
  Widget build(BuildContext context) {
    return detailsModel != null
        ? Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 5,
              ),
              const CustomTrailerPlayer(),
              const SizedBox(
                width: 10,
              ),
              DetailsRating(
                detailsModel: detailsModel!,
              ),
              const SizedBox(
                width: 10,
              ),
              DetailsDurationTime(
                detailsModel: detailsModel!,
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 5,
              ),
              const CustomTrailerPlayer(),
              const SizedBox(
                width: 10,
              ),
              DetailsRating(
                tvShowsDetailsModel: tvShowsDetailsModel!,
              ),
              const SizedBox(
                width: 10,
              ),
              DetailsDurationTime(
                tvShowsDetailsModel: tvShowsDetailsModel!,
              ),
            ],
          );
  }
}
