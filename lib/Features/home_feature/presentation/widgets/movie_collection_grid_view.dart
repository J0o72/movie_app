import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/collections_cubit/collections_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_poster_saved.dart';
import 'package:movie_app/core/widgets/custom_error_failure.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MovieCollectionGridView extends StatefulWidget {
  const MovieCollectionGridView({super.key, required this.fromWhere, this.id});

  final String fromWhere;
  final String? id;

  @override
  State<MovieCollectionGridView> createState() =>
      _MovieCollectionGridViewState();
}

class _MovieCollectionGridViewState extends State<MovieCollectionGridView> {
  @override
  void initState() {
    super.initState();
    if (widget.fromWhere == 'now_playing') {
      BlocProvider.of<CollectionsCubit>(context)
          .fetchCollectionOf(collectionOf: widget.fromWhere);
    } else if (widget.fromWhere == 'top_rated') {
      BlocProvider.of<CollectionsCubit>(context)
          .fetchCollectionOf(collectionOf: widget.fromWhere);
    } else if (widget.fromWhere == 'upcoming') {
      BlocProvider.of<CollectionsCubit>(context)
          .fetchComingSoonMoviesCollection();
    } else if (widget.fromWhere == 'airing_today') {
      BlocProvider.of<CollectionsCubit>(context)
          .fetchTVShowsCollectionOf(collectionOf: widget.fromWhere);
    } else if (widget.fromWhere == 'on_the_air') {
      BlocProvider.of<CollectionsCubit>(context)
          .fetchTVShowsCollectionOf(collectionOf: widget.fromWhere);
    } else if (widget.fromWhere == 'tv_top_rated') {
      BlocProvider.of<CollectionsCubit>(context)
          .fetchTVShowsCollectionOf(collectionOf: 'top_rated');
    } else if (widget.fromWhere == 'movie') {
      BlocProvider.of<CollectionsCubit>(context)
          .fetchSpecificGenreMovies(genreId: widget.id!);
    } else if (widget.fromWhere == 'TvShows') {
      BlocProvider.of<CollectionsCubit>(context)
          .fetchSpecificGenreTvShows(genreId: widget.id!);
    } else if (widget.fromWhere == 'genreMovie') {
      BlocProvider.of<CollectionsCubit>(context)
          .fetchSpecificGenreMovies(genreId: widget.id!);
    } else if (widget.fromWhere == 'genreTv') {
      BlocProvider.of<CollectionsCubit>(context)
          .fetchSpecificGenreTvShows(genreId: widget.id!);
    } else if (widget.fromWhere == 'moreTvLikeThis') {
      BlocProvider.of<CollectionsCubit>(context)
          .fetchTvMoreLikeThis(id: widget.id!);
    } else if (widget.fromWhere == 'moreMovieLikeThis') {
      BlocProvider.of<CollectionsCubit>(context)
          .fetchMovieMoreLikeThis(id: int.parse(widget.id!));
    } else if (widget.fromWhere == 'actor') {
      BlocProvider.of<CollectionsCubit>(context)
          .fetchActorCredits(actorID: widget.id!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CollectionsCubit, CollectionsState>(
      builder: (context, state) {
        if (state is CollectionsSuccess) {
          return Padding(
            padding: const EdgeInsets.only(left: 15),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.3 / 2,
              ),
              itemCount: state.collection?.length ??
                  state.tvCollection?.length ??
                  state.actorCredits!.length,
              itemBuilder: (context, index) {
                return state.collection != null
                    ? CutsomPosterSaved(
                        movieModel: state.collection![index],
                      )
                    : state.tvCollection != null
                        ? CutsomPosterSaved(
                            tvShowsModel: state.tvCollection![index],
                          )
                        : CutsomPosterSaved(
                            actorCredits: state.actorCredits![index],
                          );
              },
            ),
          );
        } else if (state is CollectionsFailure) {
          return const CustomErrorFailure();
        } else {
          return const MovieCollectionGridViewSkeletonizer();
        }
      },
    );
  }
}

class MovieCollectionGridViewSkeletonizer extends StatelessWidget {
  const MovieCollectionGridViewSkeletonizer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(left: 15),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.4 / 2,
      ),
      itemBuilder: (context, index) {
        return Skeletonizer(
          enabled: true,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: AspectRatio(
                  aspectRatio: 2.8 / 3.5,
                  child: Image.asset(
                    'assets/images/movie_welcome_screen_bg.jpg',
                    fit: BoxFit.cover,
                  )),
            ),
          ),
        );
      },
    );
  }
}
