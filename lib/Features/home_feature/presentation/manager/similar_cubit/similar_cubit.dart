import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/data/models/movie_model/movie_model.dart';
import 'package:movie_app/Features/home_feature/data/models/tv_shows_model/tv_shows_model.dart';
import 'package:movie_app/Features/home_feature/data/repos/details_repo/details_repo.dart';

part 'similar_state.dart';

class SimilarCubit extends Cubit<SimilarState> {
  SimilarCubit(this.detailsRepo) : super(SimilarInitial());

  final DetailsRepo detailsRepo;

  Future<void> fetchSimilar({required int id}) async {
    emit(SimilarLloading());

    var result = await detailsRepo.fetchSimilar(id: id);

    result.fold((failure) {
      emit(
        SimilarFailure(errorMessage: failure.errMessage),
      );
    }, (similartMovies) {
      emit(
        SimilarSuccess(similartMovies: similartMovies),
      );
    });
  }

  Future<void> fetchSimilarTV({required int id}) async {
    emit(SimilarLloading());

    var result = await detailsRepo.fetchSimilarTv(id: id);

    result.fold((failure) {
      emit(
        SimilarFailure(errorMessage: failure.errMessage),
      );
    }, (similartTv) {
      emit(
        SimilarSuccess(similartTv: similartTv),
      );
    });
  }
}
