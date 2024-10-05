import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/data/models/movie_model/movie_model.dart';
import 'package:movie_app/Features/home_feature/data/repos/movie_repo/movie_repo.dart';

part 'coming_soon_movie_state.dart';

class ComingSoonMovieCubit extends Cubit<ComingSoonMovieState> {
  ComingSoonMovieCubit(this.movieRepo) : super(ComingSoonMovieInitial());

  final MovieRepo movieRepo;

  Future<void> fetchComingSoonMovies() async {
    emit(ComingSoonMovieLoading());

    var result = await movieRepo.fetchComingSoonMovies();

    result.fold((failure) {
      emit(
        ComingSoonMovieFailure(errorMessage: failure.errMessage),
      );
    }, (comingSoonMovies) {
      emit(
        ComingSoonMovieSuccess(comingSoonMovies: comingSoonMovies),
      );
    });
  }
}
