part of 'top_rating_tv_shows_cubit.dart';

sealed class TopRatingTvShowsState extends Equatable {
  const TopRatingTvShowsState();

  @override
  List<Object> get props => [];
}

final class TopRatingTvShowsInitial extends TopRatingTvShowsState {}

final class TopRatingTvShowsLoading extends TopRatingTvShowsState {}

final class TopRatingTvShowsSuccess extends TopRatingTvShowsState {
  final List<TvShowsModel> topRatingTVShows;

  const TopRatingTvShowsSuccess({required this.topRatingTVShows});
}

final class TopRatingTvShowsFailure extends TopRatingTvShowsState {
  final String errorMessage;

  const TopRatingTvShowsFailure({required this.errorMessage});
}
