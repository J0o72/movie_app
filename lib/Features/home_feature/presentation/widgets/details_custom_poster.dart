import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/details_model/details_model.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_circular_loading.dart';

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
        imageUrl: '$image${detailsModel.posterPath}',
        errorWidget: (context, url, error) => const Icon(Icons.error),
        placeholder: (context, url) => const Center(
          child: CustomCircularLoading(),
        ),
      ),
    );
  }
}
