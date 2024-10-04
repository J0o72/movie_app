part of 'top_rating_movie_cubit.dart';

sealed class TopRatingMovieState extends Equatable {
  const TopRatingMovieState();

  @override
  List<Object> get props => [];
}

final class TopRatingMovieInitial extends TopRatingMovieState {}

final class PopularMovieSuccess extends TopRatingMovieState {
  final List<MovieModel> topRatingMovies;

  const PopularMovieSuccess({required this.topRatingMovies});
}

final class PopularMovieFailure extends TopRatingMovieState {
  final String errorMessage;

  const PopularMovieFailure({required this.errorMessage});
}

final class PopularMovieLoading extends TopRatingMovieState {}
