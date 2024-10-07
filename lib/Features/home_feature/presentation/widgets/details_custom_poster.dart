import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/details_model/details_model.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_circular_loading.dart';
import 'package:movie_app/core/utils/styles.dart';

class DetailsCustomPoster extends StatelessWidget {
  const DetailsCustomPoster({
    super.key,
    required this.detailsModel,
  });
  final String image = "https://image.tmdb.org/t/p/original";
  final DetailsModel detailsModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width,
      child: CachedNetworkImage(
        fit: BoxFit.fill,
        imageUrl: detailsModel.posterPath != null
            ? '$image${detailsModel.posterPath}'
            : '',
        errorWidget: (context, url, error) => Center(
          child: Text(
            "${detailsModel.originalTitle}",
            style: Styles.styleText18.copyWith(color: Colors.white),
          ),
        ),
        placeholder: (context, url) => const Center(
          child: CustomCircularLoading(),
        ),
      ),
    );
  }
}
