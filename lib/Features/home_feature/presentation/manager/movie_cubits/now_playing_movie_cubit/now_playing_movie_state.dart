part of 'now_playing_movie_cubit.dart';

sealed class NowPlayingMovieState extends Equatable {
  const NowPlayingMovieState();

  @override
  List<Object> get props => [];
}

final class NowPlayingMovieInitial extends NowPlayingMovieState {}

final class NowPlayingMovieSuccess extends NowPlayingMovieState {
  final List<MovieModel> nowPlayingMovies;

  const NowPlayingMovieSuccess({required this.nowPlayingMovies});
}

final class NowPlayingMovieFailure extends NowPlayingMovieState {
  final String errorMessage;

  const NowPlayingMovieFailure({required this.errorMessage});
}

final class NowPlayingMovieLoading extends NowPlayingMovieState {}
