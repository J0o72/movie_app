import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/details_model/details_model.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/tv_shows_details/tv_shows_details_model.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_poster.dart';
import 'package:movie_app/core/utils/styles.dart';

class DetailsCustomPoster extends StatelessWidget {
  const DetailsCustomPoster({
    super.key,
    this.detailsModel,
    this.tvShowsDetailsModel,
  });
  final String image = "https://image.tmdb.org/t/p/original";
  final DetailsModel? detailsModel;
  final TvShowsDetailsModel? tvShowsDetailsModel;

  @override
  Widget build(BuildContext context) {
    return detailsModel != null
        ? SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: detailsModel!.posterPath != null
                  ? '$image${detailsModel!.posterPath}'
                  : '',
              errorWidget: (context, url, error) => Center(
                child: Text(
                  "${detailsModel!.originalTitle}",
                  style: Styles.styleText18.copyWith(color: Colors.white),
                ),
              ),
              placeholder: (context, url) => Center(
                child: ImagePlaceholderSkeletonizer(
                  height: MediaQuery.of(context).size.height * 0.5,
                ),
              ),
            ),
          )
        : SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: tvShowsDetailsModel!.posterPath != null
                  ? '$image${tvShowsDetailsModel!.posterPath}'
                  : '',
              errorWidget: (context, url, error) => Center(
                child: Text(
                  "${tvShowsDetailsModel!.name}",
                  style: Styles.styleText18.copyWith(color: Colors.white),
                ),
              ),
              placeholder: (context, url) => Center(
                child: ImagePlaceholderSkeletonizer(
                  height: MediaQuery.of(context).size.height * 0.5,
                ),
              ),
            ),
          );
  }
}
