import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_circular_loading.dart';
import 'package:movie_app/Features/search_feature/data/models/search_model/search_results.dart';
import 'package:movie_app/core/utils/styles.dart';

class CustomSearchImage extends StatelessWidget {
  const CustomSearchImage({super.key, required this.searchResultsModel});

  final String imageUrl = "https://image.tmdb.org/t/p/original";
  final SearchResultsModel searchResultsModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // DetailsViewNavigatorModel detailsViewNavigatorModel =
        //     DetailsViewNavigatorModel(fromWhere: 'movie', id: movieModel!.id!);
        // GoRouter.of(context)
        //     .push(AppRouter.kDetailsView, extra: detailsViewNavigatorModel);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: searchResultsModel.posterPath != null
              ? '$imageUrl${searchResultsModel.posterPath}'
              : "",
          errorWidget: (context, url, error) => Center(
            child: Text(
              textAlign: TextAlign.center,
              "${searchResultsModel.title}",
              style: Styles.styleText18.copyWith(color: Colors.white),
            ),
          ),
          placeholder: (context, url) => const Center(
            child: CustomCircularLoading(),
          ),
        ),
      ),
    );
  }
}
