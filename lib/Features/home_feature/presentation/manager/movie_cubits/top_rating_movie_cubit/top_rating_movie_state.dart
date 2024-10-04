part of 'top_rating_movie_cubit.dart';

sealed class TopRatingMovieState extends Equatable {
  const TopRatingMovieState();

  @override
  List<Object> get props => [];
}

final class TopRatingMovieInitial extends TopRatingMovieState {}

final class TopRatingMovieSuccess extends TopRatingMovieState {
  final List<MovieModel> topRatingMovies;

  const TopRatingMovieSuccess({required this.topRatingMovies});
}

final class TopRatingMovieFailure extends TopRatingMovieState {
  final String errorMessage;

  const TopRatingMovieFailure({required this.errorMessage});
}

final class TopRatingMovieLoading extends TopRatingMovieState {}
