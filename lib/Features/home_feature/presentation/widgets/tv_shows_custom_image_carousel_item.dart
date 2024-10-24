import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/details_view_navigator_model.dart';
import 'package:movie_app/Features/home_feature/data/models/tv_shows_model/tv_shows_model.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/save_to_fav_cubit/save_to_fav_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/saved_cubit/saved_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/Skeletonizer/image_placeholder_skeletonizer.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_bookmark_icon.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/shared_preference.dart';
import 'package:movie_app/core/widgets/show_snack_bar.dart';

class TvShowsCustomImageCarouselItem extends StatefulWidget {
  const TvShowsCustomImageCarouselItem({super.key, required this.tvShow});

  final TvShowsModel tvShow;

  @override
  State<TvShowsCustomImageCarouselItem> createState() =>
      _TvShowsCustomImageCarouselItemState();
}

class _TvShowsCustomImageCarouselItemState
    extends State<TvShowsCustomImageCarouselItem> {
  final String imageUrl = "https://image.tmdb.org/t/p/original";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            DetailsViewNavigatorModel detailsViewNavigatorModel =
                DetailsViewNavigatorModel(
                    fromWhere: 'tv', id: widget.tvShow.id!);
            GoRouter.of(context)
                .push(AppRouter.kDetailsView, extra: detailsViewNavigatorModel);
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.4,
              errorWidget: (context, url, error) => const Icon(Icons.error),
              placeholder: (context, url) => ImagePlaceholderSkeletonizer(
                height: MediaQuery.of(context).size.height * 0.13,
              ),
              imageUrl: "$imageUrl${widget.tvShow.posterPath}",
            ),
          ),
        ),
        CustomBookmarkIcon(
          rightPos: 5,
          topPos: 5,
          isBookmarked: savedTvShows.contains(widget.tvShow.id),
          onPressed: () {
            // print(widget.tvShowsModel!.id);
            if (savedTvShows.contains(widget.tvShow.id)) {
              Map<String, dynamic> body = {
                'media_id': widget.tvShow.id,
                'media_type': 'tv',
                'favorite': false,
              };
              BlocProvider.of<SaveToFavCubit>(context).saveToFav(body: body);
              BlocProvider.of<SavedCubit>(context).fetchFavList();

              savedTvShows.remove(widget.tvShow.id);
              saveItems();

              showSnackBar(
                  context, '${widget.tvShow.name} removed from Favorite');
              setState(() {});
            } else {
              Map<String, dynamic> body = {
                'media_id': widget.tvShow.id,
                'media_type': 'tv',
                'favorite': true,
              };
              BlocProvider.of<SaveToFavCubit>(context).saveToFav(body: body);
              BlocProvider.of<SavedCubit>(context).fetchFavList();

              savedTvShows.add(widget.tvShow.id!);
              saveItems();

              showSnackBar(context, '${widget.tvShow.name} added to Favorite');
              setState(() {});
            }
          },
        ),
      ],
    );
  }
}
