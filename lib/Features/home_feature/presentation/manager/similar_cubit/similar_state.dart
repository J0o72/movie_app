part of 'similar_cubit.dart';

sealed class SimilarState extends Equatable {
  const SimilarState();

  @override
  List<Object> get props => [];
}

final class SimilarInitial extends SimilarState {}

final class SimilarSuccess extends SimilarState {
  final List<MovieModel> similartMovies;

  const SimilarSuccess({required this.similartMovies});
}

final class SimilarLloading extends SimilarState {}

final class SimilarFailure extends SimilarState {
  final String errorMessage;

  const SimilarFailure({required this.errorMessage});
}
