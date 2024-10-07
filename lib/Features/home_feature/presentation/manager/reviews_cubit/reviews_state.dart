part of 'reviews_cubit.dart';

sealed class ReviewsState extends Equatable {
  const ReviewsState();

  @override
  List<Object> get props => [];
}

final class ReviewsInitial extends ReviewsState {}

final class ReviewsSuccess extends ReviewsState {
  final List<ResultReviewsModel> review;

  const ReviewsSuccess({required this.review});
}

final class ReviewsFailure extends ReviewsState {
  final String errorMessage;

  const ReviewsFailure({required this.errorMessage});
}

final class ReviewsLoading extends ReviewsState {}
