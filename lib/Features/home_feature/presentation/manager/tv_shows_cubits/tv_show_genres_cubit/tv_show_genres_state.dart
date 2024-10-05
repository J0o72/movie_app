part of 'tv_show_genres_cubit.dart';

sealed class TvShowGenresState extends Equatable {
  const TvShowGenresState();

  @override
  List<Object> get props => [];
}

final class TvShowGenresInitial extends TvShowGenresState {}

final class TvShowGenresSuccess extends TvShowGenresState {
  final List<GenresModel> genre;

  const TvShowGenresSuccess({required this.genre});
}

final class TvShowGenresLoading extends TvShowGenresState {}

final class TvShowGenresFailure extends TvShowGenresState {
  final String errorMessage;

  const TvShowGenresFailure({required this.errorMessage});
}
