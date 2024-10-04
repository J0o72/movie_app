import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/Features/home_feature/data/models/tv_shows_model/tv_shows_model.dart';
import 'package:movie_app/Features/home_feature/data/repos/tv_shows_repo/tv_shows_repo.dart';

part 'airing_today_tv_shows_state.dart';

class AiringTodayTvShowsCubit extends Cubit<AiringTodayTvShowsState> {
  AiringTodayTvShowsCubit(this.tvShowsRepo)
      : super(AiringTodayTvShowsInitial());

  final TVShowsRepo tvShowsRepo;

  Future<void> fetchAiringTodayTVShows() async {
    emit(AiringTodayTvShowsLoading());

    var result = await tvShowsRepo.fetchAiringTodayTVShows();

    result.fold(
      (failure) {
        emit(
          AiringTodayTvShowsFailure(errorMessage: failure.errMessage),
        );
      },
      (airingTodayTVShows) {
        emit(
          AiringTodayTvShowsSuccess(airingTodayTVShows: airingTodayTVShows),
        );
      },
    );
  }
}
