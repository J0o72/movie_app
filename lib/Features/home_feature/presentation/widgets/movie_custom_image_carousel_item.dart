import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/details_view_navigator_model.dart';
import 'package:movie_app/Features/home_feature/data/models/movie_model/movie_model.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/save_to_fav_cubit/save_to_fav_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_bookmark_icon.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_circular_loading.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/shared_preference.dart';

class MovieCustomImageCarouselItem extends StatefulWidget {
  const MovieCustomImageCarouselItem({super.key, required this.movie});

  final MovieModel movie;

  @override
  State<MovieCustomImageCarouselItem> createState() =>
      _MovieCustomImageCarouselItemState();
}

class _MovieCustomImageCarouselItemState
    extends State<MovieCustomImageCarouselItem> {
  final String imageUrl = "https://image.tmdb.org/t/p/original";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            DetailsViewNavigatorModel detailsViewNavigatorModel =
                DetailsViewNavigatorModel(
                    fromWhere: 'movie', id: widget.movie.id!);
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
              placeholder: (context, url) => const CustomCircularLoading(),
              imageUrl: "$imageUrl${widget.movie.posterPath}",
            ),
          ),
        ),
        CustomBookmarkIcon(
          rightPos: 5,
          topPos: 5,
          isBookmarked: savedMovies.contains(widget.movie.id),
          onPressed: () {
            if (savedMovies.contains(widget.movie.id)) {
              Map<String, dynamic> body = {
                'media_id': widget.movie.id,
                'media_type': 'movie',
                'favorite': false,
              };
              BlocProvider.of<SaveToFavCubit>(context).saveToFav(body: body);
              savedMovies.remove(widget.movie.id);
              saveItems();

              print('${widget.movie.id} removed');
              setState(() {});
            } else {
              Map<String, dynamic> body = {
                'media_id': widget.movie.id,
                'media_type': 'movie',
                'favorite': true,
              };
              BlocProvider.of<SaveToFavCubit>(context).saveToFav(body: body);
              savedMovies.add(widget.movie.id!);
              saveItems();

              print('${widget.movie.id} added');
              setState(() {});
            }
          },
        ),
      ],
    );
  }
}
