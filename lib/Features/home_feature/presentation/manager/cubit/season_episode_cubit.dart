import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/data/models/episode_model/episode_model.dart';
import 'package:movie_app/Features/home_feature/data/repos/season_repo/season_repo.dart';

part 'season_episode_state.dart';

class SeasonEpisodeCubit extends Cubit<SeasonEpisodeState> {
  SeasonEpisodeCubit(this.seasonRepo) : super(SeasonEpisodeInitial());

  final SeasonRepo seasonRepo;

  Future<void> fetchSeasonEpisodes(
      {required num seasonId, required num seasonNumber}) async {
    emit(SeasonEpisodeLoading());
    var result = await seasonRepo.fetchSeasonEpisodes(
        seriesId: seasonId, seasonNumber: seasonNumber);

    result.fold((failure) {
      emit(SeasonEpisodeFailure(errorMessage: failure.errMessage));
    }, (episodes) {
      emit(SeasonEpisodeSuccess(episodes: episodes));
    });
  }
}
