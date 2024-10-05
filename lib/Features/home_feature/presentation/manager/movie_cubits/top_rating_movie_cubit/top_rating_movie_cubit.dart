import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/data/models/movie_model/movie_model.dart';
import 'package:movie_app/Features/home_feature/data/repos/movie_repo/movie_repo.dart';

part 'top_rating_movie_state.dart';

class TopRatingMovieCubit extends Cubit<TopRatingMovieState> {
  TopRatingMovieCubit(this.movieRepo) : super(TopRatingMovieInitial());

  final MovieRepo movieRepo;

  Future<void> fetchTopRatingMovies() async {
    emit(TopRatingMovieLoading());

    var result = await movieRepo.fetchTopRatingMovies();

    result.fold((failure) {
      emit(
        TopRatingMovieFailure(errorMessage: failure.errMessage),
      );
    }, (topRatingMovies) {
      emit(
        TopRatingMovieSuccess(topRatingMovies: topRatingMovies),
      );
    });
  }
}
