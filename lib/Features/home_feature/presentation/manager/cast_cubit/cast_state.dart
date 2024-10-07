part of 'cast_cubit.dart';

sealed class CastState extends Equatable {
  const CastState();

  @override
  List<Object> get props => [];
}

final class CastInitial extends CastState {}

final class CastSuccess extends CastState {
  final List<CastsModel>? castsModel;

  const CastSuccess({this.castsModel});
}

final class CastLoading extends CastState {}

final class CastFailure extends CastState {
  final String errorMessage;

  const CastFailure({required this.errorMessage});
}
