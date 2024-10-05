part of 'genre_movie_cubit.dart';

sealed class GenreMovieState extends Equatable {
  const GenreMovieState();

  @override
  List<Object> get props => [];
}

final class GenreMovieInitial extends GenreMovieState {}

final class GenreMovieSuccess extends GenreMovieState {
  final List<GenresModel> genre;

  const GenreMovieSuccess({required this.genre});
}

final class GenreMovieLoading extends GenreMovieState {}

final class GenreMovieFailure extends GenreMovieState {
  final String errorMessage;

  const GenreMovieFailure({required this.errorMessage});
}
