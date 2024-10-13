import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/data/repos/saved_repo/saved_repo.dart';

part 'save_to_fav_state.dart';

class SaveToFavCubit extends Cubit<SaveToFavState> {
  SaveToFavCubit(this.savedRepo) : super(SaveToFavInitial());

  final SavedRepo savedRepo;

  Future<void> saveToFav({@required dynamic body}) async {
    emit(SaveToFavLoading());
    try {
      savedRepo.addToFav(body: body);
      emit(SaveToFavSuccess());
    } catch (e) {
      emit(SaveToFavFailure(errorMessage: e.toString()));
    }
  }
}
