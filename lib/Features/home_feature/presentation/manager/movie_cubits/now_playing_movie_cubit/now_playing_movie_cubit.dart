import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/Features/home_feature/data/models/movie_model/movie_model.dart';
import 'package:movie_app/Features/home_feature/data/repos/movie_repo/movie_repo.dart';

part 'now_playing_movie_state.dart';

class NowPlayingMovieCubit extends Cubit<NowPlayingMovieState> {
  NowPlayingMovieCubit(this.movieRepo) : super(NowPlayingMovieInitial());

  final MovieRepo movieRepo;

  Future<void> fetchNowPlayingMovies() async {
    emit(NowPlayingMovieLoading());

    var result = await movieRepo.fetchNowPlayingMovies();

    result.fold((failure) {
      emit(
        NowPlayingMovieFailure(errorMessage: failure.errMessage),
      );
    }, (nowPlayingMovies) {
      emit(
        NowPlayingMovieSuccess(nowPlayingMovies: nowPlayingMovies),
      );
    });
  }
}
