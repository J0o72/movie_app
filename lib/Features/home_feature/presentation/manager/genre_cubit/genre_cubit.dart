import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/data/models/genres_model/genres_model.dart';
import 'package:movie_app/Features/home_feature/data/repos/genre_repo/genre_repo.dart';

part 'genre_state.dart';

class GenreCubit extends Cubit<GenreState> {
  GenreCubit(this.genreRepo) : super(GenreInitial());

  final GenreRepo genreRepo;

  Future<void> fetchGenreMovies() async {
    emit(GenreLoading());

    var result = await genreRepo.fetchGenresMovies();

    result.fold((failure) {
      emit(
        GenreFailure(errorMessage: failure.errMessage),
      );
    }, (genres) {
      emit(
        GenreSuccess(genre: genres),
      );
    });
  }

  Future<void> fetchGenresTVShows() async {
    emit(GenreLoading());

    var result = await genreRepo.fetchGenresTvShows();

    result.fold((failure) {
      emit(
        GenreFailure(errorMessage: failure.errMessage),
      );
    }, (genres) {
      emit(
        GenreSuccess(genre: genres),
      );
    });
  }
}
