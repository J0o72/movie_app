import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/Features/categories_feature/data/models/category_model.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/details_view_navigator_model.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_poster.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/styles.dart';

class CustomCategoryResultsImage extends StatelessWidget {
  const CustomCategoryResultsImage({
    super.key,
    required this.categoryModel,
  });

  final CategoryModel categoryModel;
  final String image = "https://image.tmdb.org/t/p/original";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            if (categoryModel.originalTitle != null) {
              DetailsViewNavigatorModel detailsViewNavigatorModel =
                  DetailsViewNavigatorModel(
                      fromWhere: 'movie', id: categoryModel.id!);
              GoRouter.of(context).push(AppRouter.kDetailsView,
                  extra: detailsViewNavigatorModel);
            } else {
              DetailsViewNavigatorModel detailsViewNavigatorModel =
                  DetailsViewNavigatorModel(
                      fromWhere: 'tv', id: categoryModel.id!);
              GoRouter.of(context).push(AppRouter.kDetailsView,
                  extra: detailsViewNavigatorModel);
            }
          },
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: AspectRatio(
                aspectRatio: 2.8 / 3.5,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: categoryModel.posterPath != null
                      ? '$image' '${categoryModel.posterPath!}'
                      : '',
                  errorWidget: (context, url, error) => Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      categoryModel.name ?? categoryModel.title!,
                      style: Styles.styleText18.copyWith(color: Colors.white),
                    ),
                  ),
                  placeholder: (context, url) => const Center(
                    child: ImagePlaceholderSkeletonizer(
                      height: 180,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        categoryModel.releaseDate != null
            ? categoryModel.releaseDate != ""
                ? DateTime.parse(categoryModel.releaseDate!)
                        .isAfter(DateTime.now())
                    ? const IsComingSoon()
                    : Container()
                : const IsComingSoon()
            : categoryModel.firstAirDate != ""
                ? DateTime.parse(categoryModel.firstAirDate!)
                        .isAfter(DateTime.now())
                    ? const IsComingSoon()
                    : Container()
                : const IsComingSoon(),
      ],
    );
  }
}
