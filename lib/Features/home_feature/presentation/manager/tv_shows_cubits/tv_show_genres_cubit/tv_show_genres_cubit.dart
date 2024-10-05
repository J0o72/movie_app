import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/data/models/genres_model/genres_model.dart';
import 'package:movie_app/Features/home_feature/data/repos/tv_shows_repo/tv_shows_repo.dart';

part 'tv_show_genres_state.dart';

class TvShowGenresCubit extends Cubit<TvShowGenresState> {
  TvShowGenresCubit(this.tvShowsRepo) : super(TvShowGenresInitial());

  final TVShowsRepo tvShowsRepo;

  Future<void> fetchGenreMovies() async {
    emit(TvShowGenresLoading());

    var result = await tvShowsRepo.fetchGenresTVShows();

    result.fold((failure) {
      emit(
        TvShowGenresFailure(errorMessage: failure.errMessage),
      );
    }, (genres) {
      emit(
        TvShowGenresSuccess(genre: genres),
      );
    });
  }
}
