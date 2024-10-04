part of 'coming_soon_movie_cubit.dart';

sealed class ComingSoonMovieState extends Equatable {
  const ComingSoonMovieState();

  @override
  List<Object> get props => [];
}

final class ComingSoonMovieInitial extends ComingSoonMovieState {}

final class NowPlayingMovieSuccess extends ComingSoonMovieState {
  final List<MovieModel> comingSoonMovies;

  const NowPlayingMovieSuccess({required this.comingSoonMovies});
}

final class NowPlayingMovieFailure extends ComingSoonMovieState {
  final String errorMessage;

  const NowPlayingMovieFailure({required this.errorMessage});
}

final class NowPlayingMovieLoading extends ComingSoonMovieState {}
