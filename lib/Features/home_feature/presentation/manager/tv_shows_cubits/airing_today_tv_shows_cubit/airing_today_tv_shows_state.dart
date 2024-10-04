part of 'airing_today_tv_shows_cubit.dart';

sealed class AiringTodayTvShowsState extends Equatable {
  const AiringTodayTvShowsState();

  @override
  List<Object> get props => [];
}

final class AiringTodayTvShowsInitial extends AiringTodayTvShowsState {}

final class AiringTodayTvShowsLoading extends AiringTodayTvShowsState {}

final class AiringTodayTvShowsSuccess extends AiringTodayTvShowsState {
  final List<TvShowsModel> airingTodayTVShows;

  const AiringTodayTvShowsSuccess({required this.airingTodayTVShows});
}

final class AiringTodayTvShowsFailure extends AiringTodayTvShowsState {
  final String errorMessage;

  const AiringTodayTvShowsFailure({required this.errorMessage});
}
