import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/save_to_fav_cubit/save_to_fav_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/manager/saved_cubit/saved_cubit.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/custom_circular_loading.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/saved_dismissible_background.dart';
import 'package:movie_app/Features/home_feature/presentation/widgets/saved_view_item.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/core/utils/shared_preference.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:movie_app/core/widgets/custom_error_failure.dart';

class SavedListView extends StatefulWidget {
  const SavedListView({super.key});

  @override
  State<SavedListView> createState() => _SavedListViewState();
}

class _SavedListViewState extends State<SavedListView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedCubit, SavedState>(
      builder: (context, state) {
        if (state is SavedSuccess) {
          if (state.favList.isNotEmpty) {
            return ListView.builder(
              itemCount: state.favList.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: ValueKey<String>(index.toString()),
                  direction: DismissDirection.horizontal,
                  background: const SavedDismissibleBackground(
                    mainAxisAlignment: MainAxisAlignment.start,
                  ),
                  secondaryBackground: const SavedDismissibleBackground(
                    mainAxisAlignment: MainAxisAlignment.end,
                  ),
                  onDismissed: (direction) {
                    setState(() {
                      if (state.favList[index].title != null) {
                        removeSavedItem(state, index, context,
                            mediaType: 'movie', savedItems: savedMovies);

                        print('${state.favList[index].id} removed');
                      } else {
                        removeSavedItem(state, index, context,
                            mediaType: 'tv', savedItems: savedTvShows);

                        print('${state.favList[index].id} removed');
                      }
                    });
                  },
                  child: SavedViewItem(
                    favItem: state.favList[index],
                  ),
                );
              },
            );
          } else {
            return const Center(
                child: Text(
              'No Saved Movies/TvShows yet',
              style: Styles.styleText20,
            ));
          }
        } else if (state is SavedFailure) {
          return const CustomErrorFailure();
        } else {
          return const CustomCircularLoading();
        }
      },
    );
  }

  void removeSavedItem(SavedSuccess state, int index, BuildContext context,
      {required String mediaType, required List<int> savedItems}) {
    Map<String, dynamic> body = {
      'media_id': state.favList[index].id,
      'media_type': mediaType,
      'favorite': false,
    };
    BlocProvider.of<SaveToFavCubit>(context).saveToFav(body: body);

    savedItems.remove(state.favList[index].id);
    saveItems();
    BlocProvider.of<SavedCubit>(context).fetchFavList();
  }
}
