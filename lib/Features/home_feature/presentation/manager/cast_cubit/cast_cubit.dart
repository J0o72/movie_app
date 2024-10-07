import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/casts_model.dart';
import 'package:movie_app/Features/home_feature/data/repos/details_repo/details_repo.dart';

part 'cast_state.dart';

class CastCubit extends Cubit<CastState> {
  CastCubit(this.detailsRepo) : super(CastInitial());

  final DetailsRepo detailsRepo;

  Future<void> fetchCasts({required int id, required String fromWhere}) async {
    emit(CastLoading());

    var result =
        await detailsRepo.fetchDetailsCast(id: id, fromWhere: fromWhere);
    result.fold((failure) {
      emit(
        CastFailure(errorMessage: failure.errMessage),
      );
    }, (casts) {
      emit(
        CastSuccess(castsModel: casts),
      );
    });
  }
}
