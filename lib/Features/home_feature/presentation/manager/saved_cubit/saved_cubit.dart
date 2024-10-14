import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/data/models/favorite_model/favorite_model/fav_result.dart';
import 'package:movie_app/Features/home_feature/data/repos/saved_repo/saved_repo.dart';

part 'saved_state.dart';

class SavedCubit extends Cubit<SavedState> {
  SavedCubit(this.savedRepo) : super(SavedInitial());

  final SavedRepo savedRepo;

  Future<void> fetchFavList() async {
    emit(SavedLoading());
    var result = await savedRepo.favoriteList();
    result.fold((failure) {
      emit(
        SavedFailure(errorMessage: failure.errMessage),
      );
    }, (favList) {
      emit(
        SavedSuccess(favList: favList),
      );
    });
  }
}
