import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/details_model/details_model.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/tv_shows_details/tv_shows_details_model.dart';
import 'package:movie_app/Features/home_feature/data/repos/details_repo/details_repo.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit(this.detailsRepo) : super(DetailsInitial());

  final DetailsRepo detailsRepo;
  final List<DetailsState> movieStates = [];

  Future<void> fetchDetails({required int id}) async {
    emit(DetailsLoading());
    var result = await detailsRepo.fetchDetails(id: id);

    result.fold((failure) {
      emit(
        DetailsFailure(errorMessage: failure.errMessage),
      );
    }, (details) {
      emit(
        DetailsSuccess(detailsModel: details),
      );
    });
  }

  Future<void> fetchTvShowsDetails({required int id}) async {
    emit(DetailsLoading());
    var result = await detailsRepo.fetchTvShowsDetails(id: id);

    result.fold((failure) {
      emit(
        DetailsFailure(errorMessage: failure.errMessage),
      );
    }, (tvdetails) {
      emit(
        DetailsSuccess(tvShowsDetailsModel: tvdetails),
      );
    });
  }
}
