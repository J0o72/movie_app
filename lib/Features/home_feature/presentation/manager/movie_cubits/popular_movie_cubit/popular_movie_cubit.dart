import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/Features/home_feature/data/models/movie_model/movie_model.dart';
import 'package:movie_app/Features/home_feature/data/repos/movie_repo/movie_repo.dart';

part 'popular_movie_state.dart';

class PopularMovieCubit extends Cubit<PopularMovieState> {
  PopularMovieCubit(this.movieRepo) : super(PopularMovieInitial());

  final MovieRepo movieRepo;

  Future<void> fetchPopularMovies() async {
    emit(PopularMovieLoading());

    var result = await movieRepo.fetchPopularMovies();

    result.fold((failure) {
      emit(
        PopularMovieFailure(errorMessage: failure.errMessage),
      );
    }, (popularMovies) {
      emit(
        PopularMovieSuccess(popularMovies: popularMovies),
      );
    });
  }
}
