part of 'seasons_cubit.dart';

sealed class SeasonsState extends Equatable {
  const SeasonsState();

  @override
  List<Object> get props => [];
}

final class SeasonsInitial extends SeasonsState {}

final class SeasonsSuccess extends SeasonsState {
  final List<SeasonModel> seasons;

  const SeasonsSuccess({required this.seasons});
}

final class SeasonsFailure extends SeasonsState {
  final String errorMessage;

  const SeasonsFailure({required this.errorMessage});
}

final class SeasonsLoading extends SeasonsState {}
