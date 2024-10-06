import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/data/models/movie_model/movie_model.dart';
import 'package:movie_app/Features/home_feature/data/models/tv_shows_model/tv_shows_model.dart';
import 'package:movie_app/Features/home_feature/data/repos/collections_repo/collections_repo.dart';

part 'collections_state.dart';

class CollectionsCubit extends Cubit<CollectionsState> {
  CollectionsCubit(this.collectionsRepo) : super(CollectionsInitial());

  final CollectionsRepo collectionsRepo;

  Future<void> fetchCollectionOf({required String collectionOf}) async {
    emit(CollectionsLoading());

    var result =
        await collectionsRepo.fetchCollectionsOf(collectionOf: collectionOf);

    result.fold((failure) {
      emit(
        CollectionsFailure(errorMessage: failure.errMessage),
      );
    }, (collections) {
      emit(
        CollectionsSuccess(collection: collections),
      );
    });
  }

  Future<void> fetchTVShowsCollectionOf({required String collectionOf}) async {
    emit(CollectionsLoading());

    var result = await collectionsRepo.fetchTvShowsCollectionsOf(
        collectionOf: collectionOf);

    result.fold((failure) {
      emit(
        CollectionsFailure(errorMessage: failure.errMessage),
      );
    }, (collections) {
      emit(
        CollectionsSuccess(tvCollection: collections),
      );
    });
  }
}
