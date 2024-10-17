import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/tv_shows_details/season.dart';
import 'package:movie_app/Features/home_feature/data/repos/season_repo/season_repo.dart';

part 'seasons_state.dart';

class SeasonsCubit extends Cubit<SeasonsState> {
  SeasonsCubit(this.seasonRepo) : super(SeasonsInitial());

  final SeasonRepo seasonRepo;

  Future<void> fetchSeasons({required num id}) async {
    emit(SeasonsLoading());
    var result = await seasonRepo.fetchSeasons(id: id);

    result.fold((failure) {
      emit(
        SeasonsFailure(errorMessage: failure.errMessage),
      );
    }, (seasons) {
      emit(
        SeasonsSuccess(seasons: seasons),
      );
    });
  }
}
