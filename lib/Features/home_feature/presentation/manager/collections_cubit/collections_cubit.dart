import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/data/models/movie_model/movie_model.dart';
import 'package:movie_app/Features/home_feature/data/repos/collections_repo/collections_repo.dart';

part 'collections_state.dart';

class CollectionsCubit extends Cubit<CollectionsState> {
  CollectionsCubit(this.collectionsRepo) : super(CollectionsInitial());

  final CollectionsRepo collectionsRepo;

  Future<void> fetchCollectionOf(
      {required String collectionOf, required String typeOf}) async {
    emit(CollectionsLoading());

    var result = await collectionsRepo.fetchCollectionsOf(
        collectionOf: collectionOf, typeOf: typeOf);

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
}
