import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/Features/home_feature/data/models/tv_shows_model/tv_shows_model.dart';
import 'package:movie_app/Features/home_feature/data/repos/tv_shows_repo/tv_shows_repo.dart';

part 'on_the_air_tv_shows_state.dart';

class OnTheAirTvShowsCubit extends Cubit<OnTheAirTvShowsState> {
  OnTheAirTvShowsCubit(this.tvShowsRepo) : super(OnTheAirTvShowsInitial());

  final TVShowsRepo tvShowsRepo;

  Future<void> fetchOnTheAirTVShows() async {
    emit(OnTheAirTvShowsLoading());

    var result = await tvShowsRepo.fetchOnTheAirTVShows();

    result.fold(
      (failure) {
        emit(
          OnTheAirTvShowsFailure(errorMessage: failure.errMessage),
        );
      },
      (onTheAirTVShows) {
        emit(
          OnTheAirTvShowsSuccess(onTheAirTVShows: onTheAirTVShows),
        );
      },
    );
  }
}
