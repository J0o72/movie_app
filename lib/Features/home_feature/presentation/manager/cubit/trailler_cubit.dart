import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/data/models/trailler_model/result.dart';
import 'package:movie_app/Features/home_feature/data/repos/details_repo/details_repo.dart';

part 'trailler_state.dart';

class TraillerCubit extends Cubit<TraillerState> {
  TraillerCubit(this.detailsRepo) : super(TraillerInitial());

  final DetailsRepo detailsRepo;

  Future<void> fetchTrailler(
      {required int id, required String fromWhere}) async {
    emit(TraillerLoading());
    var result = await detailsRepo.fetchTrailler(id: id, fromWhere: fromWhere);

    result.fold((failure) {
      emit(TraillerFailure(errorMessage: failure.errMessage));
    }, (trailler) {
      emit(TraillerSuccess(traillerResult: trailler));
    });
  }
}
