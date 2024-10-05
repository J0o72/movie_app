import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/data/models/tv_shows_model/tv_shows_model.dart';
import 'package:movie_app/Features/home_feature/data/repos/tv_shows_repo/tv_shows_repo.dart';

part 'popular_tv_shows_state.dart';

class PopularTvShowsCubit extends Cubit<PopularTvShowsState> {
  PopularTvShowsCubit(this.tvShowsRepo) : super(PopularTvShowsInitial());

  final TVShowsRepo tvShowsRepo;

  Future<void> fetchPopularTvShows() async {
    emit(PopularTvShowsLoading());

    var result = await tvShowsRepo.fetchPopularTVShows();

    result.fold(
      (failure) {
        emit(
          PopularTvShowsFailure(errorMessage: failure.errMessage),
        );
      },
      (popularTVShows) {
        emit(
          PopularTvShowsSuccess(popularTVShows: popularTVShows),
        );
      },
    );
  }
}
