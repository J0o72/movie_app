import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/data/models/tv_shows_model/tv_shows_model.dart';
import 'package:movie_app/Features/home_feature/data/repos/tv_shows_repo/tv_shows_repo.dart';

part 'top_rating_tv_shows_state.dart';

class TopRatingTvShowsCubit extends Cubit<TopRatingTvShowsState> {
  TopRatingTvShowsCubit(this.tvShowsRepo) : super(TopRatingTvShowsInitial());

  final TVShowsRepo tvShowsRepo;

  Future<void> fetchTopRatingTVShows() async {
    emit(TopRatingTvShowsLoading());

    var result = await tvShowsRepo.fetchTopRatingTVShows();

    result.fold(
      (failure) {
        emit(
          TopRatingTvShowsFailure(errorMessage: failure.errMessage),
        );
      },
      (topRatingTVShows) {
        emit(
          TopRatingTvShowsSuccess(topRatingTVShows: topRatingTVShows),
        );
      },
    );
  }
}
