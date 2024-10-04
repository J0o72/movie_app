part of 'popular_tv_shows_cubit.dart';

sealed class PopularTvShowsState extends Equatable {
  const PopularTvShowsState();

  @override
  List<Object> get props => [];
}

final class PopularTvShowsInitial extends PopularTvShowsState {}

final class PopularTvShowsLoading extends PopularTvShowsState {}

final class PopularTvShowsSuccess extends PopularTvShowsState {
  final List<TvShowsModel> popularTVShows;

  const PopularTvShowsSuccess({required this.popularTVShows});
}

final class PopularTvShowsFailure extends PopularTvShowsState {
  final String errorMessage;

  const PopularTvShowsFailure({required this.errorMessage});
}
