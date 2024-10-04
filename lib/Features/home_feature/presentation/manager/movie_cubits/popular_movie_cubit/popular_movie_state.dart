part of 'popular_movie_cubit.dart';

sealed class PopularMovieState extends Equatable {
  const PopularMovieState();

  @override
  List<Object> get props => [];
}

final class PopularMovieInitial extends PopularMovieState {}

final class PopularMovieSuccess extends PopularMovieState {
  final List<MovieModel> popularMovies;

  const PopularMovieSuccess({required this.popularMovies});
}

final class PopularMovieFailure extends PopularMovieState {
  final String errorMessage;

  const PopularMovieFailure({required this.errorMessage});
}

final class PopularMovieLoading extends PopularMovieState {}
