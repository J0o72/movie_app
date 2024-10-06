import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/collections_cubit/collections_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_circular_loading.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_poster_saved.dart';
import 'package:movie_app/core/widgets/custom_error_failure.dart';

class MovieCollectionGridView extends StatefulWidget {
  const MovieCollectionGridView({super.key, required this.fromWhere});

  final String fromWhere;

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
          .fetchCollectionOf(collectionOf: widget.fromWhere);
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
              itemCount: state.collection!.length,
              itemBuilder: (context, index) {
                return CutsomPosterSaved(
                  movieModel: state.collection![index],
                );
              },
            ),
          );
        } else if (state is CollectionsFailure) {
          return const CustomErrorFailure();
        } else {
          return const CustomCircularLoading();
        }
      },
    );
  }
}
