import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/details_model/details_model.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/tv_shows_details/tv_shows_details_model.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/styles.dart';

class DetailsDurationTime extends StatelessWidget {
  const DetailsDurationTime({
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
                Icons.watch_later_rounded,
                size: 32,
                color: Colors.white,
              ),
              const SizedBox(
                width: 5,
              ),
              Column(
                children: [
                  const Text(
                    "Duration",
                    style: Styles.styleText16,
                  ),
                  Row(
                    children: [
                      Text(
                        "${detailsModel!.runtime} min",
                        style: Styles.styleText20,
                      ),
                    ],
                  ),
                ],
              )
            ],
          )
        : GestureDetector(
            onTap: () {
              print(tvShowsDetailsModel!.id);
              GoRouter.of(context)
                  .push(AppRouter.kSeasonsView, extra: tvShowsDetailsModel!.id);
            },
            child: Row(
              children: [
                const Icon(
                  Icons.video_library_rounded,
                  size: 32,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  children: [
                    const Text(
                      "Seasons",
                      style: Styles.styleText16,
                    ),
                    Row(
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          "${tvShowsDetailsModel!.numberOfSeasons}",
                          style: Styles.styleText20,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          );
  }
}
