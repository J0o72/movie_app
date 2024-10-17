part of 'trailler_cubit.dart';

sealed class TraillerState extends Equatable {
  const TraillerState();

  @override
  List<Object> get props => [];
}

final class TraillerInitial extends TraillerState {}

final class TraillerLoading extends TraillerState {}

final class TraillerSuccess extends TraillerState {
  final TraillerResult traillerResult;

  const TraillerSuccess({required this.traillerResult});
}

final class TraillerFailure extends TraillerState {
  final String errorMessage;

  const TraillerFailure({required this.errorMessage});
}
