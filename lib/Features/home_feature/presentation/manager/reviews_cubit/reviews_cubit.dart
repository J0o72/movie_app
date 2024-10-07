import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home_feature/data/models/details_model/reviews_model/result.dart';
import 'package:movie_app/Features/home_feature/data/repos/details_repo/details_repo.dart';

part 'reviews_state.dart';

class ReviewsCubit extends Cubit<ReviewsState> {
  ReviewsCubit(this.detailsRepo) : super(ReviewsInitial());

  final DetailsRepo detailsRepo;

  Future<void> fetchReviews(
      {required int id, required String fromWhere}) async {
    emit(ReviewsLoading());

    var result =
        await detailsRepo.fetchDetailsReviews(id: id, fromWhere: fromWhere);
    result.fold((failure) {
      emit(
        ReviewsFailure(errorMessage: failure.errMessage),
      );
    }, (reviews) {
      emit(
        ReviewsSuccess(review: reviews),
      );
    });
  }
}
