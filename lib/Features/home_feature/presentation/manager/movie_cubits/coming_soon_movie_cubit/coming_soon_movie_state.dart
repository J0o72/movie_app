part of 'coming_soon_movie_cubit.dart';

sealed class ComingSoonMovieState extends Equatable {
  const ComingSoonMovieState();

  @override
  List<Object> get props => [];
}

final class ComingSoonMovieInitial extends ComingSoonMovieState {}

final class ComingSoonMovieSuccess extends ComingSoonMovieState {
  final List<MovieModel> comingSoonMovies;

  const ComingSoonMovieSuccess({required this.comingSoonMovies});
}

final class ComingSoonMovieFailure extends ComingSoonMovieState {
  final String errorMessage;

  const ComingSoonMovieFailure({required this.errorMessage});
}

final class ComingSoonMovieLoading extends ComingSoonMovieState {}
