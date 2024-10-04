part of 'on_the_air_tv_shows_cubit.dart';

sealed class OnTheAirTvShowsState extends Equatable {
  const OnTheAirTvShowsState();

  @override
  List<Object> get props => [];
}

final class OnTheAirTvShowsInitial extends OnTheAirTvShowsState {}

final class OnTheAirTvShowsLoading extends OnTheAirTvShowsState {}

final class OnTheAirTvShowsSuccess extends OnTheAirTvShowsState {
  final List<TvShowsModel> onTheAirTVShows;

  const OnTheAirTvShowsSuccess({required this.onTheAirTVShows});
}

final class OnTheAirTvShowsFailure extends OnTheAirTvShowsState {
  final String errorMessage;

  const OnTheAirTvShowsFailure({required this.errorMessage});
}
