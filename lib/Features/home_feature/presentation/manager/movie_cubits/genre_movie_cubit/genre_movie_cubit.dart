import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/data/models/genres_model/genres_model.dart';
import 'package:movie_app/Features/home_feature/data/repos/movie_repo/movie_repo.dart';

part 'genre_movie_state.dart';

class GenreMovieCubit extends Cubit<GenreMovieState> {
  GenreMovieCubit(this.movieRepo) : super(GenreMovieInitial());

  final MovieRepo movieRepo;

  Future<void> fetchGenreMovies() async {
    emit(GenreMovieLoading());

    var result = await movieRepo.fetchGenresMovies();

    result.fold((failure) {
      emit(
        GenreMovieFailure(errorMessage: failure.errMessage),
      );
    }, (genres) {
      emit(
        GenreMovieSuccess(genre: genres),
      );
    });
  }
}
