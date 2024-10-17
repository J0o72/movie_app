part of 'season_episode_cubit.dart';

sealed class SeasonEpisodeState extends Equatable {
  const SeasonEpisodeState();

  @override
  List<Object> get props => [];
}

final class SeasonEpisodeInitial extends SeasonEpisodeState {}

final class SeasonEpisodeSuccess extends SeasonEpisodeState {
  final List<EpisodeModel> episodes;

  const SeasonEpisodeSuccess({required this.episodes});
}

final class SeasonEpisodeFailure extends SeasonEpisodeState {
  final String errorMessage;

  const SeasonEpisodeFailure({required this.errorMessage});
}

final class SeasonEpisodeLoading extends SeasonEpisodeState {}
