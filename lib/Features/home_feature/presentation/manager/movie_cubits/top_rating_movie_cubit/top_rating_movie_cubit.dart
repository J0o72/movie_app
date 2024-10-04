import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/Features/home_feature/data/models/movie_model/movie_model.dart';
import 'package:movie_app/Features/home_feature/data/repos/movie_repo/movie_repo.dart';

part 'top_rating_movie_state.dart';

class TopRatingMovieCubit extends Cubit<TopRatingMovieState> {
  TopRatingMovieCubit(this.movieRepo) : super(TopRatingMovieInitial());

  final MovieRepo movieRepo;

  Future<void> fetchTopRatingMovies() async {
    emit(PopularMovieLoading());

    var result = await movieRepo.fetchTopRatingMovies();

    result.fold((failure) {
      emit(
        PopularMovieFailure(errorMessage: failure.errMessage),
      );
    }, (topRatingMovies) {
      emit(
        PopularMovieSuccess(topRatingMovies: topRatingMovies),
      );
    });
  }
}