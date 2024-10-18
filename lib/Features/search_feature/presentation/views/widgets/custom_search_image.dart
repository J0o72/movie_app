import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/details_view_navigator_model.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_poster.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/details_custom_person_photo.dart';
import 'package:movie_app/Features/search_feature/data/models/search_model/search_results.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/styles.dart';

class CustomSearchImage extends StatelessWidget {
  const CustomSearchImage({super.key, required this.searchResultsModel});

  final String imageUrl = "https://image.tmdb.org/t/p/original";
  final SearchResultsModel searchResultsModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (searchResultsModel.mediaType == 'movie' ||
            searchResultsModel.mediaType == 'tv') {
          DetailsViewNavigatorModel detailsViewNavigatorModel =
              DetailsViewNavigatorModel(
                  fromWhere: searchResultsModel.mediaType!,
                  id: searchResultsModel.id!);
          GoRouter.of(context)
              .push(AppRouter.kDetailsView, extra: detailsViewNavigatorModel);
        } else if (searchResultsModel.mediaType == 'person') {
          GoRouter.of(context).push(
            AppRouter.kActorProfileView,
            extra: searchResultsModel.id,
          );
        }
      },
      child: searchResultsModel.mediaType != 'person'
          ? ClipRRect(
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
                  child: ImagePlaceholderSkeletonizer(
                    height: 200,
                  ),
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: searchResultsModel.profilePath != null
                      ? '$imageUrl' '${searchResultsModel.profilePath}'
                      : "",
                  errorWidget: (context, url, error) => Center(
                    child: Text(
                      "${searchResultsModel.name}",
                      style: Styles.styleText18.copyWith(color: Colors.white),
                    ),
                  ),
                  placeholder: (context, url) => const Center(
                    child: DetailsReviewsCustomPersonPhotoSkeletonizer(),
                  ),
                ),
              ),
            ),
    );
  }
}
