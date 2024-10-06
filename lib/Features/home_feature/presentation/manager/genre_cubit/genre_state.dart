part of 'genre_cubit.dart';

sealed class GenreState extends Equatable {
  const GenreState();

  @override
  List<Object> get props => [];
}

final class GenreInitial extends GenreState {}

final class GenreSuccess extends GenreState {
  final List<GenresModel> genre;

  const GenreSuccess({required this.genre});
}

final class GenreFailure extends GenreState {
  final String errorMessage;

  const GenreFailure({required this.errorMessage});
}

final class GenreLoading extends GenreState {}
