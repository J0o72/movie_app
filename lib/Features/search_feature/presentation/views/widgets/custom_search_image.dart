import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_circular_loading.dart';
import 'package:movie_app/core/widgets/custom_error_failure.dart';

class CustomSearchImage extends StatelessWidget {
  const CustomSearchImage({super.key});

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

          imageUrl:
              'http://www.impawards.com/2024/posters/joker_folie_a_deux_ver5.jpg',

          // movieModel!.posterPath != null
          //     ? '$imageUrl${movieModel!.posterPath}'
          //     : "",

          errorWidget: (context, url, error) => const CustomErrorFailure()
          // Center(
          //   child: Text(
          //     textAlign: TextAlign.center,
          //     "${movieModel?.title}",
          //     style: Styles.styleText18.copyWith(color: Colors.white),
          //   ),
          // ),
          ,
          placeholder: (context, url) => const Center(
            child: CustomCircularLoading(),
          ),
        ),
      ),
    );
  }
}
